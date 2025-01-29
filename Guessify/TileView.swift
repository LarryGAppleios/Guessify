//
//  TileView.swift
//  Guessify
//
//  Created by Larry Gill on 1/28/25.
//

import SwiftUI

struct TileView: View {
    var letter: String
    var body: some View {
    
        ZStack{
            Rectangle()
                .frame( width: 65, height: 65)
                .foregroundColor(Color.orange)
            Text(letter)
                .font(.title)
                .fontWeight(.bold)
            
        }
    }
}

#Preview {
    TileView(letter: "A")
}
