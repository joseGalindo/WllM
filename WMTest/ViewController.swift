//
//  ViewController.swift
//  WMTest
//
//  Created by Jose Galindo martinez on 30/07/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // UI
    @IBOutlet weak var mTableView: UITableView!
    
    // Logic

    override func viewDidLoad() {
        super.viewDidLoad()
       
        /* ApiService.shared.methodGET(endpoint: .storeLocator, onSuccess: { (respuesta : StoreAddressResponse?) in
            print(respuesta!)
        }) { (mError) in
            
        }*/
        
    }


}


extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
