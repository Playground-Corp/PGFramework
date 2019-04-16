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
    func touchedCell(topViewModel: TopViewModel)
}

extension TopMainViewDelegate {
    func touchedCell(topViewModel: TopViewModel) {}
}
// MARK: - Property
class TopMainView: BaseView {
    weak var delegate: TopMainViewDelegate? = nil
    @IBOutlet weak var tableView: BaseTableView!
    var topViewListModel: ListModel<TopViewModel> = ListModel<TopViewModel>()
}

// MARK: - Life cycle
extension TopMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegates()
        loadViews()
    }
}

// MARK: - Protocol
extension TopMainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topViewListModel.contents.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopTableViewCell", for: indexPath) as? TopTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        cell.updateView(topViewModel: topViewListModel.contents[indexPath.row])
        return cell
    }
}

extension TopMainView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.touchedCell(topViewModel: topViewListModel.contents[indexPath.row])
    }
}

extension TopMainView: TopTableViewCellDelegate {

}

// MARK: - method
extension TopMainView {
    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func loadViews() {
        loadTableViewCellFromXib(tableView: tableView, cellName: "TopTableViewCell")
    }

    func updateView(topViewListModel: ListModel<TopViewModel>) {
        self.topViewListModel = topViewListModel
        tableView.reloadData()
    }
}
