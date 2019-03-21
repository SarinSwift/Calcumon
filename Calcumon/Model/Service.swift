//
//  Service.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/20/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

class Service {
    
    // 'POST' request
    
    class func signupNewUser<T: Codable>(router: Router, email: String, password: String, completion: @escaping ([T]) -> ()) {
        
        // get parameters and turn into jsondata
        let json = ["email": email, "password": password]
        guard let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []) else {
            print("error turning into jsondata")
            return
        }
        
        guard let url = urlBuilder(router: router) else {
            print("error with url")
            return
        }
        print("url issss \(url)")
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = jsonData
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // create task here
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                print("error with data \(String(describing: error?.localizedDescription))")
                return
            }
            print(data)
            guard error == nil else {
                print("error occured \(String(describing: error?.localizedDescription))")
                return
            }
            
            let response = try? JSONSerialization.jsonObject(with: data, options: [])
            if let response = response as? [String: String] {
                print(response)
            }
        }
        task.resume()
    }
    
//    class func loginOldUser<T: Codable>(router: Router, completion: @escaping ([T]) -> ()) {
//        let session = URLSession(configuration: .default)
//        guard let url = urlBuilder(router: router) else { return }
//        print("url issss \(url)")
//        let urlRequest = URLRequest(url: url)
//
//        // create task here
//        let task = session.dataTask(with: urlRequest) { (data, response, error) in
//            guard let data = data else { return }
//            print(data)
//        }
//        task.resume()
//    }
    
    class func urlBuilder(router: Router) -> URL? {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        
        guard let url = components.url else {
            return nil
        }
        return url
    }
}
