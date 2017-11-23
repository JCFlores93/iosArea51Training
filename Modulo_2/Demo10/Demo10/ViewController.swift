//
//  ViewController.swift
//  Demo10
//
//  Created by Admin on 22/11/17.
//  Copyright © 2017 Area51. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    var locationManager: CLLocationManager!
    var places: [Place]?

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        places = Place.defaultData()
        setupMap()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupMap() {
        let mapView = GMSMapView(frame: view.frame)
         mapView.camera  = GMSCameraPosition.camera(withLatitude: -12.093083, longitude: -77.032704, zoom: 14)
        mapView.delegate = self
        //for place in places {
        let place = places![0]
            let position = CLLocationCoordinate2DMake((place.location?.latitude)!, (place.location?.longitude)!)
            let marker = GMSMarker(position: position)
            marker.title = place.name
            marker.userData = place
        
            marker.map = mapView
        //}
        view.addSubview(mapView)
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("selected")
        if let place = marker.userData as? Place{
            performSegue(withIdentifier: "detailGps", sender: Place?.self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detail = segue.destination as! GpsDetailViewController
        detail.objetoPasado = sender as? Place
    }


}

