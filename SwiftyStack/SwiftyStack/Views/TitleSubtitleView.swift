//
//  TitleSubtitleView.swift
//  SwiftyStack
//
//  Created by Priyal PORWAL on 21/01/23.
//

import UIKit

class TitleSubtitleView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .lightGray
        label.font = label.font.withSize(16)
        return label
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
        self.backgroundColor = backgroundColor
    }
}

private extension TitleSubtitleView {
    func commonInit() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setContentHuggingPriority(.required, for: .vertical)
        setHierarchy()
        setConstraints()
    }

    func setHierarchy() {
        addSubviews(titleLabel)
        addSubviews(subTitleLabel)
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(
                equalTo: self.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(
                equalTo: self.trailingAnchor, constant: -15),
            titleLabel.topAnchor.constraint(
                equalTo: self.topAnchor, constant: 15),

            subTitleLabel.leadingAnchor.constraint(
                equalTo: self.leadingAnchor, constant: 15),
            subTitleLabel.trailingAnchor.constraint(
                equalTo: self.trailingAnchor, constant: -15),
            subTitleLabel.topAnchor.constraint(
                equalTo: self.titleLabel.bottomAnchor, constant: 15),
            subTitleLabel.bottomAnchor.constraint(
                equalTo: self.bottomAnchor, constant: -15)
        ])
    }
}
