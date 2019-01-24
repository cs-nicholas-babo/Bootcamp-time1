//
//  MTGSearchBar.swift
//  DesafioBootcamp
//
//  Created by g.guimaraes on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import Domain
import UIKit

protocol MTGSearchBarDisplayLogic : class {
    func display(sets: [CardSet])
}

protocol MTGSearchBarObserver : class {
    func send(sets: [CardSet])
}

final class MTGSearchBar: UISearchBar {
    var interactor: MTGSearchBarBusinessLogic?
    weak var observer: MTGSearchBarObserver?
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        delegationAssignment()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    lazy var textField: UITextField? = {
        return value(forKey: "_searchField") as? UITextField
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    func delegationAssignment() {
        delegate = self
    }
    
}

extension MTGSearchBar: ViewCode {
    func setupViewHierarchy() { }
    
    func setupConstraints() { }
    
    func setupAdditionalConfiguration() {
        self.searchBarStyle = .minimal
        self.placeholder = "search for cards"
        
        self.textField?.font = UIFont.boldSystemFont(ofSize: 14)
        self.textField?.textColor = .white
        self.textField?.layer.borderWidth = 1
        self.textField?.layer.borderColor = UIColor.white.cgColor
        self.textField?.layer.cornerRadius = 2
        
        self.setShowsCancelButton(true, animated: true)
    }

}

extension MTGSearchBar: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        resignFirstResponder()
        if let text = searchBar.text {
            interactor?.search(query: text)
        }
    }
}

extension MTGSearchBar: MTGSearchBarDisplayLogic {
    func display(sets: [CardSet]) {
        observer?.send(sets: sets)
    }
}
