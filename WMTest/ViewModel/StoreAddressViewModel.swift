//
//  StoreAddressViewModel.swift
//  WMTest
//
//  Created by Jose Galindo martinez on 30/07/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class StoreAddressViewModel {
    
    let disposeBag = DisposeBag()
    var stores : BehaviorRelay<[StoreAddress]> = BehaviorRelay(value: [])
    
    func getStores() {
        ApiService.shared.methodGET(endpoint: .storeLocator, onSuccess: { (response : StoreAddressResponse?) in
            if let response = response {
                self.stores.accept(response.responseArray!)
            }
        }) { (mError) in
            
        }
    }
    
}
