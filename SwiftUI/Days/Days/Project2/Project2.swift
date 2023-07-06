//
//  Project2.swift
//  Days
//
//  Created by dazhou on 2023/6/13.
//

import SwiftUI

struct Project2: View {
    var body: some View {
//        VStack(alignment:.leading, spacing:20, content: {
//            Spacer()
//            Spacer()
//            Text("Hello, world!")
//            Text("This is inside a stack")
//            Spacer()
//        })
      
//        VStack() {
//            Color.red.frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
//            Text("Hello, world!").background(.clear)
//            Text("This is inside a stack")
//        }
        
//        ZStack {
//            VStack(spacing: 0) {
//                Color.red
//                Color.blue
//            }
//
//            Text("Your content")
////                .foregroundColor(.secondary)
//                .foregroundStyle(.blue)
//                .padding(50)
//                .background(.ultraThinMaterial)
//        }
//        .ignoresSafeArea()
        
        
//        HStack(spacing: 20) {
//            Text("Hello, world!")
//            Text("This is inside a stack")
//        }
        
//        LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)

//        LinearGradient(gradient: Gradient(stops: [
//            Gradient.Stop(color: .white, location: 0.5),
//            Gradient.Stop(color: .black, location: 1),
//        ]), startPoint: .top, endPoint: .bottom)
        
//        LinearGradient(gradient: Gradient(stops: [
//            .init(color: .white, location: 0.45),
//            .init(color: .black, location: 0.55),
//        ]), startPoint: .top, endPoint: .bottom)
        
//        RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
        
//        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)

//        Button("Delete selection", action: executeDelete)
//
//        Button("Delete selection", role: .cancel, action: executeDelete)

//        VStack {
//            Button("Button 1") { executeDelete() }
//                .buttonStyle(.bordered)
//            Button("Button 2", role: .destructive) { }
//                .buttonStyle(.bordered)
//            Button("Button 3") { }
//                .buttonStyle(.borderedProminent)
//            Button("Button 4", role: .destructive) { }
//                .buttonStyle(.borderedProminent)
//        }
        
//        Button {
//            print("Button was tapped")
//        } label: {
//            Text("Tap me!")
//                .padding()
//                .foregroundColor(.white)
//                .background(.red)
//        }
//
//        Button {
//            print("Edit button was tapped")
//        } label: {
//            Image(systemName: "pencil")
//        }
//
//        Button {
//            print("Edit button was tapped")
//        } label: {
//            Label("Edit", systemImage: "pencil")
//        }
        
//        Button("Show Alert") {
//            showingAlert = false
//        }
//        .alert("Important message", isPresented: $showingAlert) {
//            Button("OK") { }
//            Button("Cancel") { }
//        } message: {
//            Text("Please read this.")
//
//        }
        
//        VStack {
//            Text("Tap the flag of")
//            Text(countries[correctAnswer])
//        }
        
//        ForEach(0..<3) { number in
//            Button {
//               // flag was tapped
//            } label: {
//                Image(countries[number])
//                    .renderingMode(.original)
//            }
//        }
        
        VStack {
            Text("Score: ???")
                .foregroundColor(.red)
                .font(Font(CTFont(.label, size: 22)))
            
        
        }
    }
    
    @State private var scoreTitle = ""
    @State private var showingScore = false

    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State var correctAnswer = Int.random(in: 0...3)
    @State private var showingAlert = true

    func executeDelete() {
        print("Now deleting…")
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }

        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct Project2_Previews: PreviewProvider {
    static var previews: some View {
        Project2()
    }
}
