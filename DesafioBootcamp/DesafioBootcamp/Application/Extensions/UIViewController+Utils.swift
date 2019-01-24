//
//  UIViewController+Utils.swift
//  DesafioBootcamp
//
//  Created by g.guimaraes on 24/01/19.
//  Copyright © 2019 concrete.solutions. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func displayContentController(_ content: UIViewController){
        self.addChild(content)
        content.view.alpha = 0
        content.view.frame = self.view.frame
        self.view.addSubview(content.view)
        
        UIView.animate(withDuration: 0.5, animations: {
            content.view.alpha = 1.0
        }) { (finished) in
            content.didMove(toParent: self)
        }
    }
    
    func cycle(_ fromController: UIViewController, toViewController: UIViewController) {
        // Prepare the two view controller to change
        fromController.willMove(toParent: nil)
        self.addChild(toViewController)
        
        // Get the start frame of the new view controller and the end frame
        // for the old view controller. Both rectangles are offscreen.
        toViewController.view.frame = CGRect(x: -fromController.view.frame.size.width, y: fromController.view.frame.origin.y, width: fromController.view.frame.size.width, height: fromController.view.frame.size.height)
        
        let endFrame = CGRect(x: fromController.view.frame.size.width, y: fromController.view.frame.origin.y, width: fromController.view.frame.size.width, height: fromController.view.frame.size.height)
        
        // Queue up the transition animation.
        
        self.transition(from: fromController, to: toViewController, duration: 0.25, options: UIView.AnimationOptions.allowAnimatedContent, animations: {
            toViewController.view.frame = fromController.view.frame
            fromController.view.frame = endFrame
        }) { (finished) in
            fromController.removeFromParent()
            toViewController.didMove(toParent: self)
        }
        
    }
    
    func hideContentController (_ content: UIViewController){
        content.willMove(toParent: nil)
        content.view.removeFromSuperview()
        content.removeFromParent()
    }
    
    func removeFromPresenter(){
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }

}
