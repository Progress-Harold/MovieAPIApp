//
//  MovieTableViewCell.swift
//  MovieAPIApp
//
//  Created by Harold Davis on 11/15/17.
//  Copyright © 2017 Zendoart. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    /**
     The Configure method  will set up cell lables with a movie.
     
     - parameter movie: movie object at index path.
     */
    func configure(_ movie: Movie) {
            movieTitleLbl.text = movie.name
            dateLbl.text = movie.date
    }
}
