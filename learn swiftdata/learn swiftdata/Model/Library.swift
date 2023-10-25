//
//  Library.swift
//  learn swiftdata
//
//  Created by zumin you on 2023/10/25.
//

import Foundation
import SwiftData

@Model
class Library {
    /// 고유값
    @Attribute(.unique) var id: UUID = UUID()
    /// 도서관 이름
    var name: String
    /// 도서관에 배치된 책
    /// cascade 삭제 옵션 사용해 보려고 Book의 Library 필수로 설정햇는데 context이슈로 null 바꾸니까 cascade가 안됨 ㅠㅠ
    @Relationship(deleteRule: .cascade, inverse: \Book.library)
    var books: [Book] = []
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
}

@Model
class Book {
    /// 고유값
    @Attribute(.unique) var id: UUID = UUID()
    /// 책 이름
    var name: String
    /// 소속 도서관
    var library: Library? = nil
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
}
