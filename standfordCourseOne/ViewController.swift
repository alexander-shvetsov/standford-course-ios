//
//  ViewController.swift
//  standfordCourseOne
//
//  Created by Shvetsov_AV on 01.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // change label on click card
    var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    // change values of card if click on card
    func flipButton(emoji: String, button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0, green: 0.6312296391, blue: 0.8726374507, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    // values of cards
    let emojiCollection = ["🦊", "🐼", "🦊", "🐼"]

    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBOutlet weak var touchLabel: UILabel!
    
    @IBAction func cardButton(_ sender: UIButton) {
        
        // change label on click card
        touches += 1
        
        // change value of card if click on card
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            flipButton(emoji: emojiCollection[buttonIndex], button: sender)
        }
        
    }
    
}

