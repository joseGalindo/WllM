//
//  ConfigViewController.swift
//  WMTest
//
//  Created by Jose Galindo martinez on 31/07/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit
import CoreLocation

class ConfigViewController: UITableViewController {

    // Logic
    let locManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locManager.requestWhenInUseAuthorization()
        }*/
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.largeTitleDisplayMode = .never
    }

   
}
