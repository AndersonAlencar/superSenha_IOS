//
//  SecurityView.swift
//  SuperSenha
//
//  Created by Anderson Alencar on 16/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class SecurityView: UIView {
    
    lazy var tipsTableView: UITableView = {
        let tipsTable = UITableView()
        tipsTable.translatesAutoresizingMaskIntoConstraints = false
        return tipsTable
    }()
    
    lazy var navBar: UINavigationBar = {
        let navBar = UINavigationBar()
        navBar.isTranslucent = true
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
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

extension SecurityView: ViewCode {
    func buildHierarchy() {
        addSubview(navBar)
       // addSubview(titleLabel)
        addSubview(tipsTableView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: topAnchor),
            navBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            navBar.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.04)
        ])
        
        NSLayoutConstraint.activate([
            tipsTableView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 24),
            tipsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tipsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tipsTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func additionalConfigurations() {
        backgroundColor = UIColor.white
    }
}
