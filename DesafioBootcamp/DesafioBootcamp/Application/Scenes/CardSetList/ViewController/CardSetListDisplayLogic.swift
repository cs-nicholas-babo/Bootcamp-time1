//
//  CardSertListDisplay.swift
//  DesafioBootcamp
//
//  Created by miguel.horta.nery on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation

protocol CardSetListDisplayLogic: class {
    func display(viewModel: CardSetList.ViewModel)
    func readyToDisplayCards()
    func displayError()
}
