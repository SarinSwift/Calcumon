//
//  ViewLogPressedCell.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/25/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class ViewLogPressedCell: UITableViewCell {


    let answerStateIV: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "correct")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "1+1"
        label.textColor = #colorLiteral(red: 0.3411764706, green: 0.3411764706, blue: 0.3411764706, alpha: 1)
        label.font = UIFont(name: "Arial", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let answerLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textColor = #colorLiteral(red: 0.3411764706, green: 0.3411764706, blue: 0.3411764706, alpha: 1)
        label.font = UIFont(name: "Arial", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    func setupView() {
        addSubview(answerStateIV)
        addSubview(questionLabel)
        addSubview(answerLabel)

        // correct/wrong image
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: answerStateIV, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: answerStateIV, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 50)
            ])
        answerStateIV.addConstraints([
            NSLayoutConstraint(item: answerStateIV, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30),
            NSLayoutConstraint(item: answerStateIV, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30),
            ])

        NSLayoutConstraint.activate([
            questionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            questionLabel.leftAnchor.constraint(equalTo: answerStateIV.rightAnchor, constant: 15)
            ])
        NSLayoutConstraint.activate([
            answerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            answerLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -50)
            ])

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
