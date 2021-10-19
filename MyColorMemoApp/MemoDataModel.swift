//
//  MemoDataModel.swift
//  MyColorMemoApp
//
//  Created by JIHA on 2021/10/08.
//

import Foundation
import RealmSwift

class MemoDataModel: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var text: String = ""
    @objc dynamic var recordDate: Date = Date()
}
