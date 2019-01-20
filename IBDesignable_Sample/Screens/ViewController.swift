//
//  ViewController.swift
//  IBDesignable_Sample
//
//  Created by HironobuIga on 2019/01/17.
//  Copyright © 2019 iganin. All rights reserved.
//

import UIKit
import UIComponent

final class ViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var scrollView: UIScrollView!
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var mainNameLabel: UILabel!
    @IBOutlet weak var mainCategoryLabel: UILabel!
    @IBOutlet weak var mainOutlineLabel: UILabel!
    
    @IBOutlet var subCardViews: [SubCardView]!
    
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
        subCardViews.enumerated().forEach { (index, subCardview) in
            let data = subDataList[index]
            subCardview.configure(
                withImageName: data.imageName,
                name: data.name,
                category: data.category,
                outlineText: data.outlineText
            )
        }
    }
}

final class NavigationController: UINavigationController {
    override var childForStatusBarStyle: UIViewController? {
        return viewControllers.first
    }
}
