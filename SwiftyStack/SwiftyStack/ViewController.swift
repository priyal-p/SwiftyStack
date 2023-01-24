//
//  ViewController.swift
//  SwiftyStack
//
//  Created by Priyal PORWAL on 21/01/23.
//

import UIKit

class ViewController: UIViewController {
    private lazy var adaptiveStackView: AdaptiveStackView = {
        return createAdaptiveStack()
    }()

    // MARK:- Lifecycle Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpNavigationBar()
        self.view.backgroundColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }

    // MARK:- Private Methods
    private func commonInit() {
        setHeirarchy()
        setConstraints()
    }

    /// This function sets the hierarchy of the view.
    private func setHeirarchy() {
        view.addSubviews(adaptiveStackView)
    }

    /// This function sets the constraints for the adaptiveStackView.
    /// It ensures that the adaptiveStackView is aligned to the leading, top, bottom, and trailing anchors of the view.
    /// Additionally, it ensures that the top anchor of the adaptiveStackView is less than or equal to the top anchor of the view's safe area layout guide.
    private func setConstraints() {
        NSLayoutConstraint.activate([
            adaptiveStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            adaptiveStackView.topAnchor.constraint(lessThanOrEqualTo: self.view.safeAreaLayoutGuide.topAnchor),
            adaptiveStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            adaptiveStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }

    private func setUpNavigationBar() {
        navigationItem.title = DisplayMessages.title
    }
}

extension ViewController {
    /// This function creates AdaptiveStackView
    func createAdaptiveStack() -> AdaptiveStackView {
        let headerView = TitleSubtitleView()
        headerView.configureView(
            titleText: DisplayMessages.AmountCard.title,
            subTitleText: DisplayMessages.AmountCard.subTitle,
            backgroundColor: .darkGray)

        let headerView2 = TitleSubtitleView()
        headerView2.configureView(
            titleText: DisplayMessages.FromAccountCard.title,
            subTitleText: DisplayMessages.FromAccountCard.subTitle,
            backgroundColor: SwiftyColors.darkishGray.color)

        let headerView3 = TitleSubtitleView()
        headerView3.configureView(
            titleText: DisplayMessages.ToAccountCard.title,
            subTitleText: DisplayMessages.ToAccountCard.subTitle,
            backgroundColor: SwiftyColors.lightishGray.color)

        let amountView = AmountView()

        let fromAccountView = AccountView()
        fromAccountView.configureView(
            titleText: DisplayMessages.FromAccountCard.FromAccountDetails.title,
            subTitleText: DisplayMessages.FromAccountCard.FromAccountDetails.subTitle,
            bankImage: .bankImage1)

        let toAccountView = AccountView()
        toAccountView.configureView(
            titleText: DisplayMessages.ToAccountCard.ToAccountDetails.title,
            subTitleText: DisplayMessages.ToAccountCard.ToAccountDetails.subTitle,
            bankImage: .bankImage2)

        let viewData1 = ExpandableStackView.ViewData(
            headerView: headerView,
            detailView: amountView,
            ctaTitle: DisplayMessages.AmountCard.ctaTitle,
            backgroundColor: .darkGray)

        let viewData2 = ExpandableStackView.ViewData(
            headerView: headerView2,
            detailView: fromAccountView,
            ctaTitle: DisplayMessages.FromAccountCard.ctaTitle,
            backgroundColor: SwiftyColors.darkishGray.color)

        let viewData3 = ExpandableStackView.ViewData(
            headerView: headerView3,
            detailView: toAccountView,
            ctaTitle: DisplayMessages.ToAccountCard.ctaTitle,
            backgroundColor: SwiftyColors.lightishGray.color)

        let viewData: [ExpandableStackView.ViewData] = [viewData1,
                                                        viewData2,
                                                        viewData3]

        return AdaptiveStackView(viewData: viewData)
    }
}
