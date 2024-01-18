//
//  UseHistoryModel.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/18.
//

import Foundation
struct UseHistoryModel{
    var serialNumber: Int
    var price : Int
    var date : String
    var distance  : Int
}
class UseHistoryData {
    static let shared = UseHistoryData()
    var historyList: [UseHistoryModel] = []
    private init() {}
}
class RegisterData{
    static let shared = RegisterData()
    var registList : [Int] = []
    private init() {}
}
class UseStatusData{
    static let shared = UseStatusData()
    var status : Bool = false
    private init() {}
}
