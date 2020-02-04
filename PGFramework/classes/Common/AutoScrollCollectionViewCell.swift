//
//  AutoScrollCollectionViewCell.swift
//  PGFramework
//
//  Created by Hiroki Umatani on 2020/01/31.
//  Copyright © 2020 Playground. All rights reserved.
//

import UIKit

protocol AutoCollectionViewCellDelegate: NSObjectProtocol {

}

extension AutoCollectionViewCellDelegate {

}
// MARK: - Property
class AutoCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: AutoCollectionViewCellDelegate? = nil
    var autoScrollViewModelContetnts: AutoScrollViewModelContetnts = AutoScrollViewModelContetnts()
}

// MARK: - Life cycle
extension AutoCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Protocol
extension AutoCollectionViewCell {

}

// MARK: - method
extension AutoCollectionViewCell {
    func updateView(autoScrollViewModelContetnts: AutoScrollViewModelContetnts) {
        self.autoScrollViewModelContetnts = autoScrollViewModelContetnts

        // image
        let fetcher: Fetcher = Fetcher()

        
    }
}
