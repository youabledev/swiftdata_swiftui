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
//    @Query(sort: \User.birth) var users: [User]
    
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
    
    /// Predicate && SortDescriptor 예시 4
    @Query(filter: #Predicate<User> { user in
        user.name.contains("kim") &&
        user.interests.contains { $0.title == "등산" } == true
    }) var query4: [User]
    
    @State private var isShowBottomSheet: Bool = false
    @State private var userToEdit: User?
    @State private var searchString: String = ""
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationStack {
                UserListView(searchString: searchString, userToEdit: $userToEdit)
                    .searchable(text: $searchString)
                    .sheet(item: $userToEdit) { user in
                        UpdateUserSheetView(user: user)
                    }
                
                HStack {
                    Spacer()
                    NavigationLink {
                        CompanyView()
                    } label: {
                        manageCompanyButtonLabel
                    }

                    addUserButton
                }
            }
            .sheet(isPresented: $isShowBottomSheet, content: {
                AddUserSheetView()
            })
            

        }
    }
    
    var addUserButton: some View {
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
    
    var manageCompanyButtonLabel: some View {
        Text("회사 관리하기")
            .foregroundStyle(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(.black)
            .padding(.bottom, 1)
    }
}

#Preview {
    ContentView()
}
