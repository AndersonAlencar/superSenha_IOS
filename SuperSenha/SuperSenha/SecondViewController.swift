//
//  SecondViewController.swift
//  SuperSenha
//
//  Created by Anderson Alencar on 09/06/19.
//  Copyright © 2019 Anderson Alencar. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var tvPasswords: UITextView!
    @IBOutlet weak var MyGenerateButton: UIButton!
    
    var numberOfCharacters: Int!
    var numberOfPasswords: Int!
    var useLowerCaseLetters: Bool!
    var useCapitalLetters: Bool!
    var useNumbers: Bool!
    var useSpecialCharacters: Bool!

    
    var passwordGenerator: PasswordGenerator!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Lista De Senhas: \(self.numberOfPasswords!)" // -> definindo o Tilte da navigation Item da segunda view
        self.view.backgroundColor  = UIColor(red: CGFloat(152)/255, green: CGFloat(36)/255, blue: CGFloat(101)/255, alpha: 1.0) // -> definindo a cor de background da view
        self.MyGenerateButton.layer.cornerRadius = 10
        
        self.passwordGenerator = PasswordGenerator(numberOfCharacters: self.numberOfCharacters, numberOfPasswords: self.numberOfPasswords, useLowerCaseLetters: self.useLowerCaseLetters, useCapitalLetters: self.useCapitalLetters, useNumbers: self.useNumbers, useSpecialCharacters: self.useSpecialCharacters)
        
        generatePassword()
        
    }
    
    
    func generatePassword() {
        self.tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        self.tvPasswords.text = ""
        let passwords = passwordGenerator.generate(total: self.numberOfPasswords)
        for password in passwords {
            self.tvPasswords.text.append(password + "\n\n")
        }
    }
    
    
    
    @IBAction func GenerateAgain(_ sender: Any) {
        generatePassword()
    }
    
    

}
