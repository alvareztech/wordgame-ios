//
//  WordScreen.swift
//  WordGame
//
//  Created by Daniel Alvarez on 13/11/22.
//

import SwiftUI

struct WordScreen: View {
    @State private var correctAttempts = 0
    @State private var wrongAttempts = 0
    @State private var firstWord: Word?
    @State private var secondWord: Word?
    @State var timer = Timer.publish(every: kDefaultTimerInSeconds, on: .main, in: .common).autoconnect()
    @State private var wordsDisplayed = 0
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Correct attempts: \(correctAttempts)")
                .font(.body)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .trailing)
            Text("Wrong attempts: \(wrongAttempts)")
                .font(.body)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .trailing)
            Spacer()
            Text(firstWord?.spanish ?? "")
                .font(.largeTitle)
                .fontWeight(.bold)
                .animation(.easeIn)
                .accessibilityIdentifier("firstWord")
            Text(secondWord?.english ?? "")
                .font(.title)
                .foregroundColor(.secondary)
                .animation(.easeIn)
                .accessibilityIdentifier("secondWord")
            Spacer()
            HStack {
                Button {
                    checkAnswer(firstWord == secondWord)
                } label: {
                    Text("Correct")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .tint(.green)
                Button {
                    checkAnswer(firstWord != secondWord)
                } label: {
                    Text("Wrong")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .tint(.red)
            }
        }
        .onAppear {
            nextWord()
        }
        .onReceive(timer) { _ in
            checkAnswer(false)
        }
    }
    
    func nextWord() {
        wordsDisplayed += 1
        firstWord = Word.random
        secondWord = firstWord?.randomOfFour
        timer = Timer.publish(every: kDefaultTimerInSeconds, on: .main, in: .common).autoconnect()
        if wordsDisplayed > kDefaultMaxWordsDisplayed {
            finishGame()
        }
    }
    
    func checkAnswer(_ answer: Bool) {
        if answer {
            correctAttempts += 1
        } else {
            wrongAttempts += 1
            if wrongAttempts == kDefaultWrongAttemptsAllowed {
                finishGame()
            }
        }
        nextWord()
    }
    
    /// > Warning: Closing the application is an action not recommended by Apple, however it was placed to meet the requirements.
    func finishGame() {
        exit(-1)
    }
}

struct WordScreen_Previews: PreviewProvider {
    static var previews: some View {
        WordScreen()
    }
}
