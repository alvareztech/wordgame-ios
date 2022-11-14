//
//  Word.swift
//  WordGame
//
//  Created by Daniel Alvarez on 13/11/22.
//

import Foundation

struct Word: Codable, Equatable {
    var english: String
    var spanish: String
    
    enum CodingKeys: String, CodingKey {
        case english = "text_eng"
        case spanish = "text_spa"
    }
    
    static var all: [Word] = {
        guard let path = Bundle.main.path(forResource: "words", ofType: "json") else { return [] }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            if let words = try? JSONDecoder().decode([Word].self, from: data) {
                return words
            }
        } catch { return [] }
        return []
    }()
    
    static var random: Word {
        all[Int.random(in: 0..<all.count)]
    }
    
    var randomOfFour: Word {
        let candidates = [self, Word.random, Word.random, Word.random]
        return candidates[Int.random(in: 0..<candidates.count)]
    }
}
