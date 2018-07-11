//
//  DataStore.swift
//  RutgersFood
//
//  Created by Salman Fakhri on 7/11/18.
//  Copyright © 2018 Salman Fakhri. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(String)
}

struct DataStore {
    
    let diningHallEndpoint = "https://rumobile.rutgers.edu/1/rutgers-dining.txt"
    let testEndpoint = "https://api.myjson.com/bins/cpvnq"
    
    fileprivate func requestForDecodableJson<T: Decodable>(endpoint: String, completion: @escaping (T)->()) {
        let url = URL(string: endpoint)
        guard let requestURL = url else {
            fatalError("Could not create request URL")
            return
        }
        let request = URLRequest(url: requestURL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            if let error = responseError {
                print(error)
            } else if let jsonResponse = responseData {
                let decoder = JSONDecoder()
                do {
                    let parsed = try decoder.decode(T.self, from: jsonResponse)
                    completion(parsed)
                } catch {
                    print(error)
                }
            } else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                print(error)
            }
        }
        task.resume()
    }
    
    func getDiningOptions(completion: @escaping (Result<HomeResponse>) -> ()) {
        requestForDecodableJson(endpoint: testEndpoint) { (res: HomeResponse) in
            completion(.success(res))
        }
    }
    
    
    
    
}
