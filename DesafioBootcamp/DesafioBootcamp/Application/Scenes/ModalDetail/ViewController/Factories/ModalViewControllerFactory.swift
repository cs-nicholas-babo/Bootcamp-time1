//
//  ModalViewControllerFactory.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 24/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain
import PlatformLocalDatabase

final class ModalViewControllerFactory{
    
    static func make(subset: ModalDetail.ViewModel.Subset) -> ModalDetailViewController{
        let modalVC = ModalDetailViewController()
        let presenter = ModalDetailPresenter(viewController: modalVC)
        let router = ModalDetailRouter(viewController: modalVC)
        let interactor = ModalDetailInteractor(presenter: presenter, useCase: FavoriteCardsServiceProvider().useCase(), subset: subset)
        modalVC.interactor = interactor
        modalVC.router = router
        return modalVC
    }
    
}
