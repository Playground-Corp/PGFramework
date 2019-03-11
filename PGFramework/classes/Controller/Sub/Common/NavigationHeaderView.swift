//
//  NavigationHeaderView.swift
//  Sam
//
//  Created by Hiroki Umatani on 2018/11/17.
//  Copyright © 2018 Engineer. All rights reserved.
//

import UIKit

// MARK: - Delegate
protocol NavigationHeaderViewDelegate: NSObjectProtocol {
    func touchedTitleButton(_ sender: UIButton)
    func touchedLeftButton(_ sender: UIButton)
    func touchedRightButton(_ sender: UIButton)
}

extension NavigationHeaderViewDelegate {
    func touchedTitleButton(_ sender: UIButton) {}
    func touchedLeftButton(_ sender: UIButton) {}
    func touchedRightButton(_ sender: UIButton) {}
}


// MARK: - Property
class NavigationHeaderView: BaseView {
    // delegate
    weak var delegate: NavigationHeaderViewDelegate? = nil

    // outlet
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var titleButton: UIButton!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!

    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!


    // action
    @IBAction func touchTitleButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedTitleButton(sender)
        }
    }
    
    @IBAction func touchLeftButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedLeftButton(sender)
        }
    }
    
    @IBAction func touchRightButton(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.touchedRightButton(sender)
        }
    }
}

// MARK: - Life cycle
extension NavigationHeaderView {
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.isHidden = true
        leftLabel.isHidden = true
        rightLabel.isHidden = true

        titleImageView.isHidden = true
        leftImageView.isHidden = true
        rightImageView.isHidden = true

        titleButton.isEnabled = false
        leftButton.isEnabled = false
        rightButton.isEnabled = false
    }
}

// MARK: - Protocol
extension NavigationHeaderView {
    
}

// MARK: - method
extension NavigationHeaderView {
    func updateTitle(text: String, color: UIColor? = nil) {
        if text.isEmpty {
            titleButton.isEnabled = false
            titleLabel.isHidden = true
        } else {
            titleLabel.text = text
            titleLabel.isHidden = false
            titleButton.isEnabled = true
            titleImageView.isHidden = true
        }

        if color != nil {
            titleLabel.textColor = color
        } else {
            titleLabel.textColor = .black
        }
    }
    
    func updateLeft(text: String, color: UIColor? = nil) {
        if text.isEmpty {
            leftLabel.isHidden = true
            leftButton.isEnabled = false
        } else {
            leftLabel.text = text
            leftLabel.isHidden = false
            leftButton.isEnabled = true
            leftImageView.isHidden = true
        }

        if color != nil {
            leftLabel.textColor = color
        } else {
            leftLabel.textColor = .blue
        }
    }
    
    func updateRight(text: String, color: UIColor? = nil) {
        if text.isEmpty {
            rightLabel.isHidden = true
            rightButton.isEnabled = false
        } else {
            rightLabel.text = text
            rightLabel.isHidden = false
            rightButton.isEnabled = true
            rightImageView.isHidden = true
        }

        if color != nil {
            rightLabel.textColor = color
        } else {
            rightLabel.textColor = .blue
        }
    }

    func updateTitle(image: UIImage?) {
        if image == nil {
            titleImageView.isHidden = true
            titleButton.isEnabled = false
        } else {
            titleImageView.image = image
            titleLabel.isHidden = true
            titleButton.isEnabled = true
            titleImageView.isHidden = false
        }
    }

    func updateLeft(image: UIImage?) {
        if image == nil {
            leftImageView.isHidden = true
            leftButton.isEnabled = false
        } else {
            leftImageView.image = image
            leftLabel.isHidden = true
            leftButton.isEnabled = true
            leftImageView.isHidden = false
        }
    }
    
    func updateRight(image: UIImage?) {
        if image == nil {
            rightImageView.isHidden = true
            rightButton.isEnabled = false
        } else {
            rightImageView.image = image
            rightLabel.isHidden = true
            rightButton.isEnabled = true
            rightImageView.isHidden = false
        }
    }

}

