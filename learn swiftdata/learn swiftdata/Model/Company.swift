//
//  Company.swift
//  learn swiftdata
//
//  Created by zumin you on 2023/10/22.
//

import Foundation
import SwiftData

/// 회사 정보
@Model class Company {
    /// 회사 고유값
    @Attribute(.unique) var id: UUID = UUID()
    /// 회사명
    var name: String
    /// 해당 회사에 소속된 유저 목록
    var user: [User] = []

    init(name: String) {
        self.name = name
    }
}
