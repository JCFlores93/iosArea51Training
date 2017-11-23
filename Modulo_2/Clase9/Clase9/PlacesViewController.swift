//
//  PlacesViewController.swift
//  Clase9
//
//  Created by Alumno on 11/22/17.
//  Copyright © 2017 Area51 Training Center. All rights reserved.
//

import UIKit
import GoogleMaps

class PlacesViewController: UIViewController, GMSMapViewDelegate {
    
    var places: [Place]?

    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        places = Place.defaultData()
        setupMap()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detail = segue.destination as! DetailViewController
        detail.objetoPasado = sender as? Place
    }
    
    func setupMap() {
        
        let mapView = GMSMapView(frame: view.frame)
        mapView.delegate = self
        mapView.camera = GMSCameraPosition.camera(withLatitude: -12.093083, longitude: -77.032704, zoom: 14)
        
        let place = places![0]
        print(place.location.debugDescription)
        
        let marker = GMSMarker(position: CLLocationCoordinate2DMake(place.location!.latitude, place.location!.longitude))
        marker.title = place.name
        marker.userData = place
        marker.map = mapView
        view.addSubview(mapView)
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        
        print("selected")
        
        if let place = marker.userData as? Place {
            performSegue(withIdentifier: "detailSegue", sender: place)
        }

    }

}
