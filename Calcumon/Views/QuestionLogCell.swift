//
//  QuestionLogCell.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/21/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class QuestionLogCell: UITableViewCell {
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "1+1"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let answerLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        addSubview(questionLabel)
        addSubview(answerLabel)
        
        NSLayoutConstraint.activate([
            questionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            questionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15)
            ])
        NSLayoutConstraint.activate([
            answerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            answerLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15)
            ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
