//
//  DetailView.swift
//  SwiftyStack
//
//  Created by Priyal PORWAL on 21/01/23.
//

import UIKit

class DetailView: UIView {
    private var outerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.gray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.gray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let spacer: UIView = {
        let spacer = UIView()
        spacer.translatesAutoresizingMaskIntoConstraints = false
        return spacer
    }()
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    func configureView(titleText: String,
                       subTitleText: String,
                       backgroundColor: UIColor) {
        titleLabel.text = titleText
        subTitleLabel.text = subTitleText
        spacer.backgroundColor = backgroundColor
    }
}

private extension DetailView {
    func commonInit() {
        setUI()
        setHierarchy()
        setConstraints()
    }

    func setUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func setHierarchy() {
        addSubviews(outerStack)
        outerStack.addArrangedSubview(titleLabel)
        outerStack.addArrangedSubview(subTitleLabel)
        outerStack.addArrangedSubview(spacer)
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            outerStack.leadingAnchor.constraint(
                equalTo: self.leadingAnchor, constant: 15),
            outerStack.trailingAnchor.constraint(
                equalTo: self.trailingAnchor, constant: -15),
            outerStack.topAnchor.constraint(
                equalTo: self.topAnchor, constant: 15),
            outerStack.bottomAnchor.constraint(
                equalTo: self.bottomAnchor, constant: -15)
        ])
    }
}
