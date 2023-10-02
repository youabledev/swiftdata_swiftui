//
//  UserListView.swift
//  learn swiftdata
//
//  Created by zumin you on 2023/10/02.
//

import SwiftUI
import SwiftData

struct UserListView: View {
    // 새로운 ModelContainer
    @State private var container = try! ModelContainer(for: User.self)
    
    var body: some View {
        Text("Hello, World!")
            .modelContainer(container) // environment의 modelContainer property는 해당 컨테이너와 연관된 새로운 context를 할당함
    }
}

#Preview {
    UserListView()
}
