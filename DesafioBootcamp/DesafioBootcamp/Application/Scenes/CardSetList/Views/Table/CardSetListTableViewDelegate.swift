//
//  CardSetListTableViewDelegate.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 22/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import UIKit

final class CardSetListTableViewDelegate: NSObject, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000
    }
    
}
