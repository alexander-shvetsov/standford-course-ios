//
//  ViewController.swift
//  standfordCourseOne
//
//  Created by Shvetsov_AV on 01.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = ConcentrationGame(numberOfCards: numberOfCards)
    
    var numberOfCards: Int {
        return (buttonCollection.count + 1) / 2
    }
    
    private(set) var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    private var emojiCollection = ["🦊", "🐼", "🐽", "🐝", "🪲", "🐰", "🦧", "🦑", "🐳", "🐡", "🦬", "🦚", "⛄️"]
    
    private var emojiDictionary = [Int: String]()
    
    private func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.identifiere] == nil {
            emojiDictionary[card.identifiere] = emojiCollection.remove(at: emojiCollection.count.arc4randomExtension)
        }
        
        return emojiDictionary[card.identifiere] ?? ""
    }
    
    private func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
            }
        }
    }

    @IBOutlet private var buttonCollection: [UIButton]!
    @IBOutlet private weak var touchLabel: UILabel!
    @IBAction private func cardButton(_ sender: UIButton) {
        
        touches += 1
        
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
        
    }
    
}

extension Int {
    var arc4randomExtension: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
