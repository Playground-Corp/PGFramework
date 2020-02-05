//
//  DateManager.swift
//  PGFramework
//
//  Created by Hiroki Umatani on 2020/02/05.
//  Copyright © 2020 Playground. All rights reserved.
//

import UIKit

public class DateManagerModel: NSObject {
    public var second: Int = 0
    public var minute: Int = 0
    public var hour  : Int = 0
    public var day   : Int = 0
    public var month : Int = 0
    public var year  : Int = 0
}

extension Const {
    static let DateFormat = "yyyy/MM/dd HH:mm:ss"
}

public class DateManager {

    /// TimeInterval →　Dateに変換
    /// - Parameter unixTime: TimeInterval
    static public func convert(unixTime: TimeInterval) -> Date {
        let result: Date = Date(timeIntervalSince1970: unixTime)
        return result
    }

    /// Date →　Stringに変換　"yyyy-MM-dd HH:mm:ss"
    /// - Parameter date: Date
    static public func convert(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = Const.DateFormat
        let result: String = formatter.string(from: date)
        return result
    }

    /// String →　TimeIntervalに変換
    /// - Parameter dateString: String "yyyy-MM-dd HH:mm:ss"
    static public func convert(dateString: String) -> TimeInterval {
        let date: Date = convert(dateString: dateString)
        let result: TimeInterval = date.timeIntervalSince1970
        return result
    }

    /// TimeInterval →　Stringに変換　"yyyy-MM-dd HH:mm:ss"
    /// - Parameter unixTime: TimeInterval
    static public func convert(unixTime: TimeInterval) -> String {
        let date: Date = Date(timeIntervalSince1970: unixTime)
        let result: String = convert(date: date)
        return result
    }

    /// String →　Dateに変換
    /// - Parameter dateString: String "yyyy-MM-dd HH:mm:ss"
    static public func convert(dateString: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = Const.DateFormat
        if let result = formatter.date(from: dateString) {
            return result
        }
        let result: Date = Date()
        return result
    }

    /// Date →　TimeIntervalに変換
    /// - Parameter date: Date
    static public func convert(date: Date) -> TimeInterval {
        let result: TimeInterval = date.timeIntervalSince1970
        return result
    }

    /// 日付の差分を取得
    /// - Parameters:
    ///   - fromDay: Date 開始日
    ///   - toDay: Date 終了日
    static public func getIntervalDays(fromDate:Date, toDate:Date) -> DateManagerModel {
        return calcDate(fromDate: fromDate, toDate: toDate)
    }

    /// 日付の差分を取得
    /// - Parameters:
    ///   - fromDay: TimeInterval 開始日
    ///   - toDay: TimeInterval 終了日
    static public func getIntervalDays(fromDay:TimeInterval, toDay:TimeInterval) -> DateManagerModel {
        let fromDate: Date = convert(unixTime: fromDay)
        let toDate: Date = convert(unixTime: toDay)
        return calcDate(fromDate: fromDate, toDate: toDate)
    }


    /// 日付の差分を取得
    /// - Parameters:
    ///   - fromDay: String 開始日 "yyyy-MM-dd HH:mm:ss"
    ///   - toDay: String 終了日 "yyyy-MM-dd HH:mm:ss"
    static public func getIntervalDays(fromDay: String, toDay: String) -> DateManagerModel {

        let fromDate: Date = convert(dateString: fromDay)
        let toDate: Date   = convert(dateString: toDay)
        return calcDate(fromDate: fromDate, toDate: toDate)

    }

    static func calcDate(fromDate: Date, toDate: Date) -> DateManagerModel {
        let dateManagerModel: DateManagerModel = DateManagerModel()
        let cal = Calendar(identifier: .gregorian)
        let compornent = cal.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond], from: fromDate, to: toDate)

        if let year = compornent.year {
            dateManagerModel.year = year
        }
        if let month = compornent.month {
            dateManagerModel.month = month
        }
        if let day = compornent.day {
            dateManagerModel.day = day
        }
        if let hour = compornent.hour {
            dateManagerModel.hour = hour
        }
        if let minute = compornent.minute {
            dateManagerModel.minute = minute
        }
        if let second = compornent.second {
            dateManagerModel.second = second
        }
        return dateManagerModel
    }
}
