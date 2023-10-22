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
//    let container: ModelContainer = {
//        let schema = Schema([User.self])
//        let container = try! ModelContainer(for: schema, configurations: [])
//        return container
//    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
//        .modelContainer(container)
        // injecting container
        .modelContainer(for: User.self)
//        .modelContainer(for: [User.self, Interest.self, Recipt.self])
        
        
        
        // 여러개인 경우 .modelContainer(for: [Model1.self, Model2.self .. ]) 로 나타낼 수 있음
//        .modelContainer(container) // 이 방법으로 주입도 가능
    }
}


