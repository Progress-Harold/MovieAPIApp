//
//  WelcomeViewController.swift
//  MovieAPIApp
//
//  Created by Harold Davis on 11/15/17.
//  Copyright © 2017 Zendoart. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    var appState = AppStateController.sharedInstance
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    func setUpWelcomePage() {
//        welcomeLbl.alpha = 0.0
//        enterBtn.alpha = 0.0
    }
    
    
    func welcomeAnim() {
        UIView.animate(withDuration: 1.0, delay: 1.0, options: [], animations: {
//            self.welcomeLbl.alpha = 1.0
//            self.enterBtn.alpha = 1.0
            
        }, completion: nil)
    }
}
