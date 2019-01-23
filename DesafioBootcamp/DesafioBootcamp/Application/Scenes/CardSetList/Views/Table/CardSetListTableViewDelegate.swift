//
//  CardSetListTableViewDelegate.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class CardSetListTableViewDelegate: NSObject, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        
        let headerLabel = UILabel(frame: CGRect(x: 30, y: 0, width:
            tableView.bounds.size.width, height: tableView.bounds.size.height))
        headerLabel.font = UIFont(name: "SFProDisplay-Bold", size: 80.0)
        headerLabel.textColor = UIColor.black
        headerLabel.text = tableView.dataSource?.tableView!(tableView, titleForHeaderInSection: section)
        headerLabel.sizeToFit()

        headerView.addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        
        return headerView
    }

    
}
