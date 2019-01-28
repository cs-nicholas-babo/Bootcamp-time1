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
import PlatformLocalDatabase
import PlatformAPI

class CardSetListTableViewDataSource: NSObject, UITableViewDataSource {
    
    var sets = [CardSetList.ViewModel](){
        didSet{
            validSets = sets.filter({$0.typedCards.count > 0})
            if oldValue.count != sets.count{
                table?.reloadData()
            }
        }
    }
    var validSets = [CardSetList.ViewModel]()
    var navigationDelegate: NavigationDelegate?
    var table: CardSetListTableView?
    var setNumber = 0
    
    override init() {
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return validSets.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return validSets[section].setName
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardSetList.tableViewCellIdentifier) as! CardSetListTableViewCell
        
        if !isLoadingCell(for: indexPath){
            cell.setupView()
            cell.collectionWrapperView.datasource.cards = validSets[indexPath.section].typedCards
            cell.collectionWrapperView.setupNavigationDelegate(delegate: self.navigationDelegate)
            cell.collectionWrapperView.collectionView.reloadData()
        }
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
        var updatedSection = 0
        for i in 0...sets.count-1{
            let currentModel = sets[i]
            if currentModel.setName == model.setName{
                newModels.append(model)
                updatedSection = i
            }else{
                newModels.append(currentModel)
            }
        }
        sets = newModels
        table?.reloadSections(IndexSet(integer: updatedSection), with: .none)
    }
    
}

extension CardSetListTableViewDataSource: UITableViewDataSourcePrefetching{
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.section >= self.sets.count
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {}
    
}
