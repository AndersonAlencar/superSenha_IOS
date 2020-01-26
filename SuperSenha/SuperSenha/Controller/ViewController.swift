//
//  ViewController.swift
//  SuperSenha
//
//  Created by Anderson Alencar on 13/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var passwordView: PasswordPreferencesView = {
        let passwordView = PasswordPreferencesView()
        passwordView.generatePassowrdsButton.addTarget(self, action: #selector(generatePasswords), for: UIControl.Event.touchUpInside)
        return passwordView
    }()
    
    lazy var passwordManager: PasswordGeneratorManager = {
        let generatorManager = PasswordGeneratorManager.shared
        return generatorManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = passwordView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Gerador de Senhas"
        let backbutton = UIBarButtonItem()
        backbutton.title = "Voltar"
        navigationItem.backBarButtonItem = backbutton
    }
   
    @objc func generatePasswords() {
        if passwordView.numberPasswordsView.preferenceTextFild.text!.isEmpty || passwordView.totalCharactersView.preferenceTextFild.text!.isEmpty {
            let alert = UIAlertController(title: "Quantidade Incorreta",
                                          message: "Digite a quantidade de senhas ou caracteres corretamente",
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let numberOfPasswords = Int(passwordView.numberPasswordsView.preferenceTextFild.text!)!
            let numberOfCharacters = Int(passwordView.totalCharactersView.preferenceTextFild.text!)!
            let useCapitalLetters = passwordView.useCapitalLettersView.preferenceSwitch.isOn
            let useLowerCaseLetters = passwordView.useLowercaseLettersView.preferenceSwitch.isOn
            let useNumbers = passwordView.useNumbersView.preferenceSwitch.isOn
            let useSpecialCharacters = passwordView.useEspecialCharactersView.preferenceSwitch.isOn
            
            passwordManager.configurePasswords(numberOfCharacters: numberOfCharacters, numberOfPasswords:
                numberOfPasswords, useLowerCaseLetters: useLowerCaseLetters,
                useCapitalLetters: useCapitalLetters, useNumbers: useNumbers, useSpecialCharacters: useSpecialCharacters)
            
            let showPasswordsController = ShowPasswordsViewController()
            navigationController?.pushViewController(showPasswordsController, animated: true)
        }
    }

}
