//
//  XibView.swift
//  MegaNotes
//
//  Created by Максим on 15.04.2022.
//

import UIKit

@IBDesignable
class XibView: UIView {

    var contentView: UIView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        guard let view = loadViewFromNib() else { return }

        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }

    private func loadViewFromNib() -> UIView? {
        let nibName = String(describing: type(of: self))
        let nib = UINib(nibName: nibName, bundle: Bundle(for: XibView.self))
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

}
