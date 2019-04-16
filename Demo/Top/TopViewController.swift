
//
//  TopViewController.swift
//  Demo
//
//  Created by Hiroki Umatani on 2019/03/12.
//  Copyright © 2019 Playground. All rights reserved.
//

import UIKit
import PGFramework


// MARK: - Property
class TopViewController: BaseViewController {
    @IBOutlet weak var topMainView: TopMainView!
    var topViewListModel: ListModel<TopViewModel> = TopViewModel.loadPropertyList()
}

// MARK: - Life cycle
extension TopViewController {
    override func loadView() {
        super.loadView()
        setDelegates()
        topMainView.updateView(topViewListModel: topViewListModel)
    }
}

// MARK: - Protocol
extension TopViewController: TopMainViewDelegate {
    func touchedCell(topViewModel: TopViewModel) {
        let toastViewController = ToastViewController()
        transitionViewController(from: self, to: toastViewController)
    }
}

// MARK: - method
extension TopViewController {
    private func setDelegates() {
        topMainView.delegate = self
    }
}
