//
//  TipsManager.swift
//  SuperSenha
//
//  Created by Anderson Alencar on 16/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import Foundation

class TipsManager {
    
    static let shared = TipsManager()
    
    lazy var tips: [Tip] = {
        return loadTips()
    }()
    
    private init() {}
    
    private func loadTips() -> [Tip] {
        let fileURL = Bundle.main.url(forResource: "tips", withExtension: "json")!
        let jsonData = try! Data(contentsOf: fileURL)
        
        do {
            let tips = try JSONDecoder().decode([Tip].self, from: jsonData)
            return tips
        } catch {
            print(error.localizedDescription)
        }
        return tips
    }
}
