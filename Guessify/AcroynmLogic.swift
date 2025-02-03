//
//  AcroynmLogic.swift
//  Guessify
//
//  Created by Otis Young on 1/30/25.
//

import SwiftUI
 


import SwiftUI

struct AcronymLogic: View {
    
    let acronymWords: [String] = ["ASAP", "BTW", "FYI", "IDK", "IMO", "LOL", "NVM", "WWJD", "YOLO", "ROFL", "OMG", "JFYI"]
    
    // Choosing a random acronym from the list
    @State private var currentAcronym: String = ""
    @State private var guessedLetters: Set<Character> = []
    @State private var correctGuesses: Set<Character> = []
    @State private var wrongGuesses: Int = 0
    @State private var guessesSoFar: Int = 0
    @State private var guessesRemaining: Int = 6
    
    
    let maxGuesses: Int = 6

    // Function to show the acronym with guessed letters
    func acronymDisplay() -> String {
        var display = ""
        for letter in currentAcronym {
            if correctGuesses.contains(letter) {
                display += "\(letter)"
            } else {
                display += "_"
            }
        }
        return display
    }

    // Function to start a new game
    func startNewGame() {
        currentAcronym = acronymWords.randomElement() ?? "ASAP"
        guessedLetters.removeAll()
        correctGuesses.removeAll()
        wrongGuesses = 0
        guessesSoFar = 0
    }
    
    // Function to handle a guess from one player
    func player1Guess(letter: Character) {
        if guessedLetters.contains(letter) {
            // Already guessed this letter, return early
            return
        }
        
        guessedLetters.insert(letter)
        
        if currentAcronym.contains(letter) {
            correctGuesses.insert(letter)
        } else {
            wrongGuesses += 1
            guessesSoFar += 1
        }
        
        guessesSoFar += 1
    }
    
    var body: some View {
        VStack {
            Text("Acronym Guessing Game")
                .font(.title)
                .padding()
                .foregroundColor(.white)
            Text("Guess the acronym:")
                .font(.subheadline)
                .foregroundColor(.white)
            
            // Display the acronym with underscores for unguessed letters
            Text(acronymDisplay())
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
            // Show how many guesses are remaining
            Text("Guesses Remaining: \(guessesRemaining)")
                .padding()
                .foregroundColor(.white)
            // Input for the user's guess (a single letter)
            ScrollView(.horizontal,showsIndicators: false) {
                HStack {
                    ForEach(Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ"), id: \.self) { letter in
                        Button(action: {
                            player1Guess(letter: letter)
                        }) {
                            Text(String(letter))
                                .font(.title)
                                .padding(8)
                                .frame(width: 40, height: 40)
                                .background(guessedLetters.contains(letter) ? Color.gray : Color.yellow)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                            
                            
                        }
                        .disabled(guessedLetters.contains(letter))
                    }
                }
            }
            .padding()

            // Show the result (if game over)
            if guessesRemaining <= 0 || currentAcronym.allSatisfy({ correctGuesses.contains($0) }) {
                Text(guessesRemaining <= 0 ? "Game Over" : "You Win!")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                Button("Start New Game") {
                    startNewGame()
                    
                }
                .padding()
            }
        }
        .onAppear {
            startNewGame() // Start the game when the view appears
        }
    }
}
struct AcroynmLogic: View {
    var body: some View {
        
        
        
        
        AcronymLogic()
    }
}
        

