//
//  AmountView.swift
//  SwiftyStack
//
//  Created by Priyal PORWAL on 22/01/23.
//

import UIKit

class AmountView: UIView {
    private let containerView = UIView()
    
    let knob = Knob()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        commonInit()
        knob.lineWidth = 10
        knob.pointerLength = 20
        knob.contentMode = .scaleToFill
        knob.addTarget(self,
                       action: #selector(handleValueChanged(_:)),
                       for: .valueChanged)
        
        updateLabel()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    @objc func handleValueChanged(_ sender: Any) {
        updateLabel()
    }
    
    private func updateLabel() {
        valueLabel.text = String(format: "%.2f", knob.value)
    }
}

private extension AmountView {
    func commonInit() {
        setUI()
        setHeirarchy()
        setConstraints()
    }

    func setUI() {
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
    }

    func setHeirarchy() {
        addSubviews(containerView)
        containerView.addSubviews(knob, valueLabel)
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),

            knob.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 50),
            knob.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            knob.heightAnchor.constraint(equalToConstant: 250),
            knob.widthAnchor.constraint(equalToConstant: 250),
            valueLabel.topAnchor.constraint(equalTo: knob.bottomAnchor, constant: 20),
            valueLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }
}
