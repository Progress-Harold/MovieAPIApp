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
    @IBOutlet var tableView: UITableView!
    
    var appState = AppStateController.sharedInstance
    var movieMC = MovieModelController.sharedInstence

    var moviesArr: [Movie] = []
    
    
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        getMovies()
    }
    
    
    func getMovies() {
        moviesArr = movieMC.getSavedMovies()
        
        appState.services.getMovies { movieFromServer, error in
            if let movieFromServer = movieFromServer {
                // Check if database is not empty...
                if !self.moviesArr.isEmpty {
                    let movieIDs = self.moviesArr.map { $0.id }
                    for movie in movieFromServer {
                        if !movieIDs.contains(movie.id) {
                            self.moviesArr.append(movie)
                        }
                    }
                }
                // If database is empty populate array with what is on the server and save all objects.
                else {
                    self.moviesArr = movieFromServer
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.tableView.reloadData()
            }
        }
        self.appState.databaseInterface.save(self.moviesArr)
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = moviesArr[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        
        cell.configureCell(movie)
        
        return cell
    }
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
