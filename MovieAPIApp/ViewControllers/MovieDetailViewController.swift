//
//  MovieDetailViewController.swift
//  MovieAPIApp
//
//  Created by Harold Davis on 11/15/17.
//  Copyright © 2017 Zendoart. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit
import UIKit


class MovieDetailViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var movieNameLbl: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var address: UILabel!
    
    var movieMC = MovieModelController.sharedInstence
    
    var selectedMovie: Movie!
    
    var moviesArr: [Movie] = []
    
    var isUserSharingLocation: Bool?
    var locationManager: CLLocationManager?
    var currentCoordinates: CLLocationCoordinate2D?
    
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        mapView.showsUserLocation = true
        mapView.delegate = self
        
        self.locationManager = CLLocationManager()
        self.locationManager?.requestAlwaysAuthorization()
        
        addMapAnnotation(with: selectedMovie.address!)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       configureDetailView()
    }
    
    
    func configureDetailView() {
        moviesArr = movieMC.getMoviesBy(name: selectedMovie.name!)
        movieNameLbl.text = selectedMovie.name
        date.text = selectedMovie.date
        address.text = selectedMovie.address
        addMapAnnotation(with: selectedMovie.address!)
    }
}

extension MovieDetailViewController: MKMapViewDelegate {
    func addMapAnnotation(with address: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) {
            placemarks, error in
            guard let placemark = placemarks?.first else { return }
            self.currentCoordinates = placemark.location?.coordinate
            let region = MKCoordinateRegionMakeWithDistance((self.currentCoordinates)!, 2000, 2000)
            self.mapView.setRegion(region, animated: true)
            self.mapView.addAnnotation(MKPlacemark(placemark: placemark))
        }
    }
}

extension MovieDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = moviesArr[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        cell.textLabel?.text = movie.address
        cell.detailTextLabel?.text = movie.date
        
        return cell
    }
}

extension MovieDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = moviesArr[indexPath.row]

        addMapAnnotation(with: movie.address!)
    }
}


