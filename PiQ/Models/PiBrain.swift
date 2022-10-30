//
//  PiBrain.swift
//  PiQ
//
//  Created by Oscar Diaz Caballero on 29/10/22.
//

import Foundation

struct PiBrain {
    
    var currentDigit = 0
    var mistakesCount = 0
    
    mutating func checkDigitPressed(_ digit: String) -> Bool {
        if currentDigit >= Constants.PI_DECIMALS.count {
            return false
        }
        
        let correctDigit = String(Constants.PI_DECIMALS[currentDigit])
        if correctDigit == digit {
            currentDigit += 1
            return true
        } else {
            mistakesCount += 1
            return false
        }
    }
    
    func getCorrectDigitCount() -> Int {
        return currentDigit
    }
    
    func getMistakesCount() -> Int {
        return mistakesCount
    }
    
    func getCurrentPi() -> String {
        return "3." + Constants.PI_DECIMALS.substring(to: currentDigit)
    }
    
    mutating func reset() {
        currentDigit = 0
        mistakesCount = 0
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
    
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }
}
