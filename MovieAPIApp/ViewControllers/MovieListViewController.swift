//
//  MovieListViewController.swift
//  MovieAPIApp
//
//  Created by Harold Davis on 11/15/17.
//  Copyright © 2017 Zendoart. All rights reserved.
//

import Foundation
import UIKit

class MovieListViewController: UIViewController {
    var appState = AppStateController.sharedInstance

    var moviesArr: [Movie] = []
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func getMovies() {
        //Get movies from Database and set movies array value.
        
        appState.services.getMovies { movies, error in
            
            
        }
    }
}
