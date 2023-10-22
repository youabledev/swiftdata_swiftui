//
//  User.swift
//  learn swiftdata
//
//  Created by zumin you on 2023/10/02.
//

import Foundation
import SwiftData // SwiftData를 사용하기 위해 import 해줌

/// 유저 정보
@Model class User {
    /// 유저의 고유값
    @Attribute(.unique) var id: UUID = UUID()
    /// 유저 이름
    var name: String
    /// 유저 나이
    var age: Int
    /// 유저 생일
    var birth: Date
    /// 유저의 관심사. 여러개 선택 가능
    var interests: [Interest] = []
    /// 소속된 회사
    var company: Company? = nil
    
    init(name: String, age: Int, birth: Date, closeUser: [User]) {
        self.name = name
        self.age = age
        self.birth = birth
    }
}


