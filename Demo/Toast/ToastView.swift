//
//  ToastView.swift
//  Demo
//
//  Created by Hiroki Umatani on 2019/04/02.
//  Copyright © 2019 Playground. All rights reserved.
//

import UIKit
import PGFramework


protocol ToastViewDelegate: NSObjectProtocol{
    func tapCloseButton(_ sender: UIButton)
}

extension ToastViewDelegate {
    func tapCloseButton(_ sender: UIButton) {}
}
// MARK: - Property
class ToastView: BaseView {
    weak var delegate: ToastViewDelegate? = nil
    @IBOutlet weak var alphaView: UIView!
    @IBOutlet weak var toastView: UIView!
    @IBOutlet weak var closeImageView: UIImageView!
    @IBAction func tapCloseButton(_ sender: UIButton) {
        delegate?.tapCloseButton(sender)
    }
}

// MARK: - Life cycle
extension ToastView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegates()
        loadViews()
    }
}

// MARK: - Protocol
extension ToastView {

}

// MARK: - method
extension ToastView {
    func hide() {
        toastView.transform = CGAffineTransform.init(scaleX: 0.001, y: 0.001)
        alphaView.alpha = 0.0
        closeImageView.alpha = 0.0
        alpha = 0.0
    }

    func animateHide() {
        alpha = 0.0
        UIView.animate(withDuration: 0.4) { [weak self] in
            guard let this = self else { return }
            this.toastView.transform = CGAffineTransform.init(scaleX: 0.001, y: 0.001)
            this.alphaView.alpha = 0.0
            this.closeImageView.alpha = 0.0
        }
    }
    func animateShow() {
        alpha = 1.0
        UIView.animate(withDuration: 0.4) { [weak self] in
            guard let this = self else { return }
            this.toastView.transform = CGAffineTransform.identity
            this.alphaView.alpha = 0.5
            this.closeImageView.alpha = 1.0
        }
    }

    func updateView() {

    }

    private func setDelegates() {

    }

    private func loadViews() {
        setCornerRadius(toastView, radius: 10.0)
        setCornerRadius(closeImageView, radius: 18.0)
    }
}
