//
//  UserModel.swift
//  Demo
//
//  Created by Hiroki Umatani on 2019/03/12.
//  Copyright © 2019 Playground. All rights reserved.
//

import UIKit
import PGFramework


// MARK: - Property
class UserModel {
    // Path
    fileprivate static let PATH: String = "/users"

    // parameters
    var id: Int?
}

struct UserModelRequest {
    // parameters
    var id: Int?
}


// MARK: - Parse
extension UserModel {
    static func parse(data: [String: Any]) -> UserModel {
        let model = UserModel()
        model.id = data["id"] as? Int
        return model
    }

    static func setParameter(request: UserModelRequest) -> [String: Any] {
        var parameter: [String: Any] = [:]
        if let id = request.id {
            parameter["id"] = id
        }

        return parameter
    }
}

// MARK: - Reads
extension UserModel {
    static func reads(success:@escaping (ListModel<UserModel>) -> Void) {
        let fetcher = Fetcher()
        fetcher.request(path: PATH + "?format=json",
                        method: .get,
                        parameters: nil,
                        success: { response in
                            var listModel = ListModel<UserModel>()

                            if let response = response,
                                let count = response["count"] {
                                listModel.max_count = count as! Int
                            }

                            if listModel.max_count == listModel.offset {
                                listModel.loadMore = false
                            } else {
                                listModel.loadMore = true
                            }

                            if let response = response,
                                let results = response["results"] as? [[String: AnyObject]] {
                                let _ = results.map { data in
                                    let model: UserModel = parse(data: data)
                                    listModel.insert(model)
                                }
                            }
                            success(listModel)
        },
                        failed: { error in
        })
    }
}

// MARK: - ReadMore
extension UserModel {
    static func readMore(listModel: ListModel<UserModel>, success:@escaping (ListModel<UserModel>) -> Void) {
        let fetcher = Fetcher()
        fetcher.request(path: PATH + "?format=json" + "&offset=" + String(describing: listModel.contents.count),
                        method: .get,
                        parameters: nil,
                        success: { response in
                            var listModel = listModel

                            if let response = response,
                                let count = response["count"] {
                                listModel.max_count = count as! Int
                            }

                            if listModel.max_count == listModel.offset {
                                listModel.loadMore = false
                            } else {
                                listModel.loadMore = true
                            }

                            if let response = response,
                                let results = response["results"] as? [[String: AnyObject]] {
                                let _ = results.map { data in
                                    let model: UserModel = parse(data: data)
                                    listModel.insert(model)
                                }
                            }
                            success(listModel)
        },
                        failed: { error in
        })
    }
}

// MARK: - ReadAt
extension UserModel {
    static func readAt(request: UserModelRequest, success:@escaping (ListModel<UserModel>) -> Void) {
        let fetcher = Fetcher()
        guard let id = request.id else {
            return
        }
        fetcher.request(path: PATH + String(describing: id) + "/?format=json",
                        method: .get,
                        parameters: nil,
                        success: { response in
                            var listModel = ListModel<UserModel>()

                            if let response = response,
                                let count = response["count"] {
                                listModel.max_count = count as! Int
                            }

                            if listModel.max_count == listModel.offset {
                                listModel.loadMore = false
                            } else {
                                listModel.loadMore = true
                            }

                            if let data = response {
                                let model: UserModel = parse(data: data)
                                listModel.insert(model)
                            }
                            success(listModel)
        },
                        failed: { error in
        })
    }
}

// MARK: - Create
extension UserModel {
    static func create(request: UserModelRequest,
                       success:@escaping (ListModel<UserModel>) -> Void) {
        let fetcher = Fetcher()
        var param = setParameter(request: request)
        if let _ = param["id"] {
            param.remove(at: param.index(forKey: "id")!)
        }

        fetcher.request(path: PATH + "?format=json",
                        method: .post,
                        parameters: param,
                        success: { response in
                            var listModel = ListModel<UserModel>()

                            if let response = response,
                                let count = response["count"] {
                                listModel.max_count = count as! Int
                            }

                            if listModel.max_count == listModel.offset {
                                listModel.loadMore = false
                            } else {
                                listModel.loadMore = true
                            }

                            if let data = response {
                                let model: UserModel = parse(data: data)
                                listModel.insert(model)
                            }
                            success(listModel)
        },
                        failed: { error in

        })

    }
}


// MARK: - Update
extension UserModel {
    static func update(request: UserModelRequest,
                       success:@escaping (ListModel<UserModel>) -> Void) {
        let fetcher = Fetcher()
        guard let id = request.id else {
            return
        }
        var param = setParameter(request: request)
        if let _ = param["id"] {
            param.remove(at: param.index(forKey: "id")!)
        }
        fetcher.request(path: PATH + String(describing: id) + "/?format=json",
                        method: .put,
                        parameters: param,
                        success: { response in
                            var listModel = ListModel<UserModel>()

                            if let response = response,
                                let count = response["count"] {
                                listModel.max_count = count as! Int
                            }

                            if listModel.max_count == listModel.offset {
                                listModel.loadMore = false
                            } else {
                                listModel.loadMore = true
                            }

                            if let data = response {
                                let model: UserModel = parse(data: data)
                                listModel.insert(model)
                            }
                            success(listModel)
        },
                        failed: { error in
        })

    }
}

// MARK: - Delete
extension UserModel {
    static func delete(request: UserModelRequest, success:@escaping () -> Void) {
        let fetcher = Fetcher()
        guard let id = request.id else {
            return
        }
        fetcher.request(path: PATH + String(describing: id) + "/?format=json",
                        method: .delete,
                        parameters: nil,
                        success: { response in
                            success()
        },
                        failed: { error in
        })
    }
}
