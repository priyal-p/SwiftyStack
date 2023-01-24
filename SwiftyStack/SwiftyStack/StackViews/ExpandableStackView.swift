//
//  AdaptiveStackView.swift
//  SwiftyStack
//
//  Created by Priyal PORWAL on 21/01/23.
//

import UIKit

protocol ExpandableStackViewDelegate: AnyObject {
    func didTapButtonAt(index: Int)
    func didTapHeaderAt(index: Int)
}

class ExpandableStackView: UIView {
    struct ViewData {
        let headerView: UIView
        let detailView: UIView
        let ctaTitle: String
        let backgroundColor: UIColor

        init(headerView: UIView,
             detailView: UIView,
             ctaTitle: String,
             backgroundColor: UIColor?) {
            self.headerView = headerView
            self.detailView = detailView
            self.ctaTitle = ctaTitle
            self.backgroundColor = backgroundColor ?? .black
        }
    }

    private let headerContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        return stackView
    }()
    
    private let headerView: UIView

    private let detailView: UIView

    private let dropDownImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.isHidden = true
        return imageView
    }()
    
    private let cardButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return button
    }()
    
    var isCollapsed: Bool
    
    func collapseView(withAnimation: Bool) {
        self.dropDownImageView.isHidden = true
        if withAnimation {
            animate()
        } else {
            self.toggleInnerStack(isCollapsed)
            self.updateInnerStackAppearance(isCollapsed)
        }
        self.cardButton.isHidden = isCollapsed
    }
    
    private let outerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        return stackView
    }()
    
    private let innerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets.zero
        return stackView
    }()
    
    private let spacer: UIView = {
        let spacer = UIView()
        spacer.translatesAutoresizingMaskIntoConstraints = false
        return spacer
    }()
    
    let viewID: Int
    private weak var delegate: ExpandableStackViewDelegate?
    
    init(viewData: ViewData,
         viewID: Int,
         delegate: ExpandableStackViewDelegate?,
         isCollapsed: Bool = false,
         dropDownImage: UIImage? = .downArrow) {
        self.headerView = viewData.headerView
        self.detailView = viewData.detailView

        self.dropDownImageView.image = dropDownImage?
            .withAlignmentRectInsets(UIEdgeInsets(top: 0,
                                                  left: 0,
                                                  bottom: 0,
                                                  right: -10))
            .withRenderingMode(.alwaysTemplate)

        self.isCollapsed = isCollapsed
        self.cardButton.setTitle(viewData.ctaTitle,
                                 for: .normal)
        self.viewID = viewID
        self.delegate = delegate
        super.init(frame: .zero)
        self.backgroundColor = viewData.backgroundColor
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    private func addHeaderGesture() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(expandStack))
        headerContainer.addGestureRecognizer(tapGesture)
    }
    
    @objc func expandStack() {
        if !isCollapsed { return }

        isCollapsed = !isCollapsed
        collapseView(withAnimation: false)
        delegate?.didTapHeaderAt(index: viewID)
    }
    
    func animate() {
        UIView.transition(
            with: self.innerStack,
            duration: 0.3,
            options: .curveEaseIn,
            animations: { [weak self] in
                guard let self else { return }
                self.toggleInnerStack(self.isCollapsed)
            }) { [weak self] _ in
                guard let self else { return }
                self.updateInnerStackAppearance(self.isCollapsed)
            }
    }
    
    private func toggleInnerStack(_ isHidden: Bool) {
        self.innerStack.isHidden = isHidden
        self.dropDownImageView.isHidden = !isHidden
    }
    
    private func updateInnerStackAppearance(_ isHidden: Bool) {
        self.innerStack.alpha = isHidden ? 0 : 1
    }
    
    func commonInit() {
        setUI()
        setHierarchy()
        setConstraints()
        addHeaderGesture()
    }
    
    func setUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.translatesAutoresizingMaskIntoConstraints = false

        self.clipsToBounds = true
        self.layer.cornerRadius = 20
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

        innerStack.isHidden = isCollapsed
        innerStack.alpha = isCollapsed ? 0 : 1

        self.cardButton.addAction(UIAction(handler: {[weak self] _ in
            guard let self else { return }
            self.delegate?.didTapButtonAt(index: self.viewID)
        }), for: .touchUpInside)
    }
    
    func setHierarchy() {
        headerContainer.addArrangedSubview(headerView)
        headerContainer.addArrangedSubview(dropDownImageView)

        innerStack.addArrangedSubview(detailView)
        innerStack.addArrangedSubview(spacer)

        outerStack.addArrangedSubview(headerContainer)
        outerStack.addArrangedSubview(innerStack)
        outerStack.addArrangedSubview(cardButton)

        addSubviews(outerStack)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            outerStack.leadingAnchor.constraint(
                equalTo: self.leadingAnchor),
            outerStack.trailingAnchor.constraint(
                equalTo: self.trailingAnchor),
            outerStack.topAnchor.constraint(
                equalTo: self.topAnchor),
            outerStack.bottomAnchor.constraint(
                equalTo: self.bottomAnchor),
            
            cardButton.heightAnchor.constraint(
                equalToConstant: CGFloat(60))
        ])
    }
}
