//
//  CustomTabBar.swift
//  DesafioBootcamp
//
//  Created by g.guimaraes on 24/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class CustomTabViewController: UIViewController {
    
    let tabBarHeight = 49
    var index = 0
    var viewControllers: [UIViewController] = []
    
    lazy var mainTabButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Main", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(switchToMain), for: .touchDown)
        return button
    }()
    
    lazy var favoritesTabButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Favorites", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(switchtoFavorites), for: .touchDown)
        return button
    }()
    
    lazy var upperStroke: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        return view
    }()
    
    lazy var middleStroke: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        return view
    }()
    
    lazy var tabBarView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 0.7)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    override func loadView() {
        super.loadView()
        
        displayContentController(viewControllers[index])
        setupView()
    }
    
    @objc func switchToMain(){
        switchToViewController(at: 0)
    }
    
    @objc func switchtoFavorites(){
        switchToViewController(at: 1)
    }
    
    func switchToViewController(at: Int){
        if index != at {
            displayContentController(viewControllers[at])
            hideContentController(viewControllers[index])
            index = at
        }
        setupView()
    }
}

extension CustomTabViewController: ViewCode {
    func setupViewHierarchy() {
        view.addSubview(tabBarView)
        tabBarView.addSubview(mainTabButton)
        tabBarView.addSubview(favoritesTabButton)
        tabBarView.addSubview(upperStroke)
        tabBarView.addSubview(middleStroke)
    }
    
    func setupConstraints() {
        tabBarView.snp.makeConstraints { (make) in
            make.height.equalTo(tabBarHeight)
            make.bottom.left.right.equalToSuperview()
        }
        
        middleStroke.snp.makeConstraints { (make) in
            make.width.equalTo(3)
            make.height.equalTo(tabBarHeight - 4)
            make.bottom.equalToSuperview().inset(2)
            make.centerX.equalToSuperview()
        }
        
        upperStroke.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(3)
        }
        
        mainTabButton.snp.makeConstraints { (make) in
            make.left.bottom.equalToSuperview()
            make.height.equalTo(tabBarHeight)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        favoritesTabButton.snp.makeConstraints { (make) in
            make.right.bottom.equalToSuperview()
            make.height.equalTo(tabBarHeight)
            make.width.equalToSuperview().dividedBy(2)
        }
        
    }
    
    func setupAdditionalConfiguration() {
        
    }
    
}
