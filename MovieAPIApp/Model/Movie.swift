//
//  Movie.swift
//  MovieAPIApp
//
//  Created by Harold Davis on 11/15/17.
//  Copyright © 2017 Zendoart. All rights reserved.
//

import Foundation
import RealmSwift


/**
 A Movie Object stores a movie from a json array response.
 */
class Movie: Object  {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String?
    @objc dynamic var date: String?
    @objc dynamic var address: String?
    
    var comparableName: String {
        return name ?? ""
    }
    
    /**
     Indices helps keep track of what index points are associated with specific data.
     */
    struct Indices {
        static var id: Int = 0
        static var name: Int = 8
        static var date: Int = 9
        static var address: Int = 10
    }
    
    convenience init(with response: [Any]) {
        self.init()
        self.id = response[Indices.id] as? Int ?? 0
        self.name = response[Indices.name] as? String ?? ""
        self.date = response[Indices.date] as? String ?? ""
        self.address = response[Indices.address] as? String ?? ""
    }
}
