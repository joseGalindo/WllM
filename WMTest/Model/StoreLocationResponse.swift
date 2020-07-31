//
//  StoreLocationResponse.swift
//  WMTest
//
//  Created by Jose Galindo martinez on 30/07/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import Foundation

struct StoreAddressResponse : Decodable {
    var codeMessage   : Int?
    var message       : String?
    var responseArray : [StoreAddress]?
}

struct StoreAddress : Decodable, Identifiable {
    
    var codeMessage : Int?
    var message : String?
    var id : Int?
    var businessID : String?
    var storeID : String?
    var name : String?
    var address : String?
    var telephone : String?
    var manager : String?
    var zipCode : String?
    var latSpan : String?
    var latPoint : String?
    var lonPoint : String?
    var opens : String?
    
}

extension StoreAddress : Equatable {
    static func ==(ls: StoreAddress, rs : StoreAddress) -> Bool {
        return ls.name! == rs.name!
    }
}

extension StoreAddress : Comparable {
    static func < (lhs: StoreAddress, rhs: StoreAddress) -> Bool {
        return lhs.name! < rhs.name!
    }
}
