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
            if oldValue.count != sets.count{
                table?.reloadData()
            }
        }
    }
    var navigationDelegate: NavigationDelegate?
    var table: CardSetListTableView?
    var metaSets:[MetaCardSet] = []{
        didSet{
            table?.reloadData()
        }
    }
    var setNumber = 0
    
    override init() {
        super.init()
        let service = CacheServiceProvider().useCase()
        service.fetchSets { (result) in
            switch result{
            case .success(let sets):
                    self.metaSets = sets
            case .failure(let error):
                    print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return metaSets.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return metaSets[section].name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardSetList.tableViewCellIdentifier) as! CardSetListTableViewCell
        
        if !isLoadingCell(for: indexPath){
            cell.setupView()
            cell.collectionWrapperView.datasource.cards = sets[indexPath.section].typedCards
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
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            if let section = indexPaths.first?.section{
                if section >= self.setNumber{
                    let apiService = MTG_ProviderDefault().cardsUseCase()
                    apiService.fetchCards(from: self.metaSets[self.setNumber]) { (result) in
                        switch result{
                        case .success(let cards):
                            let finalSet = CardSet(self.metaSets[self.setNumber], cards)
                            self.smartAppend(model: CardSetList.ViewModel(cardSet: finalSet))
                            self.setNumber += 1
                        case .failure(let error):
                            print(error)
                        }
                    }
                }
            }
            
           
        }
    }
    
}
