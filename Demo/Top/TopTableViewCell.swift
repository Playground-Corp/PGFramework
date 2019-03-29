//
//  TopTableViewCell.swift
//  Demo
//
//  Created by Hiroki Umatani on 2019/03/12.
//  Copyright © 2019 Playground. All rights reserved.
//

import UIKit

import PGFramework


protocol TopTableViewCellDelegate: NSObjectProtocol{

}

extension TopTableViewCellDelegate {

}
// MARK: - Property
class TopTableViewCell: BaseTableViewCell {
    weak var delegate: TopTableViewCellDelegate? = nil
}

// MARK: - Life cycle
extension TopTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Protocol
extension TopTableViewCell {

}

// MARK: - method
extension TopTableViewCell {

}
