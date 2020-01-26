//
//  ViewCode.swift
//  SuperSenha
//
//  Created by Anderson Alencar on 13/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import Foundation

@objc protocol ViewCode {
    func buildHierarchy()
    func setUpConstraints()
    @objc optional func additionalConfigurations()
}

extension ViewCode {
    func setUP() {
        buildHierarchy()
        setUpConstraints()
        additionalConfigurations?()
    }
}
