//
//  SecurityTipsViewController.swift
//  SuperSenha
//
//  Created by Anderson Alencar on 13/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class SecurityTipsViewController: UIViewController {

    lazy var securityView: SecurityView = {
        let securityView = SecurityView()
        securityView.tipsTableView.delegate = self
        securityView.tipsTableView.dataSource = self
        securityView.tipsTableView.register(TipTableViewCell.self, forCellReuseIdentifier: "cell")
        let navigationItem = UINavigationItem(title: "10 Dicas para senhas fortes")
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(close))
        securityView.navBar.setItems([navigationItem], animated: true)
        securityView.navBar.barTintColor = .white
        return securityView
    }()
    
    let tipManager = TipsManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isModalInPresentation = true
        view = securityView
    }
    
    @objc func close() {
        dismiss(animated: true, completion: nil)
    }
    
}

extension SecurityTipsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tipManager.tips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TipTableViewCell
        cell.prepareCell(tip: tipManager.tips[indexPath.row])
        return cell
    }
}
