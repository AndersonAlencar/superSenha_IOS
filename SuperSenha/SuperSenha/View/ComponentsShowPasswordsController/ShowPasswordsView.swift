//
//  ShowPasswordsView.swift
//  SuperSenha
//
//  Created by Anderson Alencar on 16/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class ShowPasswordsView: UIView {

    lazy var textPasswordsTextView: UITextView = {
        let textPasswords = UITextView()
        textPasswords.font = UIFont.systemFont(ofSize: 20)
        textPasswords.indicatorStyle = .white
        textPasswords.layer.masksToBounds = true
        textPasswords.layer.borderColor = UIColor.black.cgColor
        textPasswords.layer.borderWidth = 1.0
        textPasswords.translatesAutoresizingMaskIntoConstraints = false
        return textPasswords
    }()
    
    lazy var generatePasswordsAgainButton: UIButton = {
        let passwordsButton = UIButton()
        passwordsButton.setTitle("Gerar Novamente", for: UIControl.State.normal)
        passwordsButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        passwordsButton.backgroundColor = Color.primaryColor
        passwordsButton.layer.cornerRadius = 7
        passwordsButton.translatesAutoresizingMaskIntoConstraints = false
        return passwordsButton
    }()
    
    lazy var safetyTipsButton: UIButton = {
        let safetyButton = UIButton()
        safetyButton.setTitle("Dicas sobre segurança", for: UIControl.State.normal)
        safetyButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        safetyButton.backgroundColor = Color.secondaryColor
        safetyButton.layer.cornerRadius = 7
        safetyButton.translatesAutoresizingMaskIntoConstraints = false
        return safetyButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUP()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUP()
    }  
}

extension ShowPasswordsView: ViewCode {
    
    func buildHierarchy() {
        addSubview(textPasswordsTextView)
        addSubview(generatePasswordsAgainButton)
        addSubview(safetyTipsButton)
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            textPasswordsTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            textPasswordsTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textPasswordsTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            generatePasswordsAgainButton.topAnchor.constraint(equalTo: textPasswordsTextView.bottomAnchor, constant: 12),
            generatePasswordsAgainButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            generatePasswordsAgainButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            safetyTipsButton.topAnchor.constraint(equalTo: generatePasswordsAgainButton.bottomAnchor, constant: 12),
            safetyTipsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            safetyTipsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            safetyTipsButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
        
    }
    
    func additionalConfigurations() {
        backgroundColor = UIColor.white
    }
}
