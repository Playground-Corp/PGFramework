//
//  FirstViewController.swift
//  Demo
//
//  Created by Hiroki Umatani on 2020/01/17.
//  Copyright © 2020 Playground. All rights reserved.
//

import UIKit
import PGFramework


// MARK: - Property
class FirstViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!

}

// MARK: - Life cycle
extension FirstViewController {
    override func loadView() {
        super.loadView()
        headerView.delegate = self
        headerView.updateLeft(text: "left")
        headerView.updateCenter(text: "center")
        headerView.updateRight(text: "right")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

// MARK: - Protocol
extension FirstViewController: HeaderViewDelegate {

}

// MARK: - method
extension FirstViewController {

}
