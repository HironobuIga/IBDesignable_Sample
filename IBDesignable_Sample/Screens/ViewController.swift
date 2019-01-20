//
//  ViewController.swift
//  IBDesignable_Sample
//
//  Created by HironobuIga on 2019/01/17.
//  Copyright © 2019 iganin. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var scrollView: UIScrollView!
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var mainNameLabel: UILabel!
    @IBOutlet weak var mainCategoryLabel: UILabel!
    @IBOutlet weak var mainOutlineLabel: UILabel!
    
    @IBOutlet var subBaseViews: [UIView]!
    @IBOutlet var subImageViews: [UIImageView]!
    @IBOutlet var subNameLabels: [UILabel]!
    @IBOutlet var subCategoryLabels: [UILabel]!
    @IBOutlet var subOutlineLabels: [UILabel]!
    
    // MARK: - Property
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBaseParts()
        setupMainParts()
        setupSubParts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.contentInset.bottom = view.safeAreaInsets.bottom + 30.0
    }
    
}

// MARK: - Private Function
private extension ViewController {
    func setupBaseParts() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        scrollView.contentInsetAdjustmentBehavior = .never
    }

    func setupMainParts() {
        let mainData = SampleDataFactory.makeMainData()
        headerImageView.image = UIImage(named: mainData.imageName)
        mainNameLabel.text = mainData.name
        mainCategoryLabel.text = mainData.category
        mainOutlineLabel.text = mainData.outlineText
    }
    
    func setupSubParts() {
        let subDataList = SampleDataFactory.makeSubDataList()
        subDataList.enumerated().forEach { (index, data) in
            subImageViews[index].image = UIImage(named: data.imageName)
            subNameLabels[index].text = data.name
            subCategoryLabels[index].text = data.category
            subOutlineLabels[index].text = data.outlineText
        }
        
        subBaseViews.forEach { view in
            view.layer.cornerRadius = 6.0
            view.layer.borderWidth = 1.0
            view.layer.borderColor = UIColor.darkGray.cgColor
        }
    }
}

final class NavigationController: UINavigationController {
    override var childForStatusBarStyle: UIViewController? {
        return viewControllers.first
    }
}
