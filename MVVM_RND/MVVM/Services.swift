//
//  Services.swift
//  MVVM_RND
//
//  Created by Rahul Vishwakarma on 08/09/23.
//

import Foundation


class Services {
    
    func getData(completion: @escaping (Bool, DummyCartModel?, String) -> () ) {
        
        
        let url = URL(string: "https://dummyjson.com/cart")!
        var request = URLRequest(url: url, timeoutInterval: 20.0)
       
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let httpResponse = response as? HTTPURLResponse {
                
                
                if httpResponse.statusCode == 200 {
                    guard let data = data else {
                        completion(false ,nil, error?.localizedDescription ?? "Data is nil")
                        return
                    }
                    
                    do {
                        
                        let dummyData = try JSONDecoder().decode(DummyCartModel.self, from: data)
                        completion(true ,dummyData, "Success")
                        
                    } catch {
                        
                        print(error.localizedDescription)
                        completion(false ,nil, error.localizedDescription)
                    }
                    
                    
                    
                } else {
                    completion(false ,nil, "Something went wrong \(httpResponse.statusCode)")
                    return
                }
                
            } else {
                completion(false ,nil, "Something went wrong")
                return
                
            }
            
        }
        
        task.resume()
        
        
        
    }
    
    
}
