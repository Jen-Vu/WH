//
//  CitiesController.swift
//  WeatherHelper
//
//  Created by Vladyslav Zhulavskyi on 1/23/19.
//  Copyright © 2019 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class CitiesController: NSObject {
    var cities = [City(cityName: "Kiev", lon: "30.5238", lat: "50.45466"),
                  City(cityName: "Lviv", lon: "-71.0589", lat: "42.3601"),
                  City(cityName: "Kharkiv", lon: "36.232845", lat: "49.988358"),
                  City(cityName: "Odessa", lon: "-82.557617", lat: "28.183554"),
                  City(cityName: "Luzk", lon: "25.320078", lat: "50.745073"),
                  City(cityName: "Ternopil", lon: "25.591886", lat: "49.555772")]
    func startJSON(string: String) {
        DispatchQueue.global().async {
            let sampleDataAddress = string
            let url = URL(string: sampleDataAddress)
            let jsonData = try! Data(contentsOf: url!)
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(WeatherData.self, from: jsonData)
                print(user.hourly.summary)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
