//
//  UpdateUserSheetView.swift
//  learn swiftdata
//
//  Created by zumin you on 2023/10/02.
//

import SwiftUI
import SwiftData

struct UpdateUserSheetView: View {
    // 모든 SwiftUI View는 environment를 통해서 ModelContext에 접근할 수 있음
//    @Environment(\.modelContext) var context
    // MARK: - SwiftData Update
    @Bindable var user: User
    @Environment(\.dismiss) var dismiss
    @Query var companyList: [Company]
    @State private var selectedCompany: Company?
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button("취소") {
                    dismiss()
                }
                Spacer()
                Text("사용자 수정하기")
                Spacer()
                Button("저장") {
                    dismiss()
                }
            } //: HStack
            .padding(.vertical, 30)
            
            section(title: "이름", content: TextField("이름을 입력해 주세요.", text: $user.name))
            section(title: "나이", content: TextField("나이를 입력해 주세요.", value: $user.age, formatter: NumberFormatter()).keyboardType(.numberPad))
            section(title: "생일", content: DatePicker("생일을 선택해 주세요.", selection: $user.birth, displayedComponents: .date))
            
            Text("소속 회사")
            ScrollView {
                Text("none")
                    .fontWeight(user.company == nil ? .heavy : .light)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        user.company = nil
                    }
                ForEach(companyList, id: \.self) { company in
                    HStack {
                        Text(company.name)
                            .fontWeight(company == user.company ? .heavy : .light)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        user.company = company
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .background(.white)
            .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 2)
            )
            
            Spacer()
        } //: VStack
        .padding(.horizontal, 20)
    }
    
    func section<Content: View>(title: String, content: Content) -> some View {
        HStack {
            Text(title)
                .padding(.trailing, 20)
            content
            Spacer()
        }
    }
}

#Preview {
    UpdateUserSheetView(user: User(name: "tester", age: 12, birth: .now, closeUser: [User]()))
}
