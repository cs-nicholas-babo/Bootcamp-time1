//
//  MTGCardPicker.swift
//  DesafioBootcamp
//
//  Created by g.guimaraes on 23/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import UIKit
import Domain

protocol MTGCardPickerObserver : class {
    func didChangeTo(row: Int)
}

final class MTGCardPicker: UIPickerView {
    var cards: [Card] = []
    
    var rotationAngle: CGFloat = -90 * (.pi / 180)
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        delegationAssignment()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupView()
    }
    
    func delegationAssignment() {
        delegate = self
        dataSource = self
    }
}

extension MTGCardPicker: UIPickerViewDelegate {
    
}

extension MTGCardPicker: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cards.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = MTGCardViewPicker()
        view.backgroundColor = .white
        
        ImageDownloader.setMagicCard(with: cards[row].literalImageURL(), imageView: &view.imageView)
        
        return view
    }
    
}

extension MTGCardPicker: ViewCode {
    func setupViewHierarchy() { }
    
    func setupConstraints() { }
    
    func setupAdditionalConfiguration() {
        
        transform = CGAffineTransform(rotationAngle: rotationAngle)
        
    }
    
}
