//
//  ViewController.swift
//  Set-Game
//
//  Created by Madalina Sinca on 09/07/2019.
//  Copyright © 2019 Madalina Sinca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = Deck()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var CardView: CardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left, .right]
            CardView.addGestureRecognizer(swipe)
            
            let pinch = UIPinchGestureRecognizer(target: CardView, action: #selector(CardView.adjustFaceCardScale(byHandlingGestureRecognizedBy: )))
            CardView.addGestureRecognizer(pinch)
        }
    }
    
    @objc func nextCard() {
        if let card = deck.draw() {
            CardView.rank = card.rank.order
            CardView.suit = card.suit.rawValue
        }
    }
    
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            CardView.isFaceUp = !CardView.isFaceUp
        default: break
        }
    }
    
}

