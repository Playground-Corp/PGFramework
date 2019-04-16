//
//  TopViewModel.swift
//  Demo
//
//  Created by Hiroki Umatani on 2019/04/02.
//  Copyright © 2019 Playground. All rights reserved.
//

import UIKit
import PGFramework

class TopViewModel {
    var title: String?

    static func loadPropertyList() -> ListModel<TopViewModel> {
        guard let topViewDatas = parsePlist("TopViewData") else {
            return ListModel<TopViewModel>()
        }
        var listModel = ListModel<TopViewModel>()
        for topData in topViewDatas {
            let topViewModel = TopViewModel()
            topViewModel.title = topData["title"] as? String
            listModel.insert(topViewModel)
        }
        return listModel
    }
}

