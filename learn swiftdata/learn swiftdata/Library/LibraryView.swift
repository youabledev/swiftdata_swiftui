//
//  LibraryView.swift
//  learn swiftdata
//
//  Created by zumin you on 2023/10/25.
//

import SwiftUI
import SwiftData

struct LibraryView: View {
    @Environment(\.modelContext) var context: ModelContext
    @Query var libraryList: [Library]
    @Query var bookList: [Book]
    
    @State private var newBookName: String = ""
    @State private var selectedLibrary: Library?
    
    var body: some View {
        List {
            Section("libraries") {
                ForEach(libraryList, id: \.id) { library in
                    HStack {
                        Text(library.name)
                    }
                } //: ForEach
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        context.delete(libraryList[index])
                    }
                })
            } //: Section1
        
            Section("Add New Book") {
                TextField("췍 이름", text: $newBookName)
                ForEach(libraryList, id: \.self) { library in
                    HStack {
                        Text(library.name)
                        if library == selectedLibrary {
                            Image(systemName: "checkmark")
                        }
                    }
                    .onTapGesture {
                        selectedLibrary = library
                    }
                }
                Button("Save") {
                    let newBook = Book(name: newBookName)
                    newBook.library = selectedLibrary
                    context.insert(newBook)
                    
                    newBookName = ""
                    selectedLibrary = nil
                }
            }
            
            Section("books") {
                ForEach(bookList, id: \.id) { book in
                    HStack {
                        Text(book.name)
                            .fontWeight(.heavy)
                        Text(book.library?.name ?? "도서관읎다.")
                    }
                } //: ForEach
            } //: Sectioin2
        } //: List
    }
}

#Preview {
    LibraryView()
}
