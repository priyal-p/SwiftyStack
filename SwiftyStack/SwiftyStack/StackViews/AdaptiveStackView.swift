//
//  AdaptiveStackView.swift
//  SwiftyStack
//
//  Created by Priyal PORWAL on 24/01/23.
//

import UIKit

class AdaptiveStackView: UIView {
    private var stackViews: [ExpandableStackView] = []

    private var outerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 2
        return stackView
    }()

    
    private let viewData: [ExpandableStackView.ViewData]
    init(viewData: [ExpandableStackView.ViewData]) {
        self.viewData = viewData
        super.init(frame: .zero)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

private extension AdaptiveStackView {
    func commonInit() {
        setUI()
        setHeirarchy()
        setConstraints()
    }

    func setUI() {
        var stackViews: [ExpandableStackView] = []
        for (index, data) in viewData.enumerated() {
            let expandableStackView = ExpandableStackView(
                viewData: data,
                viewID: index + 1,
                delegate: self,
                isCollapsed: index != 0)
            expandableStackView.isHidden = index != 0
            stackViews.append(expandableStackView)
        }
        self.stackViews = stackViews
    }

    func setHeirarchy() {
        self.addSubviews(outerStack)
        outerStack.addArrangedSubviews(stackViews)
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            outerStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            outerStack.topAnchor.constraint(lessThanOrEqualTo: self.topAnchor),
            outerStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            outerStack.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}

extension AdaptiveStackView: ExpandableStackViewDelegate {
    func didTapButtonAt(index: Int) {
        self.stackViews.forEach { view in
            if view.viewID == index &&
                index == stackViews.count {
                // Last Stage
                return
            }
            if view.viewID == index {
                view.isCollapsed = true
                view.alpha =  1 * CGFloat(50 - (stackViews.count - view.viewID)*5)/100
                view.collapseView(withAnimation: false)
            } else if view.viewID == index + 1,
                      index + 1 <= stackViews.count {
                view.isHidden = false
                view.isCollapsed = false
                view.alpha = 1
                view.collapseView(withAnimation: true)
            } else if view.viewID < index {
                view.isHidden = false
            }
        }
    }

    func didTapHeaderAt(index: Int) {
        self.stackViews.forEach { view in
            if view.viewID > index {
                view.isHidden = true
                view.isCollapsed = true
            } else if view.viewID == index {
                view.isHidden = false
                view.alpha = 1
            }
        }
    }
}
