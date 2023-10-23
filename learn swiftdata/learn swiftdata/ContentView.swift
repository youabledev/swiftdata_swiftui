//
//  ContentView.swift
//  learn swiftdata
//
//  Created by zumin you on 2023/10/02.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    
    // MARK: - SwiftData Fetch
    @Query(sort: \User.birth) var users: [User]
    
    /// Predicate && SortDescriptor 예시 1
    @Query(filter: #Predicate<User> { $0.age > 20 },
           sort: [SortDescriptor(\User.birth)])
    var sortedUser: [User]
    
    /// Predicate && SortDescriptor 예시 2
    @Query private var queriedUser: [User]
    var queriedUserComputedProperty: [User] {
        let startDate = Date(timeIntervalSinceReferenceDate: -123456789.0)
        let endDate = Date()

        return queriedUser.filter({ $0.birth > startDate && $0.birth < endDate })
    }
    
    /// Predicate && SortDescriptor 예시 3
    @Query(filter: #Predicate<User> { $0.company != nil }) var query3: [User]
    
    
    
    
    
    @State private var isShowBottomSheet: Bool = false
    
    @State private var userToEdit: User?
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationStack {
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
                            // TODO: predicate 쓰는 방법 알아보기
                            // MARK: - SwiftData Delete
                            context.delete(users[index])
                        }
                    }
                }
                .sheet(item: $userToEdit) { user in
                    UpdateUserSheetView(user: user)
                }
            }
            .sheet(isPresented: $isShowBottomSheet, content: {
                AddUserSheetView()
            })
            .overlay {
                if users.isEmpty {
                    Text("사용자를 추가해 주세요")
                }
            }
            
            Button {
                isShowBottomSheet.toggle()
            } label: {
                Image(systemName: "plus")
                    .foregroundStyle(.white)
                    .frame(width: 40, height: 40)
                    .background(.black)
                    .clipShape(Circle())
            }
            .padding(.trailing, 20)
        }
    }
}

#Preview {
    ContentView()
}
