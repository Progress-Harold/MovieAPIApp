//
//  MovieModelController.swift
//  MovieAPIApp
//
//  Created by Harold Davis on 11/15/17.
//  Copyright © 2017 Zendoart. All rights reserved.
//

import Foundation


class MovieModelController {
    static var sharedInstence = MovieModelController()
    
    var databaseInterface = DatabaseInterface.sharedInstance
    
    
    func getSavedMovies() -> [Movie] {
        return Array(databaseInterface.realm.objects(Movie.self))
    }
}
