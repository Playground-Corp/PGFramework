//
//  FirstViewController.swift
//  Demo
//
//  Created by Hiroki Umatani on 2020/01/17.
//  Copyright © 2020 Playground. All rights reserved.
//

import UIKit
import CoreLocation
import PGFramework


extension Const {
    static let LargeFontSize: CGFloat = 19
    static let BasicFontSize: CGFloat = 17
    static let SmallFontSize: CGFloat = 15
    static let BasicFontColor: UIColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
}

// MARK: - Property
class FirstViewController: BaseViewController {
    // IBOutlet
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var menuView: MenuView!
    @IBOutlet weak var autoScrollView: AutoScrollView!

    // flagments
    var isHiddenMenuView: Bool = true

    // constraints
    @IBOutlet weak var menuViewWidth: NSLayoutConstraint!

    // location
    var trackLocationManager : CLLocationManager =  CLLocationManager()
    var beaconRegion : CLBeaconRegion!
}

// MARK: - Life cycle
extension FirstViewController {
    override func loadView() {
        super.loadView()
        setDelegates()
        setHeaderView()
        setMenuView()
        setAutoScrollView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setLocationManager()
        checkLocationStatus()
    }
}

// MARK: - Protocol
extension FirstViewController: HeaderViewDelegate {
    func touchedLeftButton(_ sender: UIButton) {
        if isHiddenMenuView {
            menuView.showMenuView()
        } else {
            menuView.hideMenuView()
        }
        isHiddenMenuView = !isHiddenMenuView
    }

    func touchedRightButton(_ sender: UIButton) { return }

    func touchedCenterButton(_ sender: UIButton) { return }
}

extension FirstViewController: MenuViewDelegate {
    func  tableView(indexPath: IndexPath) {
        menuView.hideMenuView()
        isHiddenMenuView = true
    }
}

extension FirstViewController: AutoScrollViewDelegate {
    func collectionView(indexPath: IndexPath) {

    }
}

extension FirstViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if beacons.count > 0 {
            updateDistance(beacons[0].proximity)
        } else {
            updateDistance(.unknown)
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        trackLocationManager.startMonitoring(for: beaconRegion)
    }

    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        trackLocationManager.requestState(for: beaconRegion)
    }

    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for inRegion: CLRegion) {

        switch (state) {
        case .inside:
            trackLocationManager.startRangingBeacons(in: beaconRegion)
            break
        case .outside:
            break

        case .unknown:
            break

        }
    }

    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        trackLocationManager.startRangingBeacons(in: beaconRegion)
    }

    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        trackLocationManager.stopRangingBeacons(in: beaconRegion)
    }
}

// MARK: - method
extension FirstViewController {
    func setDelegates() {
        headerView.delegate = self
        menuView.delegate = self
        autoScrollView.delegate = self
        trackLocationManager.delegate = self
    }

    func setHeaderView() {
        // left button
        headerView.setLeft(text: "left",
                           fontSize: Const.SmallFontSize,
                           color: Const.BasicFontColor)

        // title
        headerView.setCenter(text: "center",
                             fontSize: Const.LargeFontSize,
                             color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))

        // right button
        headerView.setRight(text: "right",
                            fontSize: Const.SmallFontSize,
                            color: Const.BasicFontColor)

        // background
        headerView.setBackground(color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))

        // under line
        headerView.setUnderLine(color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),
                                alpha: 0.5)

        // shadow
        setShadow(headerView,
                  color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1),
                  shadowRadius: 3)

    }

    func setMenuView() {
        menuViewWidth.constant = SCREEN_WIDTH / 3.0
        setShadow(menuView,
                  color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                  shadowRadius: 3)
    }

    func setAutoScrollView() {
        // model
        let model:AutoScrollViewModel = AutoScrollViewModel()

        // settings
        let settings: AutoScrollViewModelSettings = AutoScrollViewModelSettings()
        settings.scrollAnimationTime = 5.0
        model.settings = settings

        // contetns
        for i in 0..<6 {
            // public
            let contents: AutoScrollViewModelContetnts = AutoScrollViewModelContetnts()
            contents.titleText = "TITLE"
            contents.isHiddenTitleLabel = false
            contents.titleLabelFontSize = 32

            contents.descriptionText = "DESCRIPTION"
            contents.isHiddenDescriptionLabel = false
            contents.cellMargin = 8
            // private
            switch i {
            case 0:
                contents.collectionViewCellBackgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            case 1:
                contents.collectionViewCellBackgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            case 2:
                contents.collectionViewCellBackgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            case 3:
                contents.collectionViewCellBackgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            case 4:
                contents.collectionViewCellBackgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            case 5:
                contents.collectionViewCellBackgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            default:
                contents.collectionViewCellBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            model.contents += [contents]
        }
        autoScrollView.setModels(autoScrollViewModel: model)
        autoScrollView.startTimer()
    }

    func setLocationManager() {
        let uuid: UUID = UUID(uuidString: "D546DF97-4757-47EF-BE09-3E2DCBDD0C77")!
        let beaconID = "https://goo.gl/PHNSdm"
        beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 12288, minor: 1756, identifier: beaconID)
        trackLocationManager.startMonitoring(for: beaconRegion)

    }

    func checkLocationStatus() {
        let status = CLLocationManager.authorizationStatus()
        if(status == CLAuthorizationStatus.notDetermined) {
            trackLocationManager.requestWhenInUseAuthorization()
        }
    }

    func updateDistance(_ distance: CLProximity) {
        UIView.animate(withDuration: 0.8) {
            switch distance {
            case .unknown:
                self.headerView.setBackground(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
            case .far:
                self.headerView.setBackground(color: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
            case .near:
                self.headerView.setBackground(color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
            case .immediate:
                self.headerView.setBackground(color: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1))
            @unknown default:
                break
            }
        }
    }
}
