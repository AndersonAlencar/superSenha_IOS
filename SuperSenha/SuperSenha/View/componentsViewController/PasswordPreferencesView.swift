//
//  PasswordPreferencesView.swift
//  SuperSenha
//
//  Created by Anderson Alencar on 13/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class PasswordPreferencesView: UIView {

    lazy var numberPasswordsView: TextFildInputView = {
        let numberPasswords = TextFildInputView(frame: CGRect.zero, labelDescription: "Quantidade de senhas:", preferenceText: "min 4")
        numberPasswords.translatesAutoresizingMaskIntoConstraints = false
        return numberPasswords
    }()
    
    lazy var totalCharactersView: TextFildInputView = {
        let totalCharacters = TextFildInputView(frame: CGRect.zero, labelDescription: "Total de caracteres:", preferenceText: "máx 16")
        totalCharacters.translatesAutoresizingMaskIntoConstraints = false
        return totalCharacters
    }()
    
    lazy var useCapitalLettersView: SwitchInputView = {
        let useCapitalLetters = SwitchInputView(frame: CGRect.zero, labelDescription: "Usar letras maiúsculas:")
        useCapitalLetters.translatesAutoresizingMaskIntoConstraints = false
        return useCapitalLetters
    }()
    
    lazy var useLowercaseLettersView: SwitchInputView = {
        let useLowercaseLetters = SwitchInputView(frame: CGRect.zero, labelDescription: "Usar letras minúsculas:")
        useLowercaseLetters.translatesAutoresizingMaskIntoConstraints = false
        return useLowercaseLetters
    }()
    
    lazy var useNumbersView: SwitchInputView = {
        let useNumbers = SwitchInputView(frame: CGRect.zero, labelDescription: "Usar números:")
        useNumbers.translatesAutoresizingMaskIntoConstraints = false
        return useNumbers
    }()
    
    lazy var useEspecialCharactersView: SwitchInputView = {
        let useEspecialCharacters = SwitchInputView(frame: CGRect.zero, labelDescription: "Usar caracteres especiais:")
        useEspecialCharacters.translatesAutoresizingMaskIntoConstraints = false
        return useEspecialCharacters
    }()
    
    lazy var generatePassowrdsButton: UIButton = {
        let generatePassowrdsButton = UIButton()
        generatePassowrdsButton.setTitle("Gerar Senhas", for: UIControl.State.normal)
        generatePassowrdsButton.layer.cornerRadius = 10
        generatePassowrdsButton.backgroundColor = Color.primaryColor
        generatePassowrdsButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        generatePassowrdsButton.translatesAutoresizingMaskIntoConstraints = false
        return generatePassowrdsButton
    }()
    
    lazy var lockImageView: UIImageView = {
        let lockImage = UIImageView(image: UIImage(named: "lock"))
        lockImage.contentMode = .scaleAspectFit
        lockImage.clipsToBounds = true
        lockImage.translatesAutoresizingMaskIntoConstraints = false
        return lockImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUP()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUP()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
}

extension PasswordPreferencesView: ViewCode {
    func buildHierarchy() {
        addSubview(numberPasswordsView)
        addSubview(totalCharactersView)
        addSubview(useCapitalLettersView)
        addSubview(useLowercaseLettersView)
        addSubview(useNumbersView)
        addSubview(useEspecialCharactersView)
        addSubview(generatePassowrdsButton)
        addSubview(lockImageView)
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            numberPasswordsView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 52),
            numberPasswordsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            numberPasswordsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            numberPasswordsView.heightAnchor.constraint(equalToConstant: 30)
        
        ])
        
        NSLayoutConstraint.activate([
            totalCharactersView.topAnchor.constraint(equalTo: numberPasswordsView.bottomAnchor, constant: 10),
            totalCharactersView.leadingAnchor.constraint(equalTo: leadingAnchor),
            totalCharactersView.trailingAnchor.constraint(equalTo: trailingAnchor),
            totalCharactersView.heightAnchor.constraint(equalToConstant: 30)
        
        ])
        
        NSLayoutConstraint.activate([
            useCapitalLettersView.topAnchor.constraint(equalTo: totalCharactersView.bottomAnchor, constant: 10),
            useCapitalLettersView.leadingAnchor.constraint(equalTo: leadingAnchor),
            useCapitalLettersView.trailingAnchor.constraint(equalTo: trailingAnchor),
            useCapitalLettersView.heightAnchor.constraint(equalToConstant: 30)
        
        ])
        
        NSLayoutConstraint.activate([
            useLowercaseLettersView.topAnchor.constraint(equalTo: useCapitalLettersView.bottomAnchor, constant: 10),
            useLowercaseLettersView.leadingAnchor.constraint(equalTo: leadingAnchor),
            useLowercaseLettersView.trailingAnchor.constraint(equalTo: trailingAnchor),
            useLowercaseLettersView.heightAnchor.constraint(equalToConstant: 30)
        
        ])
        
        NSLayoutConstraint.activate([
            useNumbersView.topAnchor.constraint(equalTo: useLowercaseLettersView.bottomAnchor, constant: 10),
            useNumbersView.leadingAnchor.constraint(equalTo: leadingAnchor),
            useNumbersView.trailingAnchor.constraint(equalTo: trailingAnchor),
            useNumbersView.heightAnchor.constraint(equalToConstant: 30)
        
        ])
        
        NSLayoutConstraint.activate([
            useEspecialCharactersView.topAnchor.constraint(equalTo: useNumbersView.bottomAnchor, constant: 10),
            useEspecialCharactersView.leadingAnchor.constraint(equalTo: leadingAnchor),
            useEspecialCharactersView.trailingAnchor.constraint(equalTo: trailingAnchor)
            //useEspecialCharactersView.heightAnchor.constraint(equalToConstant: 30)
        
        ])
        
        NSLayoutConstraint.activate([
            generatePassowrdsButton.topAnchor.constraint(equalTo: useEspecialCharactersView.bottomAnchor, constant: 20),
            generatePassowrdsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            generatePassowrdsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            //generatePassowrdsButton.heightAnchor.constraint(equalToConstant: 44)
            generatePassowrdsButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.06)
        ])
        
        NSLayoutConstraint.activate([
            lockImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -36),
            lockImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lockImageView.topAnchor.constraint(equalTo: generatePassowrdsButton.bottomAnchor, constant: 10)
        
        ])
    }
    
    func additionalConfigurations() {
        backgroundColor = UIColor.white
    }
}
