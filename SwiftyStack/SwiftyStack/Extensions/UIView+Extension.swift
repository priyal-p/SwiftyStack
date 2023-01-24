//
//  UIView+Extension.swift
//  SwiftyStack
//
//  Created by Priyal PORWAL on 22/01/23.
//

import UIKit

extension UIView {

    /// This function adds multiple subviews to a parent view at once.
    /// - Parameters:
    ///   - views: The views to be added as subviews.
    /// - Note: It also sets the translatesAutoresizingMaskIntoConstraints property of each view to false.
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

extension UIStackView {
    /// This function adds multiple arranged subviews to a UIStackView at once.
    /// - Parameters:
    ///   - orderedViews: The views to be added as arranged subviews in the order they are provided in the array.
    func addArrangedSubviews(_ orderedViews: [UIView]) {
        orderedViews.forEach { view in
            addArrangedSubview(view)
        }
    }
}
