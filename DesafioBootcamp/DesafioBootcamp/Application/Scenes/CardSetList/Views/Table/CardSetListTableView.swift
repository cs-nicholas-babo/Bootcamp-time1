//
//  CardSetListTableView.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 18/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import UIKit

class CardSetListTableView: UITableView {


}

extension CardSetListTableView: ViewCode{
    func setupViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfiguration() {
        register(CardSetListTableViewCell.self, forCellReuseIdentifier: CardSetList.tableViewCellIdentifier)
    }
 
}
