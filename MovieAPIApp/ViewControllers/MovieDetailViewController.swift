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
    
    var movieName: String!
    
    var moviesArr: [Movie] = []
    
    var isUserSharingLocation: Bool?
    var locationManager: CLLocationManager?
    var currentCoordinates: CLLocationCoordinate2D?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        mapView.delegate = self
        
        self.locationManager = CLLocationManager()
        self.locationManager?.requestAlwaysAuthorization()
        
        currentCoordinates = CLLocationCoordinate2D(latitude: 37.42274, longitude: -122.139956)
        
        let region = MKCoordinateRegionMakeWithDistance((self.currentCoordinates)!, 2000, 2000)
        
        self.mapView.setRegion(region, animated: true)
    }
    
    
    func setUpLocations() {
        moviesArr = movieMC.getMoviesBy(name: movieName)
        
        let firstMovie = moviesArr.first
        if let address = firstMovie?.address {
            addMapAnnotation(with: address)
        }
        
        
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


