//
//  MTGTabBarController.swift
//  DesafioBootcamp
//
//  Created by ricardo.s.rachaus on 24/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import UIKit

final class MTGTabBarController: UITabBarController {
    
    lazy var topBorderLine: UIView = {
        let frame = CGRect(x: tabBar.bounds.width * 0.1, y: 0,
                           width: UIScreen.main.bounds.width * 0.80, height: 1)
        let view = UIView(frame: frame)
        return view
    }()
    
    lazy var centerBorderLine: UIView = {
        let frame = CGRect(x: UIScreen.main.bounds.width / 2, y: tabBar.bounds.height * 0.15,
                           width: 1, height: tabBar.bounds.height * 0.65)
        let view = UIView(frame: frame)
        return view
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

extension MTGTabBarController: ViewCode {
    func setupViewHierarchy() {
        tabBar.addSubview(topBorderLine)
        tabBar.addSubview(centerBorderLine)
    }
    
    func setupConstraints() {}
    
    func setupAdditionalConfiguration() {
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -18)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)], for: .normal)
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().backgroundColor = UIColor.black.withAlphaComponent(0.3)
        UITabBar.appearance().backgroundImage = UIImage()
        topBorderLine.backgroundColor = .white
        centerBorderLine.backgroundColor = .white
        view.backgroundColor = .clear
    }
    
    
}
