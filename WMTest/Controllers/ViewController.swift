//
//  ViewController.swift
//  WMTest
//
//  Created by Jose Galindo martinez on 30/07/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit
import ProgressHUD

class ViewController: UIViewController {
    
    // UI
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var configBtn: UIBarButtonItem!
    
    
    // Logic
    var storesViewModel = StoreAddressViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Stores"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // TableView Config
        let nib = UINib.init(nibName: "TVCStoreCell", bundle: nil)
        self.mTableView.register(nib, forCellReuseIdentifier: TVCStoreCell.CELL_IDENTIFIER)
        self.mTableView.rowHeight = UITableView.automaticDimension
        self.mTableView.estimatedRowHeight = 70
    
        self.bindValues()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.largeTitleDisplayMode = .automatic
    }
    
    private func bindValues() {
        storesViewModel.isLoading.subscribe { res in
            if res.element! {
                ProgressHUD.show("Loading")
                ProgressHUD.animationType = .systemActivityIndicator
            } else {
                ProgressHUD.dismiss()
            }
        }.disposed(by: storesViewModel.disposeBag)
        
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
//            self.performSegue(withIdentifier: "showConfig", sender: self.storesViewModel)
            self.showSortingOptions()
        }.disposed(by: storesViewModel.disposeBag)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as! DetailViewController
            vc.storeInfo = sender as? StoreAddress
        }
        if segue.identifier == "showConfig" {
//            let vc = segue.destination as! ConfigViewController
        }
    }
    
    private func showSortingOptions() {
        let menu = UIAlertController(title: "Sorting", message: "How would you like to sort data?", preferredStyle: .actionSheet)
        menu.addAction(UIAlertAction(title: "Ascending", style: .default, handler: { (aa) in
            self.storesViewModel.sortData(ascending: true)
        }))
        menu.addAction(UIAlertAction(title: "Descending", style: .default, handler: { (aa) in
            self.storesViewModel.sortData(ascending: false)
        }))
        menu.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler:nil))
        self.present(menu, animated: true, completion: nil)
    }

}
