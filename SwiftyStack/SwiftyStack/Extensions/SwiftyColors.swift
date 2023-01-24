//
//  SwiftyColors.swift
//  SwiftyStack
//
//  Created by Priyal PORWAL on 24/01/23.
//

import UIKit

/// This is a protocol that defines a single required property, `color`.
/// Any type that conforms to this protocol must provide a gettable `color` property of type `UIColor`.
protocol Colorable {
    /// The color property of any type that conforms to this protocol
    var color: UIColor { get }
}

/// This is an enumeration of possible colors used in the application.
/// Each case is a unique color with a raw value of type String
/// It conforms to the Colorable protocol.
/// It provides an implementation of the `color` property that returns a `UIColor` with the same name as the enumeration case.
enum SwiftyColors: String {
    /// Darkish gray color
    case darkishGray
    /// Lightish gray color
    case lightishGray
    /// Indigo color
    case indigo
}

extension SwiftyColors: Colorable {
    /// Implementation of the color property of the `Colorable` protocol for the `SwiftyColors` enumeration using the `UIColor(named:in:compatibleWith:)` initializer.
    /// - Note: It attempts to create a UIColor object with the same name as the enumeration case and returns it, but if it's not found it throws an assertion failure and returns a clear color.
    var color: UIColor {
        if let color = UIColor(named: self.rawValue,
                               in: .main,
                               compatibleWith: .none) {
            return color
        } else {
            assertionFailure("Missing Color Asset named: \(self.rawValue)")
            return .clear
        }
    }
}
