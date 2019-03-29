//
//  TopMainView.swift
//  Demo
//
//  Created by Hiroki Umatani on 2019/03/12.
//  Copyright © 2019 Playground. All rights reserved.
//

import UIKit
import PGFramework

protocol TopMainViewDelegate: NSObjectProtocol {

}

extension TopMainViewDelegate {

}
// MARK: - Property
class TopMainView: BaseView {
    weak var delegate: TopMainViewDelegate? = nil
    @IBOutlet weak var tableView: UITableView!
}

// MARK: - Life cycle
extension TopMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.dataSource = self
        loadTableViewCellFromXib(tableView: tableView, cellName: "TopTableViewCell")
    }
}

// MARK: - Protocol
extension TopMainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TopTableViewCell", for: indexPath)
        return cell
    }
}

// MARK: - method
extension TopMainView {

}
