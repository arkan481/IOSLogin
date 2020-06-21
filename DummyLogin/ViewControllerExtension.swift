//
//  ViewControllerExtension.swift
//  DummyLogin
//
//  Created by Arkan Haryo on 6/21/20.
//  Copyright © 2020 Arkan Haryo. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    
    #warning("This is an extension file to the ViewController class so its not really clumped")
    override var preferredStatusBarStyle: UIStatusBarStyle {
        // Overriding the status bar stylization
        return .lightContent
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        // Method to handle the phone rotation
        return .portrait
    }
    
    func showToast(message : String, font: UIFont) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    } 
    
}
