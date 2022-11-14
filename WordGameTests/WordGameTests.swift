//
//  WordGameTests.swift
//  WordGameTests
//
//  Created by Daniel Alvarez on 13/11/22.
//

import XCTest
@testable import WordGame

final class WordGameTests: XCTestCase {

    override func setUpWithError() throws {
        let word1 = Word(english: "primary school", spanish: "escuela primaria")
        let word2 = Word(english: "teacher", spanish: "profesor / profesora")
        let word3 = Word(english: "pupil", spanish: "alumno / alumna")
        Word.all = [word1, word2, word3]
    }

    override func tearDownWithError() throws { }

    func testParseJson() throws {
        let json = """
        [
          {
            "text_eng":"primary school",
            "text_spa":"escuela primaria"
          },
          {
            "text_eng":"teacher",
            "text_spa":"profesor / profesora"
          },
          {
            "text_eng":"pupil",
            "text_spa":"alumno / alumna"
          }
        ]
        """
        let words = try! JSONDecoder().decode([Word].self, from: json.data(using: .utf8)!)
        XCTAssertEqual(words.count, 3)
        XCTAssertEqual(words.first!, Word(english: "primary school", spanish: "escuela primaria"))
        XCTAssertEqual(words[1], Word(english: "teacher", spanish: "profesor / profesora"))
        XCTAssertEqual(words.last!, Word(english: "pupil", spanish: "alumno / alumna"))
    }

    func testRandomWord() {
        let word = Word(english: "primary school", spanish: "escuela primaria")
        XCTAssertTrue(Word.all.contains(word))
    }
    
    func testRandomOfFour() {
        let word = Word(english: "primary school", spanish: "escuela primaria")
        let candidates = [word, Word.random, Word.random, Word.random]
        Word.all = candidates
        XCTAssertTrue(candidates.contains(word.randomOfFour))
    }
}
