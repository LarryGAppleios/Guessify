//
//  AcroynmLogic.swift
//  Guessify
//
//  Created by Otis Young on 1/30/25.
//

import SwiftUI
 



struct AcronymLogic: View {
    
    let acronymWords: [String] = ["ASAP", "BTW", "FYI", "IDK", "IMO", "LOL", "NVM", "WWJD", "YOLO", "ROFL", "OMG", "JFYI", "TYT", "SMH"]
    
    // Choosing a random acronym from the list
    @State private var currentAcronym: String = ""
    @State private var guessedLetters: Set<Character> = []
    @State private var correctGuesses: Set<Character> = []
    @State private var wrongGuesses: Int = 0
    @State private var guessesSoFar: Int = 0
    @State private var guessesRemaining: Int = 6
    @State private var currentHint: String = ""

    
//  Connects correct acronym to the correct hint.
        let hintDictionary:[String: String] = [
            "ASAP" : "As Fast as you can.",
            "BTW" : "Used to introduce a side note in conversation.",
            "FYI" : "Providing Information that may be useful.",
            "IDK" : "Expressing uncertainty.",
            "IMO" : "Stating an opinion.",
            "LOL" : "Reaction to something funny.",
            "NVM" : "Telling some to disregard what was said.",
            "WWJD" : "Religious phrase.",
            "YOLO" : "Encouragement to take risks.",
            "ROFL" : "Something is extremely funny.",
            "OMG" : "Expressing suprise or shock.",
            "JFYI" : "Another way to say just so you know.",
            "TYT" : "Don't rush.",
            "SMH" : "Disappointed expression." ]
        
            
    
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
        
        // Hint Logic
        currentHint = hintDictionary[currentAcronym] ?? "No hint available"
        
        guessedLetters.removeAll()
        correctGuesses.removeAll()
        wrongGuesses = 0
        guessesSoFar = 0
        guessesRemaining = maxGuesses
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
                .font(.title2.bold())
                .padding()
                .shadow(color: .yellow, radius: 12)
                .foregroundColor(.white)
            Text("Guess the acronym:")
                .font(.body)
                .foregroundColor(.white)
            
            Text("Hint: \(currentHint)")
                .font(.title2.bold())
                .foregroundColor(.white)
                .shadow(color: .yellow, radius: 12)
                .fixedSize(horizontal: false, vertical: true)
            
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
            let columns = [GridItem(.adaptive(minimum: 40))]
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
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
            .frame(height: 290)
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
        

