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
    var navigationDelegate: NavigationDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        datasource.table = tableView
        self.tableView.dataSource = self.datasource
//        self.tableView.prefetchDataSource = self.datasource
        self.tableView.delegate = self.delegate
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNavigationDelegate(delegate: NavigationDelegate){
        self.navigationDelegate = delegate
        datasource.navigationDelegate = delegate
    }
}

extension CardSetListTableWrapperView: ViewCode{
    func setupViewHierarchy() {
        addSubview(self.tableView)
    }
    
    func setupConstraints() {
        self.tableView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(8.proportionalToHeight)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
    }
}
