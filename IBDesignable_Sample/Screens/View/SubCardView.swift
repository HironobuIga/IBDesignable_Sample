//
//  SubCardView.swift
//  IBDesignable_Sample
//
//  Created by HironobuIga on 2019/01/20.
//  Copyright © 2019 iganin. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
final class SubCardView: UIView {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var outlineLabel: UILabel!
    
    // MARK: - Property
    @IBInspectable
    private var image: UIImage? {
        set { imageView.image = newValue }
        get { return imageView.image }
    }
    @IBInspectable
    private var name: String? {
        didSet { nameLabel.text = name }
    }
    @IBInspectable
    private var category: String? {
        didSet { categoryLabel.text = category }
    }
    @IBInspectable
    private var outlineText: String? {
        didSet { outlineLabel.text = outlineText }
    }
    @IBInspectable
    private var cardBorderWidth: CGFloat {
        set { cardView.layer.borderWidth = newValue }
        get { return cardView.layer.borderWidth }
    }
    @IBInspectable
    private var cardBorderColor: UIColor {
        set { cardView.layer.borderColor = newValue.cgColor }
        get { return UIColor(cgColor: cardView.layer.borderColor ?? UIColor.clear.cgColor) }
    }
    @IBInspectable
    private var cardCornerRadius: CGFloat {
        set { cardView.layer.cornerRadius = newValue }
        get { return cardView.layer.cornerRadius }
    }
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiateFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // 初期化時に実行したい処理を記述
        // この時点ではnibは読み込まれていない
        instantiateFromNib()
    }
    
    override func awakeFromNib() {
        // 初期化時に実行したい処理を記述
        // この時点ではnibは読み込まれ@IBOutletのプロパティは存在
        super.awakeFromNib()
        commonInit()
    }
    
    override func prepareForInterfaceBuilder() {
        // 初期化時に実行したい処理を記述
        // InterfaceBuilder上ではawakeFromNibなどは処理されないため
        // こちらに初期化時で表示に関連する処理を書く
        // viewの角丸、borderなど
        super.prepareForInterfaceBuilder()
        commonInit()
    }
    
    // MARK: - Function
    func configure(withSampleData data: SampleData) {
        image = UIImage(named: data.imageName)
        name = data.name
        category = data.category
        outlineText = data.outlineText
    }
}

// MARK: - Private Function
private extension SubCardView {
    func instantiateFromNib() {
        let nib = UINib(nibName: "SubCardView", bundle: Bundle(for: type(of: self)))
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    func commonInit() {
        // 必要に応じて記述
    }
}
