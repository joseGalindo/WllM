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
    let isLoading = PublishSubject<Bool>()
    var stores : BehaviorRelay<[StoreAddress]> = BehaviorRelay(value: [])
    
    func getStores() {
        isLoading.onNext(true)
        ApiService.shared.methodGET(endpoint: .storeLocator, onSuccess: { (response : StoreAddressResponse?) in
            if let responseArr = response?.responseArray {
                self.stores.accept(responseArr)
            } else {
            }
            self.isLoading.onNext(false)
        }) { (mError) in
            self.isLoading.onNext(false)
        }
    }
    
    func sortData(ascending : Bool) {
        stores.accept(stores.value.sorted(by: { (ad1, ad2) -> Bool in
            if ascending {
                return ad1 < ad2
            } else {
                return ad1 > ad2
            }
        }))
    }
    
}
