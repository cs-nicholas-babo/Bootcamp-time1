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
    
    var sets:[CardSet]
    
    override init() {
        self.sets = []
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sets.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sets.map({ (arg0) -> String in
            let (set, _) = arg0
            return set.name
        })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardSetList.tableViewCellIdentifier) as! CardSetListTableViewCell
        return cell
    }
    
    
}
