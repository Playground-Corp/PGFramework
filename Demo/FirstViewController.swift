//
//  FirstViewController.swift
//  Demo
//
//  Created by Hiroki Umatani on 2020/01/17.
//  Copyright © 2020 Playground. All rights reserved.
//

import UIKit
import PGFramework

extension Const {
    static let LargeFontSize: CGFloat = 19
    static let BasicFontSize: CGFloat = 17
    static let SmallFontSize: CGFloat = 15
}

// MARK: - Property
class FirstViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var menuView: MenuView!

    var isHiddenMenuView: Bool = true
    @IBOutlet weak var menuViewWidth: NSLayoutConstraint!
}

// MARK: - Life cycle
extension FirstViewController {
    override func loadView() {
        super.loadView()
        setDelegates()
        setHeaderView()
        setMenuView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkCameraAuth {
            
        }
    }
}

// MARK: - Protocol
extension FirstViewController: HeaderViewDelegate {
    func touchedLeftButton(_ sender: UIButton) {
        if isHiddenMenuView {
            menuView.showMenuView()
        } else {
            menuView.hideMenuView()
        }
        isHiddenMenuView = !isHiddenMenuView
    }

    func touchedRightButton(_ sender: UIButton) {
        
    }

    func touchedCenterButton(_ sender: UIButton) {
        
    }
}

extension FirstViewController: MenuViewDelegate {
    func  tableView(indexPath: IndexPath) {
        menuView.hideMenuView()
        isHiddenMenuView = true
    }
}

// MARK: - method
extension FirstViewController {
    func setDelegates() {
        headerView.delegate = self
        menuView.delegate = self
    }

    func setHeaderView() {
        // left button
        headerView.setLeft(text: "left",
                           fontSize: Const.SmallFontSize,
                           color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))

        // title
        headerView.setCenter(text: "center",
                             fontSize: Const.LargeFontSize,
                             color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))

        // right button
        headerView.setRight(text: "right",
                            fontSize: Const.SmallFontSize,
                            color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))

        // background
        headerView.setBackground(color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))

        // under line
        headerView.setUnderLine(color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),
                                alpha: 0.5)

        // shadow
        setShadow(headerView,
                  color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1),
                  shadowRadius: 6)

    }

    func setMenuView() {
        menuViewWidth.constant = SCREEN_WIDTH / 2.5
        setShadow(menuView,
                  color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                  shadowRadius: 3)
    }
}
