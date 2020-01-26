//
//  TipTableViewCell.swift
//  SuperSenha
//
//  Created by Anderson Alencar on 16/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class TipTableViewCell: UITableViewCell {

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
    lazy var tipLabel: UILabel = {
        let tipLabel = UILabel()
        tipLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        tipLabel.numberOfLines = 0
        tipLabel.textColor = Color.primaryColor
        tipLabel.translatesAutoresizingMaskIntoConstraints = false
        return tipLabel
    }()
    
    lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        descriptionLabel.textColor = UIColor.black
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUP()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUP()
    }
    
    func prepareCell(tip: Tip) {
        tipLabel.text = tip.title
        descriptionLabel.text = tip.description
    }
}

extension TipTableViewCell: ViewCode {
    func buildHierarchy() {
        addSubview(tipLabel)
        addSubview(descriptionLabel)
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            tipLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            tipLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            tipLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: tipLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}
