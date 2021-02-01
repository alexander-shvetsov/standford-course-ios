//
//  Card.swift
//  standfordCourseOne
//
//  Created by Shvetsov_AV on 01.02.2021.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifiere: Int
    
    static var identifierNumber = 0
    
    static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.identifiere = Card.identifierGenerator()
    }
}
