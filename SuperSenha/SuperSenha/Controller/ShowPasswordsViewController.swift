//
//  ShowPasswordsViewController.swift
//  SuperSenha
//
//  Created by Anderson Alencar on 13/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class ShowPasswordsViewController: UIViewController {

    lazy var passwordsView: ShowPasswordsView = {
        let passwordsView = ShowPasswordsView()
        passwordsView.safetyTipsButton.addTarget(self, action: #selector(presentTips), for: UIControl.Event.touchUpInside)
        passwordsView.generatePasswordsAgainButton.addTarget(self, action: #selector(showPasswords), for: UIControl.Event.touchUpInside)
        return passwordsView
    }()
    
    lazy var passwordManager: PasswordGeneratorManager = {
        let generatorManager = PasswordGeneratorManager.shared
        return generatorManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = passwordsView
        navigationItem.title = "Senhas Geradas"
        showPasswords()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    @objc func presentTips() {
        let modal = SecurityTipsViewController()
        present(modal, animated: true, completion: nil)
    }
    
    @objc func showPasswords() {
        passwordsView.textPasswordsTextView.scrollRangeToVisible(NSRange(location: 0, length: 0))
        passwordsView.textPasswordsTextView.text = ""
        let passwords = passwordManager.generate()
        for password in passwords {
            passwordsView.textPasswordsTextView.text.append(password + "\n\n")
        }
    }
}
