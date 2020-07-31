//
//  DetailViewController.swift
//  WMTest
//
//  Created by Jose Galindo martinez on 30/07/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {

    // UI
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var extraInfoLbl: UILabel!
    
    @IBOutlet weak var infoMap: MKMapView!
    
    // Logic
    var storeInfo : StoreAddress?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpView()
    }
    
    private func setUpView() {
        self.nameLbl.text = storeInfo!.name!
        self.addressLbl.text = "\(storeInfo!.address!), z.p.:\(storeInfo!.zipCode!)"
        var extInfo = "Manager: \(storeInfo!.manager!)\n"
        if let sched = storeInfo!.opens?.split(separator: "/").first {
            extInfo.append(contentsOf: "\(sched)\n")
        }
        if let phone = storeInfo!.telephone?.split(separator: "/").first {
            extInfo.append(contentsOf: phone)
        }
        self.extraInfoLbl.text = extInfo
        
        // Map Configuration
        let coord = CLLocationCoordinate2D(latitude: Double(storeInfo!.latPoint!) ?? 0, longitude: Double(storeInfo!.lonPoint!) ?? 0)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coord
        annotation.title = storeInfo!.name
        let coordinateRegion = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1500, longitudinalMeters: 1500)
        infoMap.setRegion(coordinateRegion, animated: true)
        infoMap.addAnnotation(annotation)
    }

}
