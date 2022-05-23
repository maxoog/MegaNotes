//
//  NoteCellView.swift
//  MegaNotes
//
//  Created by Максим on 10.04.2022.
//

import UIKit

@IBDesignable
class NoteCellView: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    public var note: TextNote? {
        didSet {
            self.label.text = note?.text
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        self.backgroundColor = .blue
        let xibView = loadViewFromXib()
        xibView.frame = self.bounds
//        xibView.isHidden = true
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        xibView.layer.cornerRadius = 30
        self.addSubview(xibView)
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
         setNeedsLayout()
         layoutIfNeeded()
         let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
         frame.size.height = ceil(size.height)
         layoutAttributes.frame = frame
         return layoutAttributes
         
    }
    
    private func loadViewFromXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "NoteCellView", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first! as! UIView
    }
    
}
