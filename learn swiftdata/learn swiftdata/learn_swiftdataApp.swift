//
//  learn_swiftdataApp.swift
//  learn swiftdata
//
//  Created by zumin you on 2023/10/02.
//

import SwiftUI
import SwiftData

@main
struct learn_swiftdataApp: App {
    // Shared container : 앱과 위젯과 같이 Group이 분리되어 있지만 하나의 container를 공유하는 경우
//
//    let contax-coredata:///Book/t9D0BC71E-C6F4-40E2-8530-1E5C4B43D2E54iner: ModelContainer = {
//        let schema = Schema([User.self])
//        let container = try! ModelContainer(for: schema, configurations: [])
//        return container
//    }()
    

    var body: some Scene {
        WindowGroup {
            ContentView()
//            LibraryView()
        }
//        .modelContainer(container)
        // injecting container
//        .modelContainer(for: User.self)
//        .modelContainer(for: [User.self, Interest.self, Recipt.self])
        .modelContainer(testContainer)
//        .modelContainer(libraryContainer)
        
        
        // 여러개인 경우 .modelContainer(for: [Model1.self, Model2.self .. ]) 로 나타낼 수 있음
//        .modelContainer(container) // 이 방법으로 주입도 가능
    }
}

@MainActor
let libraryContainer: ModelContainer = {
    let schema = Schema([Book.self])
    let container = try! ModelContainer(for: schema, configurations: [])
    let library = Library(name: "NY library")
    container.mainContext.insert(library)
    return container
}()

@MainActor
let testContainer: ModelContainer = {
    let schema = Schema([User.self])
    let container = try! ModelContainer(for: schema, configurations: [])
//    let company = Company(name: "test company")
//    container.mainContext.insert(company)
//    for user in mockUsers {
//        container.mainContext.insert(user)
//    }
    
//    let library = Library(name: "Apple library")
//    container.mainContext.insert(library)
//    
//    let book1 = Book(name: "book1", library:     library)
//    let book2 = Book(name: "book2", library:     library)
//    let book3 = Book(name: "book3", library:     library)
//    container.mainContext.insert(book1)
//    container.mainContext.insert(book2)
//    container.mainContext.insert(book3)
    return container
}()

let mockUsers: [User] = [
    User(name: "정다현", age: 23, birth: Date(), closeUser: []),
    User(name: "전영빈", age: 23, birth: Date(), closeUser: []),
    User(name: "안주환", age: 24, birth: Date(), closeUser: []),
    User(name: "문창기", age: 36, birth: Date(), closeUser: []),
    User(name: "백예원", age: 57, birth: Date(), closeUser: []),
    User(name: "백지우", age: 14, birth: Date(), closeUser: []),
]
