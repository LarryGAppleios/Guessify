//
//  GameArea.swift
//  Guessify
//
//  Created by Otis Young on 2/2/25.
//

import SwiftUI

struct GameArea: View {
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.black, Color("DarkYellow")]), center: .center, startRadius: 250, endRadius: 900)
                .ignoresSafeArea()
            VStack(spacing:20){
                VStack(spacing:20){
                    HStack(spacing:20){
                        AcronymLogic()
                            .frame(width: 300, height: 300)

                        

                    }

                    
                }
            }
            
            
            
            
            
            
            
            

            
            
        }
    }
    
    
    
    
    
    
    
    
}

#Preview {
    GameArea()
}
