//
//  WordScreen.swift
//  WordGame
//
//  Created by Daniel Alvarez on 13/11/22.
//

import SwiftUI

struct WordScreen: View {
    private var words: [Word] = Word.all
    @State private var correctAttempts = 0
    @State private var wrongAttempts = 0
    @State private var first: Word?
    @State private var second: Word?
    @State private var answersCount = 0
    
    @State var timer = Timer.publish(every: kDefaultTimerInSeconds, on: .main, in: .common).autoconnect()
    
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
            Text(first?.spanish ?? "")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(second?.english ?? "")
                .font(.title)
                .foregroundColor(.secondary)
            Spacer()
            HStack {
                Button {
                    timer = Timer.publish(every: kDefaultTimerInSeconds, on: .main, in: .common).autoconnect()
                    checkAnswer(first?.english == second?.english)
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
                    timer = Timer.publish(every: kDefaultTimerInSeconds, on: .main, in: .common).autoconnect()
                    checkAnswer(first?.english != second?.english)
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
        .task {
            first = Word.random
            second = first?.randomOfFour
        }
        .onReceive(timer) { _ in
            checkAnswer(false)
        }
    }
    
    func checkAnswer(_ answer: Bool) {
        if answer {
            correctAttempts += 1
        } else {
            wrongAttempts += 1
            if wrongAttempts == kDefaultWrongAtteptsAllowed {
                endGame()
            }
        }
        nextWord()
    }
    
    func nextWord() {
        answersCount += 1
        if answersCount > kDefaultWordsAllowed {
            endGame()
        }
        first = Word.random
        second = first?.randomOfFour
    }
    
    func endGame() {
        // Leaving the application is an action not recommended by Apple, but it was put to meet the requirements.
        exit(-1)
    }
}

struct WordScreen_Previews: PreviewProvider {
    static var previews: some View {
        WordScreen()
    }
}
