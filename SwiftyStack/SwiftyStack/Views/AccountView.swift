//
//  AccountView.swift
//  SwiftyStack
//
//  Created by Priyal PORWAL on 24/01/23.
//

import UIKit
class AccountView: UIView {
    private let bankImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .clear
        imageView.tintColor = .white
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()

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
                       bankImage: UIImage?) {
        titleLabel.text = titleText
        subTitleLabel.text = subTitleText
        bankImageView.image = bankImage
    }
}

private extension AccountView {
    func commonInit() {
        setUI()
        setHierarchy()
        setConstraints()
    }

    func setUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func setHierarchy() {
        addSubviews(bankImageView, titleLabel, subTitleLabel)
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            bankImageView.leadingAnchor.constraint(
                equalTo: self.leadingAnchor, constant: 15),
            bankImageView.widthAnchor.constraint(equalToConstant: 50),
            bankImageView.heightAnchor.constraint(equalToConstant: 50),
            bankImageView.topAnchor.constraint(equalTo: self.topAnchor,
                                               constant: 15),
            bankImageView.bottomAnchor.constraint(
                equalTo: self.bottomAnchor, constant: -15),

            titleLabel.leadingAnchor.constraint(
                equalTo: bankImageView.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(
                equalTo: self.trailingAnchor, constant: -15),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                            constant: 15),

            subTitleLabel.leadingAnchor.constraint(
                equalTo: titleLabel.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(
                equalTo: self.trailingAnchor, constant: -15),
            subTitleLabel.topAnchor.constraint(
                equalTo: self.titleLabel.bottomAnchor, constant: 5)
        ])
    }
}
