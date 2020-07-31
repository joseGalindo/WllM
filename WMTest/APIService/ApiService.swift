//
//  ApiService.swift
//  WMTest
//
//  Created by Jose Galindo martinez on 30/07/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import Foundation

final public class ApiService {

    private let baseURL = URL(string: "https://www.walmartmobile.com.mx/walmart-services/mg")!
    private var decoder : JSONDecoder!
    public typealias APIRequestCompleteSuccessClosure<T : Decodable> = (_ responseObj : T) -> Void
    public typealias APIRequestCompleteFailureClosure = (_ reason : APIError?) -> Void
    
    public enum APIError: Error {
        case noResponse
        case jsonDecodingError(error: Error)
        case networkError(error: Error)
    }
    
    public enum Endpoint {
        case storeLocator
        
        func path() -> String {
            switch self {
            case .storeLocator:
                return "address/storeLocatorCoordinates"
            }
        }
    }
    
    static let shared : ApiService = ApiService()
    private init() {
        decoder = JSONDecoder()
    }
    
    public func methodGET<T : Decodable>(endpoint : Endpoint, /*params, */
        onSuccess successBlock : @escaping APIRequestCompleteSuccessClosure<T>,
        onFailure failureBlock : @escaping APIRequestCompleteFailureClosure) {
        let queryURL = baseURL.appendingPathComponent(endpoint.path())
        let request = URLRequest.init(url: queryURL)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    failureBlock(.noResponse)
                }
                return
            }
            guard error == nil else {
                DispatchQueue.main.async {
                    failureBlock(.networkError(error: error!))
                }
                return
            }
            do {
                let object = try self.decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    successBlock(object)
                }
            } catch let error {
                DispatchQueue.main.async {
                    #if DEBUG
                    print("JSON Decoding Error: \(error)")
                    #endif
                    failureBlock(.jsonDecodingError(error: error))
                }
            }
        }
        task.resume()
    }
    
}
