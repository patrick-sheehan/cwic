//
//  PositionViewController.swift
//  CWIC
//
//  Created by Patrick Sheehan on 12/6/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit
import MapKit


class PositionViewController: UIViewController {
  
  @IBOutlet var mapView: MKMapView!
  
  var position: Position?
  var positionTitle = "Event Location"
  var positionSubtitle = "Details"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 1)
    mapView.mapType = MKMapType.hybrid
    mapView.showsCompass = true
    mapView.showsScale = true
    
    if let position = position {
      
      let location = CLLocationCoordinate2D(latitude: position.lat, longitude: position.lon)
      
      let span = MKCoordinateSpanMake(0.05, 0.05)
      let region = MKCoordinateRegion(center: location, span: span)
      mapView.setRegion(region, animated: true)
      
      let annotation = MKPointAnnotation()
      annotation.coordinate = location
      annotation.title = positionTitle
      annotation.subtitle = positionSubtitle
      mapView.addAnnotation(annotation)
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
