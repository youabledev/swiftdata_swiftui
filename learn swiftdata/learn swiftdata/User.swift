//
//  User.swift
//  learn swiftdata
//
//  Created by zumin you on 2023/10/02.
//

import Foundation
import SwiftData // SwiftData를 사용하기 위해 import 해줌

// @Model 매크로는 SwiftData 모델임을 나타냄
@Model // 매크로를 확인하고 싶으면 마우스 오른쪽 버튼 눌러서 Expend Macro 클릭
class User {
    // @Attribue는 고유 제약 조건을 추가할 수 있음
    @Attribute(.unique) var id: UUID // Shema macro를 사용해서 고유 키값으로 정의함.
    var name: String
    var age: Int
    var birth: Date
    
    var closeUser: [User] = []
    
    // 이니셜라이저 작성해 주어야 함
    init(name: String, age: Int, birth: Date, closeUser: [User]) {
        self.id = UUID()
        self.name = name
        self.age = age
        self.birth = birth
        self.closeUser = closeUser
    }
}
