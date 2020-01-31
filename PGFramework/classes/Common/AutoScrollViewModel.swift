//
//  AutoScrollViewModel.swift
//  PGFramework
//
//  Created by Hiroki Umatani on 2020/01/31.
//  Copyright © 2020 Playground. All rights reserved.
//

import UIKit

public class AutoScrollViewModel: NSObject {

    public var contents: [AutoScrollViewModelContetnts] = []
    public var settings: AutoScrollViewModelSettings = AutoScrollViewModelSettings()
}

public class AutoScrollViewModelSettings: NSObject {
    public var animationTime: Double?
    public var collectionViewBackgroundColor: UIColor?
    public var collectionViewCellBackgroundColor: UIColor?
    public var isHiddenTitleLabel: Bool = true
    public var titleLabelTextColor: UIColor?
    public var cellMargin: CGFloat?
}

public class AutoScrollViewModelContetnts: NSObject {
    public var title: String?
    public var image_url: String?
    public var collectionViewCellBackgroundColor: UIColor?
    public var isHiddenTitleLabel: Bool = true
    public var titleLabelTextColor: UIColor?
    public var cellMargin: CGFloat?
}
