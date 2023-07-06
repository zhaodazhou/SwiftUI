//
//  SwiftUIView.swift
//  Days
//
//  Created by dazhou on 2023/6/9.
//

import SwiftUI

struct SwiftUIView: View {
    @State var tapCount = 0
    @State private var name = ""
    
    let students = ["Harry", "Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    @FocusState private var amountIsFocused: Bool


    var body: some View {
        
        NavigationView {
            
            
            Form {// 表单内明文的元素最多10个，可以通过 ForEach 语句填入很多，太多的话，系统会自动隐藏掉 navigationTitle
                Section {

                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)

                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)

                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }

                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("How much tip do you want to leave?")
                }


//                TextField("Enter your name", text: $name)
//                Text("Your name is \(name)")// 双向绑定
//
//
//                Button("Tap Count: \(tapCount)") {
//                    tapCount += 1
//                }

//                ForEach(0..<10) { number in
//                    Text("Row \(number)")
//                }
//
//                ForEach(0 ..< 100) {
//                    Text("Row \($0)")
//                }
        
                .navigationTitle("WeSplit")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                
            }
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
