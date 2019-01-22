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

class CardsSetListTableWrapperView: UIView{
    
    lazy var tableView: CardSetListTableView = {
        let tableView = CardSetListTableView(frame: .zero)
        return tableView
    }()
    
    let datasource = CardSetListTableViewDataSource()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardsSetListTableWrapperView: ViewCode{
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

extension CardsSetListTableWrapperView: DataFeeder{
    typealias FeedData = [CardSet]
    
    func feed(data: [CardSet]) {
        datasource.sets = data
    }
}
