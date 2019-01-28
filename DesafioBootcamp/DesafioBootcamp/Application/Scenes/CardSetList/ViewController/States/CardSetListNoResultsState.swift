//
//  CardSetListNoResultsState.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import GameplayKit

final class CardSetListNoResultsState: CardSetListBaseState{
    
    override func didEnter(from previousState: GKState?) {
        print("No results found ?.?")
        self.viewController.searchBar.isHidden = true
        self.viewController.errorImageView.isHidden = false
        self.viewController.errorImageView.image = Image.noResults
        self.viewController.activityIndicator.isHidden = true
        self.viewController.activityIndicator.stopAnimating()
        self.viewController.wrapperView.isHidden = false
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return true
    }
    
}
