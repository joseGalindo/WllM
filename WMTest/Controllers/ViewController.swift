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
    @IBOutlet weak var configBtn: UIBarButtonItem!
    
    // Logic
    var storesViewModel = StoreAddressViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView Config
        let nib = UINib.init(nibName: "TVCStoreCell", bundle: nil)
        self.mTableView.register(nib, forCellReuseIdentifier: TVCStoreCell.CELL_IDENTIFIER)
        
        self.bindValues()
    }
    
    private func bindValues() {
        // Attach Stores
        storesViewModel.stores.bind(to: mTableView.rx.items(cellIdentifier: TVCStoreCell.CELL_IDENTIFIER, cellType: TVCStoreCell.self)) { row, model, cell in
            cell.configureCell(model)
        }.disposed(by: storesViewModel.disposeBag)
        
        mTableView.rx.modelSelected(StoreAddress.self).subscribe(onNext: { [weak self] model in
            self?.performSegue(withIdentifier: "showDetail", sender: model)
        }).disposed(by: storesViewModel.disposeBag)
        
        storesViewModel.getStores()
        
        // Config
        configBtn.rx.tap.bind { [unowned self] in
            self.performSegue(withIdentifier: "showConfig", sender: self.storesViewModel)
        }.disposed(by: storesViewModel.disposeBag)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as! DetailViewController
            vc.storeInfo = sender as? StoreAddress
        }
        if segue.identifier == "showConfig" {
            let vc = segue.destination as! ConfigViewController
        }
    }

}
