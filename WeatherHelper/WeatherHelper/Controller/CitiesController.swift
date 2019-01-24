//
//  CitiesController.swift
//  WeatherHelper
//
//  Created by Vladyslav Zhulavskyi on 1/23/19.
//  Copyright © 2019 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class CitiesController: NSObject {
    var dataArray = [user]()
}

struct user: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
extension CitiesController {
    func getDataFromJSON() {
        
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            guard error == nil else { return }

            do {
                let decoder = JSONDecoder()
                self.dataArray = try decoder.decode([user].self, from: data)
            } catch let error {
                print(error)
            }
            print(self.dataArray)
        }.resume()
    }
}
