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

class CardSetListTableViewDataSource: NSObject, UITableViewDataSource {
    
    var sets = [CardSetList.ViewModel]()
    var navigationDelegate: NavigationDelegate?
    
    override init() {
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sets.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sets[section].setName
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardSetList.tableViewCellIdentifier) as! CardSetListTableViewCell
        cell.setupView()
        cell.collectionWrapperView.datasource.cards = sets[indexPath.section].typedCards
        cell.collectionWrapperView.setupNavigationDelegate(delegate: self.navigationDelegate)
        return cell
    }
    
    
    /// Smart Append
    ///
    /// - Parameter model: Takes a CardSetList.ViewModel as Parameter
    func smartAppend(model: CardSetList.ViewModel){
        guard sets.count > 0 else {
            sets.append(model)
            return
        }
        var newModels:[CardSetList.ViewModel] = []
        for var currentModel in sets{
            if currentModel.setName == model.setName{
//                currentModel.update(cards: model.typedCards)
                newModels.append(model)
            }else{
                newModels.append(currentModel)
            }
            
        }
        sets = newModels
    }
    
}
