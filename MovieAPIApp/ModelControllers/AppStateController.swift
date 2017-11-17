//
//  AppStateController.swift
//  MovieAPIApp
//
//  Created by Harold Davis on 11/15/17.
//  Copyright © 2017 Zendoart. All rights reserved.
//

import Foundation
import UIKit

/**
 AppStateController will give quick access to the database & api service calls (only one currently)
 */
class AppStateController {
    static var sharedInstance = AppStateController()
    
    var services = APIServices.sharedInstance
    var databaseInterface = DatabaseInterface.sharedInstance
    
    var hasSeenWelcomePage: Bool {
        get {
            if let userDefualts = UserDefaults(suiteName: "Zendoart.MovieAPIApp") {
                return userDefualts.bool(forKey: "hasSeenWelcomePage")
            }
            else {
                return false
            }
        }
        set {
            if let userDefualts = UserDefaults(suiteName: "Zendoart.MovieAPIApp") {
                return userDefualts.set(newValue, forKey: "hasSeenWelcomePage")
            }
        }
    }
    
    
    func presentWelcomeScreen() -> UIViewController {
        let storyboard = UIStoryboard(name: "Welcome", bundle: nil)
        let welcomeVC = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController")
        
        return welcomeVC
    }
    
}
