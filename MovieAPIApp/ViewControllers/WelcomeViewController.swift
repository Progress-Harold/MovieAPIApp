//
//  WelcomeViewController.swift
//  MovieAPIApp
//
//  Created by Harold Davis on 11/15/17.
//  Copyright © 2017 Zendoart. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var startLbl: UIButton!
    @IBOutlet weak var skycatchMovieLogoImage: UIImageView!
    
    
    var appState = AppStateController.sharedInstance
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpWelcomePage()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        welcomeAnim()
    }
    
    
    func setUpWelcomePage() {
        welcomeLbl.alpha = 0.0
        startLbl.alpha = 0.0
        skycatchMovieLogoImage.alpha = 0.0
    }
    
    
    func welcomeAnim() {
        UIView.animate(withDuration: 1.0, delay: 1.0, options: [], animations: {
            self.welcomeLbl.alpha = 1.0
            self.startLbl.alpha = 1.0
            self.skycatchMovieLogoImage.alpha = 1.0
            
        }, completion: nil)
    }
    
    
    @IBAction func startSearchBtn(_ sender: Any) {
        self.appState.hasSeenWelcomePage = true
        self.dismiss(animated: true)
        
    }
}
