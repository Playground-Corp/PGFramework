//
//  ToastViewController.swift
//  Demo
//
//  Created by Hiroki Umatani on 2019/04/02.
//  Copyright © 2019 Playground. All rights reserved.
//

import UIKit
import PGFramework


// MARK: - Property
class ToastViewController: BaseViewController {
    @IBOutlet weak var toastMainView: ToastMainView!
    @IBOutlet weak var toastView: ToastView!
}

// MARK: - Life cycle
extension ToastViewController {
    override func loadView() {
        super.loadView()
        setDelegates()
        loadViews()
    }
}

// MARK: - Protocol
extension ToastViewController: ToastMainViewDelegate {
    func touchedShowToastButton(_ sender: UIButton) {
        toastView.animateShow()
    }
}

extension ToastViewController: ToastViewDelegate {
    func tapCloseButton(_ sender: UIButton) {
        toastView.tapCloseButton(sender)
    }
}
// MARK: - method
extension ToastViewController {
    private func setDelegates() {
        toastMainView.delegate = self
        toastView.delegate = self
    }

    private func loadViews() {
        toastView.hide()
    }
}
