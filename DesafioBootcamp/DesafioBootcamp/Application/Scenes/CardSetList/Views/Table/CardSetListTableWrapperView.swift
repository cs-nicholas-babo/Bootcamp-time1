//
//  CardsSetListTableWrapperView.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain
import UIKit

class CardSetListTableWrapperView: UIView{
    
    lazy var tableView: CardSetListTableView = {
        let tableView = CardSetListTableView(frame: self.frame)
        return tableView
    }()
    
    let datasource = CardSetListTableViewDataSource()
    let delegate = CardSetListTableViewDelegate()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.tableView.dataSource = self.datasource
        self.tableView.delegate = self.delegate
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardSetListTableWrapperView: ViewCode{
    func setupViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        self.tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
