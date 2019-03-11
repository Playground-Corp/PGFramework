//
//  BaseTableView.swift
//  Learning
//
//  Created by Playground, Inc. on 2018/09/17.
//  Copyright © 2018 Playground, Inc.. All rights reserved.
//

import UIKit


// MARK: - Property
class BaseTableView: UITableView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.separatorStyle = .none
        self.backgroundColor = .clear
    }
}

// MARK: - Life cycle
extension BaseTableView {
}

// MARK: - Protocol
extension BaseTableView {
}

// MARK: - Method
extension BaseTableView {
}
