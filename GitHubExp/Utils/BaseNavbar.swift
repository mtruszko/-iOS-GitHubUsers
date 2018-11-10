//
//  BaseNavbar.swift
//  GitHubExp
//
//  Created by marek on 10/11/2018.
//  Copyright © 2018 mtruszko. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar(animated: false)
    }
    
    var rootViewController: UIViewController? {
        return viewControllers.first
    }
    
    func setNavigationBar(animated: Bool) {
        UIView.animate(withDuration: animated ? 0.2 : 0.0) {
            self.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationBar.shadowImage = UIImage()
            self.view.backgroundColor = UIColor.clear
            self.navigationBar.backgroundColor = UIColor.clear
            self.navigationBar.tintColor = UIColor.black
            self.navigationBar.isTranslucent = true
            self.navigationBar.titleTextAttributes = [
                NSAttributedStringKey.foregroundColor: UIColor.white
            ]
        }
    }
}

