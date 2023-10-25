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
    @Relationship(deleteRule: .cascade)
    var books: [Book] = []
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
}

@Model
class Book {
    /// 고유값
//    @Attribute(.unique) var id: UUID = UUID()
    /// 책 이름
    var name: String
    /// 소속 도서관
    @Relationship(inverse: \Library.books)
    var library: Library?
    
    init(name: String) {
//        self.id = UUID()
        self.name = name
    }
}
