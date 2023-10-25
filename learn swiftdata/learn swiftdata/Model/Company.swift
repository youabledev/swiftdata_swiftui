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
    /// 해당 회사가 삭제되면 회사에 소속된 사용자 목록이 함께 삭제된다.
    /// users 정보에 company를 설정하면 자동으로 목록에 추가됨
    @Relationship(deleteRule: .nullify, inverse: \User.company) // 여기서 지정하는 deleteRule은 회사를 지웠을 때 User를 어떻게 하겠냐는 뜻
    var users: [User] = []
    /// 회사 목록에서 선택된 회사를 표시하기 위해 사용
    @Transient var isChecked = false

    init(name: String) {
        self.name = name
    }
}
