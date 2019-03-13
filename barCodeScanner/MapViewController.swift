//
//  MapViewController.swift
//  barCodeScanner
//
//  Created by Chandrakant Vankayalapati on 11/03/19.
//  Copyright © 2019 Chandrakant Vankayalapati. All rights reserved.
//

import UIKit
import GoogleMaps
var locationManager = CLLocationManager()

class MapViewController: UIViewController,CLLocationManagerDelegate {

    
    
    var shopTableViewController: ShopTableViewController?
    @IBOutlet weak var mapDisplay: GMSMapView!
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var zoomLevel: Float = 15.0
    var mapViewDis = GMSMapView()
    
    let defaultLocation = CLLocation(latitude: -33.869405, longitude: 151.199)
    
    var stores:[shopModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        showMapCurrent()
        // Do any additional setup after loading the view.
    }
    
    func showMapCurrent(){
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 13.0)
        mapViewDis = GMSMapView.map(withFrame: self.mapDisplay.frame, camera: camera)
        mapViewDis.isMyLocationEnabled = true
        self.view.addSubview(mapViewDis)
        
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last
        let center = CLLocationCoordinate2D(latitude: userLocation!.coordinate.latitude, longitude: userLocation!.coordinate.longitude)
        
        let camera = GMSCameraPosition.camera(withLatitude: userLocation!.coordinate.latitude,
                                              longitude: userLocation!.coordinate.longitude, zoom: 15.0)
        self.mapViewDis = GMSMapView.map(withFrame: self.mapDisplay.frame , camera: camera)
        
        self.mapViewDis.isMyLocationEnabled = true
        self.view.addSubview(mapViewDis)
        addLocations()
        
        locationManager.stopUpdatingLocation()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addLocations(){
        var locationCo = [CLLocationCoordinate2D(latitude: 12.932128, longitude: 77.685359),CLLocationCoordinate2D(latitude: 12.948498, longitude:  77.702676),
                          CLLocationCoordinate2D(latitude: 12.938004,
                             longitude: 77.706345),
                          CLLocationCoordinate2D(latitude: 12.925807, longitude:77.692625)
                          ]
        var i = 0
        let shopNames: [String] = ["Winterfell" , "Kings Landing" , "Harrenhal", "Dragonstone"]
        let offers:[String] = ["10% on Sprite","5% on Pulpy Orange","nil","10% on Sprite."]
        DispatchQueue.main.async {
            for loc in locationCo{
                let marker = GMSMarker()
                marker.position = loc
                marker.title = "Shop "+shopNames[i]
                marker.snippet = "Offers: " + offers[i]
                marker.icon = UIImage(named: "shopIcon")
                marker.map = self.mapViewDis
                i=i+1
            }
        }
        
    }
    

    override internal func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
            
        case let viewController as ShopTableViewController:
            self.shopTableViewController = viewController
            
        default:
            break
        }
    }

    
}
