//
//  MapSnapShotGenerator.swift
//  WeatherApp
//
//  Created by Prashant on 03/08/24.
//

import MapKit

class MapSnapShotGenerator {
    let lat: Double
    let long: Double
    
    let options: MKMapSnapshotter.Options = .init()
    
    init(lat: Double, long: Double) {
        self.lat = lat
        self.long = long
    }
    
    func getSnapShot(width: Double, height: Double, completion:@escaping (UIImage?) -> ()) {
        let location =  CLLocationCoordinate2D(latitude: lat, longitude: long)
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        let region = MKCoordinateRegion(center: location, span: span)
        options.region = region
        options.size = CGSize(width: width, height: height)
        options.mapType = .standard
        options.showsBuildings = true
        let snapshotter = MKMapSnapshotter(
            options: options
        )
        snapshotter.start { snapshot, error in
            
            guard let snapshot = snapshot else {
                completion(nil)
                return
            }
            let image = UIGraphicsImageRenderer(size: self.options.size).image { _ in
                snapshot.image.draw(at: .zero)
                
                let pinView = MKPinAnnotationView(annotation: nil, reuseIdentifier: nil)
                let pinImage = pinView.image
                
                var point = snapshot.point(for: location)
                
                // if rect.contains(point) {
                point.x -= pinView.bounds.width / 2
                point.y -= pinView.bounds.height / 2
                point.x += pinView.centerOffset.x
                point.y += pinView.centerOffset.y
                pinImage?.draw(at: point)
                //  }
                
            }
            completion(image)
        }
    }
}
