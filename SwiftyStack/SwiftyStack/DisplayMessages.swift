//
//  DisplayMessages.swift
//  SwiftyStack
//
//  Created by Priyal PORWAL on 24/01/23.
//

enum DisplayMessages {
    static let title = "Schedule Payment"
    
    enum AmountCard {
        static let title = "Priyal, how much do you want to pay?"
        static let subTitle = "move the dial and select the amount you want to pay upto Rs. 50,000"
        static let ctaTitle = "Select From Account"
    }

    enum FromAccountCard {
        static let title = "Select From Account"
        static let subTitle = "Your Account"
        static let ctaTitle = "Select To Account"

        enum FromAccountDetails {
            static let title = "HSBC ****5026"
            static let subTitle = "Bank Account"
        }
    }

    enum ToAccountCard {
        static let title = "Select To Account"
        static let subTitle = "Beneficiary's Account"
        static let ctaTitle = "Proceed"

        enum ToAccountDetails {
            static let title = "ICICI ****8396"
            static let subTitle = "Bank Account"
        }
    }
}
