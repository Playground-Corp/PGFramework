//
//  BaseView.swift
//  Learning
//
//  Created by Playground, Inc. on 2018/09/17.
//  Copyright © 2018 Playground, Inc.. All rights reserved.
//

import UIKit


// MARK: - Property
class BaseView: UIView {
    var views: [Any]?
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        views = loadViewFromXib(withOwner: self)
        if let contentView = views?.first as? UIView {
            contentView.frame = bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            addSubview(contentView)
        }
    }
}

// MARK: - Life cycle
extension BaseView {
    
}
// MARK: - Protocol
extension BaseView {
}

// MARK: - Method
extension BaseView {
}
