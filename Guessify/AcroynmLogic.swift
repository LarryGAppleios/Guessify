//
//  AcroynmLogic.swift
//  Guessify
//
//  Created by Otis Young on 1/30/25.
//


import SwiftUI
 



struct AcronymLogic: View {
    
    let acronymWords: [String] = ["ASAP", "BTW", "FYI", "IDK", "IMO", "LOL", "NVM", "WWJD", "YOLO", "ROFL", "OMG", "JFYI", "TYT", "SMH", "BFF", "DIY", "ETA", "TBA", "TBD", "TGIF", "WTG", "NSFW", "IYKYK", "FOMO", "BRB", "AMA", "CEO", "EOD", "EOY", "NDA", "ROI", "CFO", "UI", "VPN","GPA", "ESL", "STEM", "ADHD", "AIDS", "BPM", "DNA", "ICU", "RNA", "ACT"]
    
    // Choosing a random acronym from the list
    @State private var currentAcronym: String = ""
    @State private var guessedLetters: Set<Character> = []
    @State private var correctGuesses: Set<Character> = []
    @State private var wrongGuesses: Int = 0
    @State private var guessesSoFar: Int = 0
    @State private var guessesRemaining: Int = 6
    @State private var currentHint: String = ""
    @State private var currentRound: Int = 1
    
//  Connects correct acronym to the correct hint.
        let hintDictionary:[String: String] = [
            "ASAP" : "As Fast as you can.",
            "BTW" : "Used to introduce a side note in conversation.",
            "FYI" : "Providing Information that may be useful.",
            "IDK" : "Expressing uncertainty.",
            "IMO" : "Stating an opinion.",
            "LOL" : "Reaction to something funny.",
            "NVM" : "Telling someone to disregard what was said.",
            "WWJD" : "Religious phrase.",
            "YOLO" : "Encouragement to take risks.",
            "ROFL" : "Something is extremely funny.",
            "OMG" : "Expressing suprise or shock.",
            "JFYI" : "Another way to say just so you know.",
            "TYT" : "Don't rush.",
            "SMH" : "Disappointed expression.",
            // Round 2
            "BFF" : "Your friend til the end.",
            "DIY" : "Craft it yourself, no store needed!",
            "ETA" : "How long until arrival ?",
            "TBA" : "Details are coming soon.",
            "TBD" : "Not decided yet.",
            "TGIF" : "Weekend starts now.",
            "WTG" : "Great job, keep it up!",
            "NSFW" : "Don't open this at work.",
            "IYKYK" : "An inside joke for those who know.",
            "FOMO" : "Don't want to miss out",
            "BRB" : "Gone for a sec.",
            "AMA" : "Ask whatever.",
            // Round 3
            "CEO" : "The big boss in charge!",
            "EOD" : "Deadline by tonight.",
            "EOY" : "Wrapping up the year.",
            "NDA" : "Keep this a secret.",
            "ROI" : "What's the profit ?",
            "CFO" : "Handles all the money.",
            "UI" : "What you see on screen!",
            "VPN" : "Browse safely and privately.",
            "GPA" : "Your academic score.",
            // Round 4
            "ESL" : "Learning English.",
            "STEM" : "A class involving 4 subjects.",
            "ADHD" : "A brain that loves to multitask.",
            "AIDS" : "A serious immune system disease.",
            "BPM" : "Heartbeats or music tempo.",
            "DNA" : "Your genetic blueprint.",
            "ICU" : "Where critical care happens!",
            "RNA" : "DNA's messenger helper.",
            "ACT" : "A big test for college."]
            
    
    let maxGuesses: Int = 6

    // Function to show the acronym with guessed letters
    func acronymDisplay() -> String {
        var display = " "
        for letter in currentAcronym {
            if correctGuesses.contains(letter) {
                display += "\(letter)"
            } else {
                display += " _ "
            }
        }
        return display
    }

    // Function to start a new game
    func startNewGame() {
    if currentRound > 4 {
        currentRound = 1 // reset to 1 after 4 rounds.
        //If we've reached reound 5 (or the number of rounds desinated
        currentAcronym = acronymWords.randomElement() ?? "ASAP"
        currentHint = ""
        
    }
    
        
        // Hint Logic
        currentHint = hintDictionary[currentAcronym] ?? "No hint available"
        
        guessedLetters.removeAll()
        correctGuesses.removeAll()
        wrongGuesses = 0
        guessesRemaining = maxGuesses

    }
    
    // Function to handle a guess from one player
    func player1Guess(letter: Character) {
        if guessedLetters.contains(letter) {
            // Already guessed this letter, return early
            return
        }
        guessedLetters.insert(letter)
        //Select the right set of Acronyms based on round
       let roundAcronyms = getAcronymsForRound(round: currentRound)
        currentAcronym = roundAcronyms.randomElement() ?? "ASAP"
        guessedLetters.insert(letter)
        
        if currentAcronym.contains(letter) {
            correctGuesses.insert(letter)
        } else {
            wrongGuesses += 1
            guessesSoFar += 1
            guessesRemaining -= 1
        }
    
        guessesSoFar += 1
    }
    
    func getAcronymsForRound(round: Int) -> [String] {
        switch round {
        case 1:
            return ["ASAP", "BTW", "FYI", "IMO", "LOL", "NVM", "WWJD", "YOLO", "ROFL", "OMG", "JFYI", "TYT", "SMH"]
        case 2:
            return ["BFF", "DIY", "ETA", "TBA", "TBD", "TGIF", "WTG", "NSFW", "IYKYK", "FOMO", "BRB", "AMA"]
        case 3:
            return ["CEO", "EOD", "EOY", "NDA", "ROI", "CFO", "UI", "VPN", "GPA"]
        case 4:
            return ["ESL", "STEM", "ADHD", "AIDS", "BPM", "DNA", "ICU", "RNA", "ACT"]
        default:
            return []
        }
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
            if guessesRemaining <= 0 || currentAcronym.allSatisfy({!correctGuesses.contains($0)}){
                Text(guessesRemaining <= 0 ? "Game Over" : "You Lose")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                Button("Start New Game") {
                    currentRound += 1
                    startNewGame()
                    
                }
                
                .padding()
            } else if currentAcronym.allSatisfy({correctGuesses.contains($0)}) {
                
                // Player guesses the Acronym Correctly, move to the next round
                Text("You Win Guessify!")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                Button("Next Round") {
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
        

