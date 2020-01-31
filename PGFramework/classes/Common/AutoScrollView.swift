//
//  AutoScrollView.swift
//  PGFramework
//
//  Created by Hiroki Umatani on 2020/01/31.
//  Copyright © 2020 Playground. All rights reserved.
//

import UIKit

protocol AutoScrollViewDelegate: NSObjectProtocol{

}

extension AutoScrollViewDelegate {

}
// MARK: - Property
public class AutoScrollView: UIView {
    weak var delegate: AutoScrollViewDelegate? = nil
    var view: UIView?
    @IBOutlet weak var scrollView: UICollectionView!
    
    let dummyCount = 655365
    var timer: Timer?
    var autoScrollViewModel: AutoScrollViewModel = AutoScrollViewModel()
}

// MARK: - Life cycle
extension AutoScrollView {
    override open func awakeFromNib() {
        super.awakeFromNib()
        loadView()
        loadCells()
        setCollectionView()
        setDelegates()
    }
}

// MARK: - Protocol
extension AutoScrollView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyCount * autoScrollViewModel.contents.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: AutoCollectionViewCell = scrollView.dequeueReusableCell(withReuseIdentifier: "AutoCollectionViewCell", for: indexPath) as? AutoCollectionViewCell else {
            return UICollectionViewCell()
        }

        let itemIndex = indexPath.item % autoScrollViewModel.contents.count
        cell.contentView.backgroundColor = autoScrollViewModel.contents[itemIndex].collectionViewCellBackgroundColor
        return cell
    }
}

extension AutoScrollView: UICollectionViewDelegate {

}

// MARK: - method
extension AutoScrollView {
    public func startTimer() {
        if autoScrollViewModel.contents.count > 1 && timer == nil {
            if let timeInterval = autoScrollViewModel.settings.animationTime {
                timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(rotate), userInfo: nil, repeats: true)
                timer!.fireDate = NSDate().addingTimeInterval(timeInterval) as Date
            }
        }
    }

    public func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    public func setModels(autoScrollViewModel: AutoScrollViewModel) {
        self.autoScrollViewModel = autoScrollViewModel
    }

    func loadView() {
        let bundle = Bundle(for: type(of: self))
        view = bundle.loadNibNamed(className, owner: self, options: nil)!.first as? UIView

        guard let view = view else { return }

        view.frame = bounds
        view.autoresizingMask =
            [.flexibleHeight,
             .flexibleWidth]
        addSubview(view)
    }

    func loadCells() {
        let bundle = Bundle(for: AutoCollectionViewCell.self)
        let nib = UINib(nibName: "AutoCollectionViewCell", bundle: bundle)
        scrollView.register(nib, forCellWithReuseIdentifier: "AutoCollectionViewCell")
    }

    func setDelegates() {
        scrollView.dataSource = self
        scrollView.delegate = self
    }

    func setCollectionView() {
        let _ = setCollectionViewLayout(collectionView: scrollView, columnCount: 1.0, heigthRatio: 1.0, direction: .horizontal)
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.centerIfNeeded()
    }

    func centerIfNeeded() {
        let currentOffset = scrollView.contentOffset
        let contentWidth = self.totalContentWidth
        let width = contentWidth / CGFloat(dummyCount)

        if 0 > currentOffset.x {
            //left scrolling

            scrollView.contentOffset = CGPoint(x: width - currentOffset.x, y: currentOffset.y)
        } else if (currentOffset.x + cellWidth) > contentWidth {
            //right scrolling
            let difference = (currentOffset.x + cellWidth) - contentWidth
            scrollView.contentOffset = CGPoint(x: width - (cellWidth + difference), y: currentOffset.y)
        }
    }

    var totalContentWidth: CGFloat {
        return CGFloat(autoScrollViewModel.contents.count * dummyCount) * cellWidth
    }

    var cellWidth: CGFloat {
        return scrollView.frame.width
    }

    @objc func rotate() {
        let offset = CGPoint(x: scrollView.contentOffset.x + cellWidth, y: scrollView.contentOffset.y)
        scrollView.setContentOffset(offset, animated: true)
    }

    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.stopTimer()
    }

    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.startTimer()
    }
}
