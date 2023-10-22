//
//  UpdateUserSheetView.swift
//  learn swiftdata
//
//  Created by zumin you on 2023/10/02.
//

import SwiftUI

struct UpdateUserSheetView: View {
    // 모든 SwiftUI View는 environment를 통해서 ModelContext에 접근할 수 있음
//    @Environment(\.modelContext) var context
    // MARK: - SwiftData Update
    @Bindable var user: User
    @Environment(\.dismiss) var dismiss
    
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
