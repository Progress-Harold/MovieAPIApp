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
    
    func configureCell(_ movie: Movie) {
            movieTitleLbl.text = movie.name
            dateLbl.text = movie.date
    }
}
