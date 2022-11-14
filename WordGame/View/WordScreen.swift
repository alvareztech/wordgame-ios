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
            Text(secondWord?.english ?? "")
                .font(.title)
                .foregroundColor(.secondary)
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
    }
    
    func nextWord() {
        firstWord = Word.random
        secondWord = firstWord?.randomOfFour
    }
    
    func checkAnswer(_ answer: Bool) {
        if answer {
            correctAttempts += 1
        } else {
            wrongAttempts += 1
        }
        nextWord()
    }
}

struct WordScreen_Previews: PreviewProvider {
    static var previews: some View {
        WordScreen()
    }
}
