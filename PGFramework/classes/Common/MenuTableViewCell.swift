//
//  MenuTableViewCell.swift
//  PGFramework
//
//  Created by Hiroki Umatani on 2020/01/28.
//  Copyright © 2020 Playground. All rights reserved.
//

import UIKit


protocol MenuTableViewCellDelegate: NSObjectProtocol{

}

extension MenuTableViewCellDelegate {

}
// MARK: - Property
class MenuTableViewCell: UITableViewCell {
    weak var delegate: MenuTableViewCellDelegate? = nil
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var underLine: UIView!
}

// MARK: - Life cycle
extension MenuTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Protocol
extension MenuTableViewCell {

}

// MARK: - method
extension MenuTableViewCell {

}
