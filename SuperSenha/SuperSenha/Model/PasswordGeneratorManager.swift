//
//  PasswordGeneratorManager.swift
//  SuperSenha
//
//  Created by Anderson Alencar on 17/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import Foundation

class PasswordGeneratorManager {
    
    static let shared = PasswordGeneratorManager()
    
    private var numberOfCharacters: Int = 4
    private var numberOfPasswords: Int = 4
    private var useLowerCaseLetters: Bool = false
    private var useCapitalLetters: Bool = false
    private var useNumbers: Bool = false
    private var useSpecialCharacters: Bool = false
    
    var passwords: [String] = []
    
    private let letters: String = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters: String = "!@#$%ˆ&*?<>:"
    private let numbers: String = "0123456789"
    
    private init() {}
    
    func configurePasswords(numberOfCharacters: Int, numberOfPasswords: Int, useLowerCaseLetters: Bool, useCapitalLetters: Bool, useNumbers: Bool, useSpecialCharacters: Bool ) {
        self.numberOfCharacters = numberOfCharacters
        self.numberOfPasswords = numberOfPasswords
        self.useLowerCaseLetters = useLowerCaseLetters
        self.useCapitalLetters = useCapitalLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useSpecialCharacters
    }
    
    func generate() -> [String] {
        self.passwords.removeAll()
        
        var universe: String = ""
        if useLowerCaseLetters {
            universe += letters
        }
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        if useNumbers {
            universe += numbers
        }
        if useSpecialCharacters {
            universe += specialCharacters
        }
        
        let universeArray = Array(universe)
        
        while self.passwords.count < numberOfPasswords {
            var password = ""
            for _ in 1...numberOfCharacters {
                let index = Int.random(in: 0..<universeArray.count)
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        return passwords
    }
    
}
