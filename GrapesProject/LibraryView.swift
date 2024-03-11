//
//  LibraryView.swift
//  test
//
//  Created by Matteo Nasti on 07/03/24.
//

import SwiftUI

struct LibraryView: View {
    @State private var sheetvision = false
    @State var searchText = ""
    @State private var isSearching = false
    @State private var BookArray: [String] = TitleList()
    var Mydata = sharedData
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                NavigationLink(destination: AllBooksView()){
                    Text("Your Books")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding(.leading, 11.0)
                    Label("", systemImage: "chevron.right")
                        .padding(.trailing, 2.0)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        
                }
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(Mydata.Books) {
                            Book in
                            VStack{
                                Image (Book.cover)
                                    .resizable()
                                //.aspectRatio(contentMode: .fit)
                                    .frame(width: 115, height: 182)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                Text (Book.title)
                                    .padding([.leading, .bottom])
                            }
                        }
                    }
                    
                }
                Text ("Least Read")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 10.0)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(Mydata.Books) {
                            Book in
                            ZStack{
                                //Image(Background della view)
                                Image (Book.lastBackground)
                                    .resizable()
                                    .frame(width: 330, height: 190)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .padding(.leading, 31.0)
                                Rectangle()
                                    .frame(width: 330, height: 190)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .padding(.leading, 31.0)
                                    .opacity(0.6)
                                HStack{
                                    Image(Book.cover)
                                        .resizable()
                                        .frame(width: 100, height: 150)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    VStack{
                                        Text("Da decidere")
                                            .foregroundColor(Color.white)
                                            .padding(.leading, 30.0)
                                        Text("Da decidere")
                                            .foregroundColor(Color.white)
                                            .padding(.leading, 30.0)
                                        Text("Da decidere")
                                            .foregroundColor(Color.white)
                                            .padding(.leading, 30.0)
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Library")
            .searchable(text: $searchText, isPresented: $isSearching)
            .toolbar(content: {
                Button("Add", systemImage: "plus"){
                    sheetvision.toggle()
                }
                .sheet(isPresented: $sheetvision){
                    AddBookView()
                }
            }
            )}
    }
}
    /*var searchResults: [book] {
        if searchText.isEmpty {
            return Mydata.Books
        } else {
            return Mydata.Books.filter { $0.contains(searchText) }
        }
    }*/

func TitleList () -> [String]{
    var mydata = sharedData
    var NameList:[String] = []
    for book in mydata.Books {
        print(book.title)
        NameList = [book.title]
    }
    return NameList
}
   
#Preview {
    LibraryView()
}
