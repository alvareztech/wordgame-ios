//
//  WordGameApp.swift
//  WordGame
//
//  Created by Daniel Alvarez on 13/11/22.
//

import SwiftUI

let kDefaultTimerInSeconds: TimeInterval = 5
let kDefaultWrongAttemptsAllowed = 3
let kDefaultMaxWordsDisplayed = 15

@main
struct WordGameApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
