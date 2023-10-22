//
//  User.swift
//  learn swiftdata
//
//  Created by zumin you on 2023/10/02.
//

import Foundation
import SwiftData // SwiftData를 사용하기 위해 import 해줌


@Model
class User {
    @Attribute(.unique) var id: UUID
    var name: String
    var age: Int
    var birth: Date
    
    var closeUser: [User] = []
    
    init(name: String, age: Int, birth: Date, closeUser: [User]) {
        self.id = UUID()
        self.name = name
        self.age = age
        self.birth = birth
        self.closeUser = closeUser
    }
}


