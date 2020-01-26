//
//  SwitchInputView.swift
//  SuperSenha
//
//  Created by Anderson Alencar on 13/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class SwitchInputView: UIView {
    
    lazy var labelDescription: UILabel =  {
        let labelDescription = UILabel()
        labelDescription.lineBreakMode = .byWordWrapping
        labelDescription.numberOfLines = 0
        labelDescription.textColor = UIColor(red: 0.67, green: 0.23, blue: 0.47, alpha: 1.0)
        labelDescription.font = UIFont.systemFont(ofSize: 17)
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        return labelDescription
    }()
    
    lazy var preferenceSwitch: UISwitch = {
        var preferenceSwitch = UISwitch()
        preferenceSwitch.isOn = true
        preferenceSwitch.translatesAutoresizingMaskIntoConstraints = false
        return preferenceSwitch
    }()
    
    init(frame: CGRect, labelDescription: String) {
        super.init(frame: frame)
        self.labelDescription.text = labelDescription
        setUP()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUP()
    }
}

extension SwitchInputView: ViewCode {
    func buildHierarchy() {
        addSubview(labelDescription)
        addSubview(preferenceSwitch)
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            preferenceSwitch.topAnchor.constraint(equalTo: topAnchor),
            preferenceSwitch.bottomAnchor.constraint(equalTo: bottomAnchor),
            preferenceSwitch.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            preferenceSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            labelDescription.topAnchor.constraint(equalTo: topAnchor),
            labelDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            labelDescription.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.5),
            labelDescription.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
