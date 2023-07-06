//
//  Project7.swift
//  Days
//
//  Created by dazhou on 2023/6/28.
//

import SwiftUI

class User : ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct User1: Codable {
    let firstName: String
    let lastName: String
}

struct SecondView: View {
    let name: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Text("Hello, \(name)!")
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct Project7: View {
    @StateObject var user = User()
    @State private var showingSheet = false
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1

    @AppStorage("tapCount1") private var tapCount = 0
    @State private var user1 = User1(firstName: "Taylor", lastName: "Swift")

    var body: some View {
//        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName).")
//
//            TextField("First name", text: $user.firstName)
//            TextField("Last name", text: $user.lastName)
//        }
        
//        Button("Show Sheet") {
//            // show the sheet
//            showingSheet.toggle()
//
//        }.sheet(isPresented: $showingSheet) {
//            // contents of the sheet
//            SecondView(name: "Summer")
//        }
        
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)

                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
                
                Button("Tap count: \(tapCount)") {
                    tapCount += 1
                }
                
                Button("Save User") {
                    let encoder = JSONEncoder()
                    
                    var dd = UserDefaults.standard.object(forKey: "UserData")
//                    var dd1 =
                    if let data = try? encoder.encode(user1) {
                        UserDefaults.standard.set(data, forKey: "UserData")
                    }
                }
            }.toolbar {
                EditButton()
            }
        }
        
    }
    
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct Project7_Previews: PreviewProvider {
    static var previews: some View {
        Project7()
    }
}
