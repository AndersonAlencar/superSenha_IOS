//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Anderson Alencar on 14/06/19.
//  Copyright © 2019 Anderson Alencar. All rights reserved.
//

import Foundation

class PasswordGenerator {
    
    var numberOfCharacters: Int
    var numberOfPasswords: Int
    var useLowerCaseLetters: Bool
    var useCapitalLetters: Bool
    var useNumbers: Bool
    var useSpecialCharacters: Bool
    
    var passwords: [String] = []
    
    private let letters: String = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters: String = "!@#$%ˆ&*?<>:"
    private let numbers: String = "0123456789"
    
    init(numberOfCharacters: Int, numberOfPasswords: Int, useLowerCaseLetters: Bool, useCapitalLetters: Bool, useNumbers: Bool, useSpecialCharacters: Bool) {
        
        self.numberOfCharacters = numberOfCharacters
        self.numberOfPasswords = numberOfPasswords
        self.useLowerCaseLetters = useLowerCaseLetters
        self.useCapitalLetters = useCapitalLetters
        self.useNumbers = useNumbers
        self.useSpecialCharacters = useSpecialCharacters
    }
    
    func generate(total: Int) -> [String] {
        self.passwords.removeAll()
        
        var universe: String = ""
        if useLowerCaseLetters {
            universe += self.letters
        }
        if useCapitalLetters {
            universe += self.letters.uppercased()
        }
        if useNumbers {
            universe += self.numbers
        }
        if useSpecialCharacters {
            universe += self.specialCharacters
        }
        
        let universeArray = Array(universe)
        
        while self.passwords.count < total {
            
            var password = ""
            for _ in 1...self.numberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            self.passwords.append(password)
        }
        
        
        
        return passwords
    }
    
    
}
