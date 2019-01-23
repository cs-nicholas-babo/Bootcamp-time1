//
//  ModalDetailRouter.swift
//  DesafioBootcamp
//
//  Created by g.guimaraes on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import UIKit

protocol ModalDetailRoutingLogic {
    func dismiss()
}

final class ModalDetailRouter {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
}

extension ModalDetailRouter : ModalDetailRoutingLogic {
    func dismiss() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
