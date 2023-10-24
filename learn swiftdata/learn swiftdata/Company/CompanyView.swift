//
//  CompanyView.swift
//  learn swiftdata
//
//  Created by zumin you on 2023/10/24.
//

import SwiftUI
import SwiftData

struct CompanyView: View {
    @Environment(\.modelContext) var context: ModelContext
    @Query private var companyList: [Company]
    @State private var companyName: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("추가할 회사이름 입력", text: $companyName)
                Button("추가하기") {
                    let company = Company(name: companyName)
                    context.insert(company)
                    companyName = ""
                }
            }
            .padding(.horizontal, 30)
            List(companyList) { company in
                HStack {
                    Text(company.name)
                }
            }
        }
    }
}

#Preview {
    CompanyView()
}
