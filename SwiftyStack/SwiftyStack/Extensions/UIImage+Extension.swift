//
//  UIImage+Extension.swift
//  SwiftyStack
//
//  Created by Priyal PORWAL on 24/01/23.
//

import UIKit

extension UIImage {
    static var downArrow: UIImage {
        return getImage(named: "arrow")
    }

    static var bankImage1: UIImage {
        return getImage(named: "hsbcBank")
    }

    static var bankImage2: UIImage {
        return getImage(named: "iciciBank")
    }

    /// This is a static function that returns an image with the specified name.
    /// - Parameters:
    ///   - imageName: The name of the image to be returned.
    /// - Returns: UIImage with the specified name.
    /// - Note: If the image with the specified name is not found, an assertion failure is thrown and an empty UIImage is returned.
    static func getImage(named imageName: String) -> UIImage {
        if let image = UIImage(named: imageName, in: .main, compatibleWith: nil) {
            return image
        } else {
            assertionFailure("Missing Image Asset named: \(imageName)")
            return UIImage()
        }
    }
}
