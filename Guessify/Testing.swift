//
//  Testing.swift
//  Guessify
//
//  Created by Larry Gill on 2/4/25.
//

import SwiftUI
struct KeyboardView: View {
    @State var proxy: UITextDocumentProxy
    
    let keys = [
        ["Q","W","E","R","T","Y","U","I","O","P"],
        ["A","S","D","F","G","H","J","K","L"],
        ["Z","X","C","V","B","N","M"]
    ]
    //    @State private var inputText: String = ""
    var body: some View {
        VStack{
            ForEach(keys, id: \.self) { row in
                HStack{
                    ForEach(row, id: \.self) { key in
                        KeyButton(title: key, proxy: proxy)
                    }
                }
            }
        }
        .padding()
    }
}
struct KeyButton: View {
    var title: String
    var proxy: UITextDocumentProxy
    var body: some View {
        Button(action: {
            proxy.insertText(title)
        }) {
            Text(title)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(5)
        }
    }
    func insertText(_ text: String) {
        proxy.insertText(text)
    }

       
        
//        TextField("Text Input", text: $inputText, prompt: Text("Input Text"), axis: .vertical)
//            .textFieldStyle(.automatic)
//            .textContentType(.name)
//            .textInputAutocapitalization(.never)
//            .disableAutocorrection(true)
//            .lineLimit(3, reservesSpace: false)
//    }
    
}
#Preview {
//    Testing()
}
