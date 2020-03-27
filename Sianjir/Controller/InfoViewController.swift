//
//  InfoViewController.swift
//  Sianjir
//
//  Created by Maulana on 11/03/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit
import MapKit
import BonsaiController

class InfoViewController: UIViewController {
    
    private let locationManager = CLLocationManager()
    private var currentCoordinate: CLLocationCoordinate2D?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        configureLocationServices()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func configureLocationServices() {
        locationManager.delegate = self
        
        let status = CLLocationManager.authorizationStatus()
        
        if status == .notDetermined{            locationManager.requestAlwaysAuthorization()
        } else if status == .authorizedAlways || status == .authorizedWhenInUse{
            beginLocationUpdates(locationManager: locationManager)
        }
    }
    
    private func beginLocationUpdates(locationManager: CLLocationManager) {
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    private func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D) {
        let zoomRegion = MKCoordinateRegion.init(center: coordinate, latitudinalMeters: 1200, longitudinalMeters: 1200)
        mapView.setRegion((zoomRegion), animated: true)
    }
    
    private func addFloodAnnotations() {
        let lightFloodSymbol = MKPointAnnotation()
        lightFloodSymbol.title = K.banjirRingan
        lightFloodSymbol.coordinate = CLLocationCoordinate2D(latitude: -6.176247, longitude: 106.84004)
        
        let mediumFloodSymbol = MKPointAnnotation()
        mediumFloodSymbol.title = K.banjirSedang
        mediumFloodSymbol.coordinate = CLLocationCoordinate2D(latitude: -6.176461, longitude: 106.839080)
        
        let heavyFloodSymbol = MKPointAnnotation()
        heavyFloodSymbol.title = K.banjirParah
        heavyFloodSymbol.coordinate = CLLocationCoordinate2D(latitude: -6.173190, longitude: 106.839551)
        
        mapView.addAnnotation(lightFloodSymbol)
        mapView.addAnnotation(mediumFloodSymbol)
        mapView.addAnnotation(heavyFloodSymbol)
    }
    
    private func resizeAnnotationImage(imageName: String, imageWidth: Double, imageHeight:Double) -> UIImage{
        let image = UIImage(named: imageName)
        let resizedSize = CGSize(width: imageWidth, height: imageHeight)
        
        UIGraphicsBeginImageContext(resizedSize)
        image?.draw(in: CGRect(origin: .zero, size: resizedSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage!
    }
    
    @IBAction func switchViews(sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 1:
            mapView.mapType = .hybrid
        default:
            mapView.mapType = .standard
        }
    }
    
    @IBAction func showUserLocation(_ sender: Any) {
        let userLocation = locationManager.location
        guard let userCoordinate = userLocation?.coordinate else { return }
        
        zoomToLatestLocation(with: userCoordinate)
    }
}

extension InfoViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Did get latest location")
        
        guard let latestLocation = locations.first else { return }
        
        if currentCoordinate == nil {
            zoomToLatestLocation(with: latestLocation.coordinate)
            addFloodAnnotations()
        }
        
        currentCoordinate = latestLocation.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("The status changed")
        
        if status == .authorizedAlways || status == .authorizedWhenInUse{
            beginLocationUpdates(locationManager: manager)
        }
    }
}

extension InfoViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: K.identifier.annotationView)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: K.identifier.annotationView)
        }
        
        if let title = annotation.title, title == K.banjirRingan {
            annotationView?.image = resizeAnnotationImage(imageName: K.banjirRingan, imageWidth: 30, imageHeight: 30)
        } else if let title = annotation.title, title == K.banjirSedang {
            annotationView?.image = resizeAnnotationImage(imageName: K.banjirSedang, imageWidth: 30, imageHeight: 30)
        } else if let title = annotation.title, title == K.banjirParah {
            annotationView?.image = resizeAnnotationImage(imageName: K.banjirParah, imageWidth: 30, imageHeight: 30)
        } else if annotation === mapView.userLocation {
            annotationView?.image = UIImage(systemName: K.image.circleFill)
        }
        
        annotationView?.canShowCallout = true
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("The annotation was selected : \(String(describing: view.annotation?.subtitle))")
    }
}

extension InfoViewController: BonsaiControllerDelegate {
    
    // return the frame of your Bonsai View Controller
    func frameOfPresentedView(in containerViewFrame: CGRect) -> CGRect {
        
        return CGRect(origin: CGPoint(x: 0, y: containerViewFrame.height / 2), size: CGSize(width: containerViewFrame.width, height: containerViewFrame.height / 2))
    }
    
    // return a Bonsai Controller with SlideIn or Bubble transition animator
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        // Slide animation from .left, .right, .top, .bottom
        return BonsaiController(fromDirection: .bottom, blurEffectStyle: .light, presentedViewController: presented, delegate: self)
        
        // or Bubble animation initiated from a view
        //return BonsaiController(fromView: yourOriginView, blurEffectStyle: .dark,  presentedViewController: presented, delegate: self)
    }
}
