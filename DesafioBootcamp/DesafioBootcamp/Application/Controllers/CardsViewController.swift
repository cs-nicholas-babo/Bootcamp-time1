//
//  CardsViewController.swift
//  DesafioBootcamp
//
//  Created by nicholas.r.babo on 16/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import UIKit
import Domain

enum PresentationState{
    case initial
    case loading
    case ready
    case error
    case empty
}

final class CardsViewController: UIViewController {
    
    init(service: MTGService) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var service:MTGService
    var screen:CardsScreen = CardsScreen()
    
    var presentationState:PresentationState = .initial{
        didSet{
            screen.refreshUI(for: presentationState)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        self.view = screen
    }

}

extension CardsViewController{
    
    func fetchSets(){
        self.service.fetchSets()
        self.handleFetch(sets: [])
    }
    
}

extension CardsViewController{
    
    func handleFetch(sets: [MetaCardSet]){
        
    }
    
}
