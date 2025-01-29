//
//  ContentView.swift
//  Guessify
//
//  Created by Larry Gill on 1/27/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.black, Color("DarkYellow")]), center: .center, startRadius: 250, endRadius: 900)
                .ignoresSafeArea()
            VStack(spacing:20){
                VStack(spacing:20){
                    HStack(spacing:20){
//                    Rectangle()
//                        .fill(Color.orange)
//                        .frame(width: 65, height:65)
//                    Rectangle()
//                        .fill(Color.orange)
//                        .frame( width: 65, height: 65)
                        TileView(letter: "G")
                        TileView(letter: "T")
                }
            HStack(spacing: 20){
//                    Rectangle()
//                        .fill(Color.orange)
//                        .frame( width: 65 , height: 65 )
//                    Rectangle()
//                        .fill(Color.orange)
//                        .frame( width: 65 , height: 65)
                TileView(letter: "A")
                TileView(letter: "?")
                    
                    
                }
                    Text("GUESSIFY")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(color: .yellow, radius: 12)
                    
                    Button(action: {
                        print( "Start button tapped!")
                    }) {
                        Text("START")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 150)
                            .background(Color.orange)
                            .cornerRadius(10)
                            .shadow(color: .yellow, radius: 5)
                    }
                }
                    
                    
                    
                    
                    
                    
                    
                }
                
                
            }
        }
    }





    
        
    


#Preview {
    ContentView()
}
