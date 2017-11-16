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
    
    struct Indecies {
        static var id: Int = 0
        static var name: Int = 8
        static var date: Int = 9
        static var address: Int = 10
    }
    
    convenience init(with response: [Any]) {
        self.init()
        self.id = response[Indecies.id] as? Int ?? 0
        self.name = response[Indecies.name] as? String ?? ""
        self.date = response[Indecies.date] as? String ?? ""
        self.address = response[Indecies.address] as? String ?? ""
    }
}
