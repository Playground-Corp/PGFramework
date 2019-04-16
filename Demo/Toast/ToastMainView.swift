//
//  ToastMainView.swift
//  Demo
//
//  Created by Hiroki Umatani on 2019/04/02.
//  Copyright © 2019 Playground. All rights reserved.
//

import UIKit
import PGFramework


protocol ToastMainViewDelegate: NSObjectProtocol{
    func touchedShowToastButton(_ sender: UIButton)
}

extension ToastMainViewDelegate {
    func touchedShowToastButton(_ sender: UIButton) {}
}
// MARK: - Property
class ToastMainView: BaseView {
    weak var delegate: ToastMainViewDelegate? = nil
    @IBAction func touchedShowToastButton(_ sender: UIButton) {
        delegate?.touchedShowToastButton(sender)
    }
}

// MARK: - Life cycle
extension ToastMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegates()
        loadViews()
    }
}

// MARK: - Protocol
extension ToastMainView {

}

// MARK: - method
extension ToastMainView {
    func updateView() {

    }

    private func setDelegates() {

    }

    private func loadViews() {

    }
}
