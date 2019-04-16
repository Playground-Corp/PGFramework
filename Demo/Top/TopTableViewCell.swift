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
    @IBOutlet weak var titleLabel: UILabel!
    var topViewModel: TopViewModel = TopViewModel()
}

// MARK: - Life cycle
extension TopTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegates()
        loadViews()
    }
}

// MARK: - Protocol
extension TopTableViewCell: TopMainViewDelegate {

}

// MARK: - method
extension TopTableViewCell {
    func updateView(topViewModel: TopViewModel) {
        self.topViewModel = topViewModel
        titleLabel.text = topViewModel.title
    }

    private func setDelegates() {

    }

    private func loadViews() {

    }
}
