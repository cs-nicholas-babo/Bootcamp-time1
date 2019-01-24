//
//  FavoritesCardSetListViewController.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 24/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation


class FavoritesCardSetListViewController: CardSetListViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        guard let interactor = self.interactor else { fatalError() }
        interactor.fetchSet()
    }
    
}
