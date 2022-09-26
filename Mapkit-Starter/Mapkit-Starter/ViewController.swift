//
//  ViewController.swift
//  Mapkit-Starter
//
//  Created by 정유진 on 2022/09/26.
//
import CoreLocation // 위치
import MapKit
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        requestLocationAuthorization()
        fetchLocationsOnMap(locations: Stadium.stadiums)
     
    }

    @IBAction func didTapButton(_ sender: UIButton) {
        
        centerLocation(location: Stadium.stadiums.last!)
    }
    
    
}
extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
            annotationView?.clusteringIdentifier = "stadium"
            annotationView?.displayPriority = .required

        }else {
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named: "kirby3")
        annotationView?.frame.size = CGSize(width: 40, height: 40)
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(view.annotation?.title)
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        centerUserLocation(locations: locations)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        requestLocationAuthorization()
    }
}

extension ViewController {
    private func requestLocationAuthorization() {
        let status = locationManager.authorizationStatus
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways, .authorizedWhenInUse, .authorized:
            locationManager.requestLocation() // delegate 필요
            mapView.showsUserLocation = true
 //           mapView.userTrackingMode = .follow //이동하는것을 볼수있음
        @unknown default:
            break
            
        }
        
    }
    private func centerUserLocation(locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else {return}
        
        let center = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: center, span: span) // 줌인에서 어느정도 수치에 따라 할것인지!
        mapView.setRegion(region, animated: true)
    }
    private func fetchLocationsOnMap(locations: [LcoationRepresentable]) {
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = location.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude) //위치
            mapView.addAnnotation(annotation)
        }
    }
    private func centerLocation(location: LcoationRepresentable) {
        let center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
}

