//
//  UserListView.swift
//  learn swiftdata
//
//  Created by zumin you on 2023/10/02.
//

import SwiftUI
import SwiftData

struct UserListView: View {
    @Environment(\.modelContext) var context
    @Query(sort: \User.age, order: .forward) private var users: [User]
    @Binding var userToEdit: User?
    
    init(searchString: String, userToEdit: Binding<User?>) {
        if searchString.count > 0 {
            self._users = Query(filter: #Predicate<User> {
                $0.name.contains(searchString)
            }, sort: \User.age, animation: .easeInOut)
        } else {
            self._users = Query(sort: \User.age, animation: .easeInOut)
        }
        
        self._userToEdit = userToEdit
    }
    
    var body: some View {
        List {
            ForEach(users) { user in
                HStack {
                    Text(user.name)
                    Text("\(user.age)")
                    Text("\(user.birth.formatted())")
                }
                .onTapGesture {
                    userToEdit = user
                }
            }
            .onDelete{ indexSet in
                print("인덱스 : ", indexSet)
                for index in indexSet {
                    context.delete(users[index])
                }
            }
        } //: List
        .overlay {
            if users.isEmpty {
                Text("사용자를 추가해 주세요")
            }
        }
    }
}
