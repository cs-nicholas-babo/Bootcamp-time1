//
//  CardSetListTableViewDataSource.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import UIKit
import Domain

class CardSetListTableViewDataSource: NSObject, UITableViewDataSource{
    
    var sets = [CardSetList.ViewModel]()
    
    override init() {
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sets.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sets.map{ $0.setName }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardSetList.tableViewCellIdentifier) as! CardSetListTableViewCell
        cell.setupView()
        cell.collectionWrapperView.datasource.cards = sets[indexPath.row].typedCards
        return cell
    }
    
    
}
