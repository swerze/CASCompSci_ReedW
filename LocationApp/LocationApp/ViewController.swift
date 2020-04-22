//
//  ViewController.swift
//  LocationApp
//
//  Created by Reed Wilson on 4/21/20.
//  Copyright © 2020 Reed Wilson. All rights reserved.
//
import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var label: UILabel!
    
    var latitude = 34.0240892
    var longitude = -118.4747321
    
    var locale:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locale = "None"
        map.delegate = self
        let xrds = MKMapPoint(CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        let mapSize = MKMapSize(width: 15000000, height: 15000000)
        let rectangle = MKMapRect(origin: xrds, size: mapSize)
        map.setRegion(MKCoordinateRegion(rectangle), animated: true)
    }
    
    @IBAction func zoomIn(_ sender: Any) {
        zoom(1)
    }
    
    @IBAction func soomOut(_ sender: Any) {
        zoom(-1)
    }
    
    func zoom(_ exp: Double) {
        let region = map.region
        let newLatitude = region.span.latitudeDelta * pow(2, exp)
        let newLongitude = region.span.longitudeDelta * pow(2, exp)
        let newCoordinateSpan = MKCoordinateSpan(latitudeDelta: newLatitude, longitudeDelta: newLongitude)
        let newRegion = MKCoordinateRegion(center: region.center, span: newCoordinateSpan)
        map.setRegion(newRegion, animated: true)
    }

    @IBAction func localeOne(_ sender: Any) {
        locale = "Stonehenge"
        latitude = 51.1789
        longitude = 1.8262
        map.delegate = self
        let xrds = MKMapPoint(CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        let mapSize = MKMapSize(width: 2000, height: 2000)
        let rectangle = MKMapRect(origin: xrds, size: mapSize)
        map.setRegion(MKCoordinateRegion(rectangle), animated: true)
    }
    
    @IBAction func localeTwo(_ sender: Any) {
        locale = "Baalbek"
        latitude = 32.0047
        longitude = 36.2110
        map.delegate = self
        let xrds = MKMapPoint(CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        let mapsize = MKMapSize(width: 2000, height: 2000)
        let rectangle = MKMapRect(origin: xrds, size: mapsize)
        map.setRegion(MKCoordinateRegion(rectangle), animated: true)
    }
    
    @IBAction func localeThree(_ sender: Any) {
        locale = "Giza"
        latitude =  30.0131
        longitude = 31.2089
        map.delegate = self
        let xrds = MKMapPoint(CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        let size = MKMapSize(width: 2000, height: 2000)
        let rectangle = MKMapRect(origin: xrds, size: size)
        map.setRegion(MKCoordinateRegion(rectangle), animated: true)
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let rectangle = map.visibleMapRect
        let current = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let here = MKMapPoint(current)
        if rectangle.contains(here) {
            label.text = "Aliens were at \(locale) for sure"
        } else {
            label.text = "Nowhere"
        }
    }
    
}

