//
//  Global.swift
//  Learning
//
//  Created by Playground, Inc. on 2018/09/17.
//  Copyright © 2018 Playground, Inc.. All rights reserved.
//


import UIKit


// MARK: - ***** FUNCTION **********
func propertyNames(owner: Any) -> [String] {
    return Mirror(reflecting: owner).children.compactMap{ $0.label }
}

func transitionViewController(from: UIViewController, to: UIViewController, animated: Bool? = true) {
    if let navigationController = from.navigationController,
        let animated = animated {
        navigationController.pushViewController(to, animated: animated)
    }
}

func popViewController(owner: UIViewController, animated: Bool? = true) {
    if let navigationController = owner.navigationController,
        let animated = animated {
        navigationController.popViewController(animated: animated)
    }
}

func transitionStoryboard(name: String) {
    if let window = UIApplication.shared.windows.first {
        let  storyboard: UIStoryboard = UIStoryboard(name: name, bundle: Bundle.main)
        window.rootViewController = storyboard.instantiateInitialViewController()
        window.makeKeyAndVisible()
    }
}

func loadViewFromXib(withOwner: Any) -> [Any]? {
    let name = getClassName(fromObject: withOwner)
    let nib: UINib = UINib.init(nibName: name, bundle: nil)
    let result: [Any]? = nib.instantiate(withOwner: withOwner, options: nil)
    return result
}

func loadTableViewCellFromXib(tableView: UITableView, cellName: String) {
    let nib = UINib.init(nibName: cellName, bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: cellName)
    
}

func loadCollectionViewCellFromXib(collectionView: UICollectionView, cellName: String) {
    let nib = UINib.init(nibName: cellName, bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: cellName)
}

func setCollectionViewLayout(collectionView: UICollectionView, columnCount: Double, heithRatio: Double, direction: UICollectionView.ScrollDirection) -> Double {
    let flowLayout = UICollectionViewFlowLayout()
    let margin: CGFloat = 0.0
    var cellWidth = 0.0
    if let window = UIApplication.shared.windows.first {
        cellWidth = Double(window.frame.width) / columnCount
    }
    let cellHeight = cellWidth * heithRatio
    flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
    flowLayout.scrollDirection = direction
    flowLayout.minimumInteritemSpacing = margin
    flowLayout.minimumLineSpacing = margin
    flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    collectionView.collectionViewLayout = flowLayout
    return cellHeight
}

func setTabBarTintColor(tabBar: UITabBar, colorHex: String) {
    tabBar.barTintColor = UIColor(hex: colorHex)
}

func setNavigationBarColor(navigationBar: UINavigationBar,
                           colorHex: String) {
    navigationBar.barTintColor = UIColor(hex: colorHex)
}

func getClassName(fromObject: Any) -> String {
    let moduleName = NSStringFromClass(type(of: fromObject) as! AnyClass)
    let startIndex = moduleName.index(of: ".")!
    let indexAfterModuleName = moduleName.index(after: startIndex)
    let classname = moduleName[indexAfterModuleName...]
    return String(classname)
}

func setShadow<Object: UIView>(_ object: Object, color: CGColor, shadowRadius: CGFloat) {
    object.layer.shadowColor = color
    object.layer.shadowOpacity = 0.5
    object.layer.shadowOffset = CGSize(width: 5, height: 5)
    object.layer.shadowRadius = shadowRadius
}

func setCornerRadius<Object: UIView>(_ object: Object, radius: CGFloat) {
    object.layer.cornerRadius = radius
}

func getDocumentPath() -> String {
    let d_paths = NSSearchPathForDirectoriesInDomains(
        .documentDirectory,
        .userDomainMask, true)
    let documentsPath = d_paths[0]
    return documentsPath
}

func getLibraryCachePath() -> String {
    let c_paths = NSSearchPathForDirectoriesInDomains(
        .cachesDirectory,
        .userDomainMask, true)
    let cachesPath = c_paths[0]
    return cachesPath
}

func getTemporaryPath() -> String {
    let tmpPath = NSTemporaryDirectory()
    return tmpPath
}

func parsePlist(_ fileName: String) -> [[String: Any]]? {
    guard let filePath: URL = Bundle.main.url(forResource: fileName, withExtension: "plist") else {
        return nil
    }
    do {
        let data = try Data(contentsOf: filePath)
        return try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [[String: Any]]
    }
    catch {
        return nil
    }
}

func randomString(length: Int) -> String {
    let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let len = UInt32(letters.length)
    
    var randomString = ""
    
    for _ in 0 ..< length {
        let rand = arc4random_uniform(len)
        var nextChar = letters.character(at: Int(rand))
        randomString += NSString(characters: &nextChar, length: 1) as String
    }
    
    return randomString
}
