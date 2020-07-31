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
    }

}
