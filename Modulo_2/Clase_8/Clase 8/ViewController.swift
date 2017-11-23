//
//  ViewController.swift
//  Clase 8
//
//  Created by Admin on 20/11/17.
//  Copyright © 2017 Area51. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager!
    
    
    /*override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }*/

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupMap()
        setupCoreLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: SETUP methods
    func setupCoreLocation() {
        locationManager = CLLocationManager()
        //Conectamos al location CLLocationManagerDelegate como un listener
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }
    
    func setupMap() {
        let mapView = GMSMapView(frame: view.frame)
        mapView.camera  = GMSCameraPosition.camera(withLatitude: -12.1014133, longitude: -77.0267348, zoom: 15)
        let position = CLLocationCoordinate2DMake(-12.1014133, -77.0267348)
        let marker = GMSMarker(position: position)
        marker.map = mapView
        view.addSubview(mapView)
    }
    //MARK: CLLocationManagerDelegate methods
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        locationManager.stopUpdatingLocation()
        
        for location in locations {
            
            print(location.debugDescription)
            let lat = location.coordinate.latitude
            let longt = location.coordinate.longitude
            let coordinate = "\(lat) -- \(longt)"
            //service.enviarApi()
            //debug -> location -> customLocation
        }
    }
    
    @IBAction func mostrarAlert() {
        locationManager.startUpdatingLocation()
    }


}

