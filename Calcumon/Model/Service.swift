//
//  Service.swift
//  Calcumon
//
//  Created by Sarin Swift on 3/20/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation
import UIKit

class Service {
    
    // 'POST' request
    
    class func signupNewUser(router: Router, email: String, password: String, username: String) {
        
        // get parameters and turn into jsondata
        let json = ["username": username, "email": email, "password": password]
        guard let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []) else {
            print("error turning into jsondata")
            return
        }
        
        guard let url = urlBuilder(router: router) else {
            print("error with url")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = jsonData
        urlRequest.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        // create task here
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                print("error with data \(String(describing: error?.localizedDescription))")
                return
            }
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
    
    class func loginOldUser(router: Router, password: String, username: String, completion: @escaping (String) -> ()) {
        
        // get parameters and turn into jsondata
        let json = ["username": username, "password": password]
        guard let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []) else {
            print("error turning into jsondata")
            return
        }
        
        guard let url = urlBuilder(router: router) else {
            print("error with url")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = jsonData
        urlRequest.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
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
                
                if response["message"] == "Wrong Username or password" || response["message"] == "Wrong Username or Password" {
                    DispatchQueue.main.async {
                        completion(response["message"]!)
                    }
                    return 
                } else {
                    DispatchQueue.main.async {
                        completion("success")
                    }
                }
            }
        }
        task.resume()
    }
    
    
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
