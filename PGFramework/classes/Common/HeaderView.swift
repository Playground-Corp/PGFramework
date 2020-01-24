//
//  HeaderView.swift
//  PGApp2
//
//  Created by Hiroki Umatani on 2020/01/08.
//  Copyright © 2020 Playground. All rights reserved.
//

import UIKit

// MARK: - Delegate

public protocol HeaderViewDelegate: NSObjectProtocol {
    func touchLeftButton(_ sender: UIButton)
    func touchRightButton(_ sender: UIButton)
}


extension HeaderViewDelegate {
    public func touchLeftButton(_ sender: UIButton) {}
    public func touchRightButton(_ sender: UIButton) {}
}


// MARK: - Property
public class HeaderView: UIView {
    // delegate
    public weak var delegate: HeaderViewDelegate? = nil

    // outlet
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var rightButton: UIButton!

    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var leftButton: UIButton!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var centerImageView: UIImageView!


    // action
    @IBAction func touchLeftButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchLeftButton(sender)
        }
    }

    @IBAction func touchRightButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchRightButton(sender)
        }
    }
}

// MARK: - Life cycle
extension HeaderView {
    override open func awakeFromNib() {
        super.awakeFromNib()

        let bundle = Bundle(for: type(of: self))
        let view = bundle.loadNibNamed("HeaderView", owner: self, options: nil)!.first as! UIView

        view.frame = bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(view)

        // title label
        titleLabel.isHidden = true

        // right button
        rightButton.isHidden = true

        // left button
        leftButton.isHidden = true
    }
}

// MARK: - Protocol
extension HeaderView {

}

// MARK: - method
extension HeaderView {
    public func updateCenter(text: String) {
        titleLabel.text = text
        titleLabel.isHidden = false
    }

    public func updateCenter(image: UIImage) {
        centerImageView.image = image
        centerImageView.isHidden = false
    }

    public func updateLeft(text: String) {
        leftButton.setTitle(text, for: .normal)
        leftButton.isHidden = false
    }

    public func updateLeft(image: UIImage) {
        leftImageView.image = image
        leftButton.isHidden = false
        leftButton.setTitle(nil, for: .normal)
    }

    public func updateRight(text: String) {
        rightButton.setTitle(text, for: .normal)
        rightButton.isHidden = false
    }

    public func updateRight(image: UIImage) {
        rightImageView.image = image
        rightButton.isHidden = false
        rightButton.setTitle(nil, for: .normal)
    }
}

