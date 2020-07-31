//
//  TVCStoreCell.swift
//  WMTest
//
//  Created by Jose Galindo martinez on 30/07/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit

class TVCStoreCell: UITableViewCell {

    static let CELL_IDENTIFIER = String(describing: TVCStoreCell.self)
    
    // UI
    @IBOutlet weak var storeNameLbl: UILabel!
    @IBOutlet weak var zipCodeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(_ store : StoreAddress) {
        self.storeNameLbl.text = "Store Name: " + (store.name ?? "")
        self.zipCodeLbl.text = "Z.P. " + (store.zipCode ?? "-")
    }
    
}
