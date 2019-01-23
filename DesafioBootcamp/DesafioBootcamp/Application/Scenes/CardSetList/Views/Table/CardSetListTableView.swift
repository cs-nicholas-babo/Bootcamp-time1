//
//  CardSetListTableView.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 18/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import UIKit

class CardSetListTableView: UITableView {
   
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardSetListTableView: ViewCode{
    func setupViewHierarchy() { }
    
    func setupConstraints() { }
    
    func setupAdditionalConfiguration() {
        register(CardSetListTableViewCell.self, forCellReuseIdentifier: CardSetList.tableViewCellIdentifier)
        self.bounces = false
        self.backgroundColor = UIColor.clear
        let backgroundImageView = UIImageView(frame: self.frame)
        backgroundImageView.image = UIImage(named: "placeholder")
        backgroundImageView.contentMode = .scaleAspectFill
        self.backgroundView = backgroundImageView
    }
 
}
