//
//  CompanyDetailView.swift
//  learn swiftdata
//
//  Created by zumin you on 2023/10/25.
//

import SwiftUI

struct CompanyDetailView: View {
    @Bindable var company: Company
    
    var body: some View {
        List(company.users) { user in
            HStack {
                Text(user.name)
            }
        }
        .navigationTitle(company.name)
    }
}

//#Preview {
//    CompanyDetailView(company: Binda))
//}
