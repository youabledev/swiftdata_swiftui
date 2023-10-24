//
//  AddUserSheetView.swift
//  learn swiftdata
//
//  Created by zumin you on 2023/10/02.
//

import SwiftUI
import SwiftData

struct AddUserSheetView: View {
    // 모든 SwiftUI View는 environment를 통해서 ModelContext에 접근할 수 있음
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @Query var allCompany: [Company]
    
    @State private var userNmae: String = ""
    @State private var userAge: String = ""
    @State private var birth: Date = .now
    @State private var selectedCompany: Company?
    
    var body: some View {
        NavigationStack {
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
                        newUser.company = selectedCompany
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
                
                Text("소속 회사 선택")
                ScrollView {
                    if allCompany.isEmpty {
                        Text("선택할 수 있는 회사 목록이 없습니다.")
                            .foregroundStyle(.gray)
                    }
                    
                    ForEach(allCompany, id: \.self) { company in
                        HStack {
                            Text(company.name)
                                .fontWeight(company == selectedCompany ? .heavy : .light)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedCompany = company
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
        } //: NavigationStack
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
