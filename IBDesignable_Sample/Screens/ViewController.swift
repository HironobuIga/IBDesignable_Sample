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
    
    
    // MARK: - Property
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBaseView()
        setupView()
    }
    
    // MARK: - Function
    
}

// MARK: - Private Function
private extension ViewController {
    func setupView() {
    }
    
    func setupBaseView() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        scrollView.contentInsetAdjustmentBehavior = .never
    }
}

final class NavigationController: UINavigationController {
    override var childForStatusBarStyle: UIViewController? {
        return viewControllers.first
    }
}
