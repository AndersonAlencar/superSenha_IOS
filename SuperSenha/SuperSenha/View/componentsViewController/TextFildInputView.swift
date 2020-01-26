//
//  TextFildInputView.swift
//  SuperSenha
//
//  Created by Anderson Alencar on 13/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class TextFildInputView: UIView {

    lazy var labelDescription: UILabel =  {
        let labelDescription = UILabel()
        labelDescription.textColor = Color.primaryColor
        labelDescription.font = UIFont.systemFont(ofSize: 17)
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        return labelDescription
    }()
    
    lazy var preferenceTextFild: UITextField = {
        let preferenceTextFild = UITextField()
        preferenceTextFild.keyboardType = .asciiCapableNumberPad
        preferenceTextFild.borderStyle = .roundedRect
        preferenceTextFild.textAlignment = .natural
        preferenceTextFild.translatesAutoresizingMaskIntoConstraints = false
        return preferenceTextFild
    }()
    
    init(frame: CGRect, labelDescription: String, preferenceText: String) {
        super.init(frame: frame)
        self.labelDescription.text = labelDescription
        self.preferenceTextFild.placeholder = preferenceText
        setUP()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUP()
    }
    
}

extension TextFildInputView: ViewCode {
    func buildHierarchy() {
        addSubview(labelDescription)
        addSubview(preferenceTextFild)
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            preferenceTextFild.topAnchor.constraint(equalTo: topAnchor),
            preferenceTextFild.bottomAnchor.constraint(equalTo: bottomAnchor),
            preferenceTextFild.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.21),
            preferenceTextFild.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)//mudar
        ])
        
        NSLayoutConstraint.activate([
            labelDescription.topAnchor.constraint(equalTo: topAnchor),
            labelDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            labelDescription.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.5),
            labelDescription.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
