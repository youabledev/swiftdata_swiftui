//
//  Interest.swift
//  learn swiftdata
//
//  Created by zumin you on 2023/10/22.
//

import Foundation
import SwiftData

/// 유저 관심사
@Model class Interest {
    /// 관심사 고유값
    @Attribute(.unique) var id: UUID = UUID()
    /// 관심사 명
    var title: String
    /// 해당 관심사에 관심있는 유저 목록
    var user: [User] = []
    
    init(title: String) {
        self.title = title
    }
}
