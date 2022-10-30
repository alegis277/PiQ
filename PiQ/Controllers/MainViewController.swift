//
//  ViewController.swift
//  PiQ
//
//  Created by Oscar Diaz Caballero on 29/10/22.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var enteredPiDigits: UILabel!
    @IBOutlet weak var mistakesCount: UILabel!
    @IBOutlet weak var digitsCount: UILabel!
    
    var piBrain = PiBrain()

    @IBAction func resetPressed(_ sender: UIButton) {
        enteredPiDigits.text = "3._"
        mistakesCount.text = "0"
        digitsCount.text = "0"
        enteredPiDigits.textColor = UIColor.black
        piBrain.reset()
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
        let digit = sender.titleLabel!.text
        if let safeDigit = digit {
            if piBrain.checkDigitPressed(safeDigit) {
                digitsCount.text = String(piBrain.getCorrectDigitCount())
                enteredPiDigits.text = piBrain.getCurrentPi() + "_"
                enteredPiDigits.textColor = UIColor.black
                
            } else {
                mistakesCount.text = String(piBrain.getMistakesCount())
                enteredPiDigits.textColor = UIColor(named: "Orange2")
            }
        }
    }
}

