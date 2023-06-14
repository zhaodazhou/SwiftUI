//
//  Project3.swift
//  Days
//
//  Created by dazhou on 2023/6/13.
//

import SwiftUI

struct Project3: View {
    var body: some View {
        
         // modifier order matters
        Text("Hello, world!")
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
        
        // 类似于响应式编程
        Button("Hello World") {
            // flip the Boolean between true and false
            useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue)
        
        // 与上面的语句等价，但是：this kind of code might look the same, but it’s actually less efficient:
        // 因为它是通过创建新的Button的方式来实现的，而上面是通过 recolor 的方式
        if useRedText {
            Button("Hello World") {
                useRedText.toggle()
            }
            .foregroundColor(.red)
        } else {
            Button("Hello World 1") {
                useRedText.toggle()
            }
            .foregroundColor(.blue)
        }
        
        VStack {
            Text("Gryffindor")
                .font(.largeTitle)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
        
//        Views as properties
        VStack {
            motto1.foregroundColor(.red)
            motto2
            motto3
            spells
        }
        
        CapsuleText(text: "123")
        
        Text("Customer Modifier")
            .modifier(Title())
        
        Text("Customer Modifier")
            .titleStyle()
        
        Color.blue
            .frame(width: 300, height: 50)
            .watermarked(with: "Hacking with Swift")
    }
    
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    var motto3: some View {
        Text("Draco dormiens sss")
    }
    
    var spells: some View {
        VStack {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    @ViewBuilder var spells1: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    @State private var useRedText = false
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

struct Project3_Previews: PreviewProvider {
    static var previews: some View {
        Project3()
    }
}
