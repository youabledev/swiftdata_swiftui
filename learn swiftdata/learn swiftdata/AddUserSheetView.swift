//
//  AddUserSheetView.swift
//  learn swiftdata
//
//  Created by zumin you on 2023/10/02.
//

import SwiftUI

struct AddUserSheetView: View {
    // 모든 SwiftUI View는 environment를 통해서 ModelContext에 접근할 수 있음
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @State private var userNmae: String = ""
    @State private var userAge: String = ""
    @State private var birth: Date = .now
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button("취소") {
                    dismiss()
                }
                Spacer()
                Text("사용자 추가하기")
                Spacer()
                Button("저장") {
                    // MARK: - SwiftData Save
                    let newUser = User(name: userNmae, age: Int(userAge) ?? 0, birth: birth, closeUser: [User]())
                    context.insert(newUser)
                    // 즉시 반영되기 때문에 적어주지 않아도 괜찮음
//                    try! context.save()
                    dismiss()
                }
            } //: HStack
            .padding(.vertical, 30)
            
            section(title: "이름", content: TextField("이름을 입력해 주세요.", text: $userNmae))
            section(title: "나이", content: TextField("나이를 입력해 주세요.", text: $userAge).keyboardType(.numberPad))
            section(title: "생일", content: DatePicker("생일을 선택해 주세요.", selection: $birth, displayedComponents: .date))
            
            
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
    AddUserSheetView()
}
