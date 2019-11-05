//
//  DataService.swift
//  WatchMoviesInMVP
//
//  Created by Vaayoo on 17/05/19.
//  Copyright © 2019 Vaayoo. All rights reserved.
//

import UIKit

class DataService: NSObject {
    func hitService<T: Codable>(completion: @escaping (T) -> Void){
        
        let session = URLSession.shared
        var request = URLRequest.init(url: URL.init(string: "http://itunes.apple.com/us/rss/topmovies/limit=25/json")!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        session.dataTask(with: request) { (data, response, error) in
            if error != nil{
                //completion(nil)
                return
            }
            else
            {
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(T.self, from: data!){
                    completion(json)
                }
            }
        }.resume()
        
    }
}
