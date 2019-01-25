//
//  CitiesController.swift
//  WeatherHelper
//
//  Created by Vladyslav Zhulavskyi on 1/23/19.
//  Copyright © 2019 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class CitiesController: NSObject {
    var shared = City()
    var cities = ["Lviv", "Kyiv", "Kharkiv", "Odessa", "Lutsk", "Ternopil"]
    func startJSON(string: String) {
        DispatchQueue.global().async {
            let sampleDataAddress = string
            let url = URL(string: sampleDataAddress)
            let jsonData = try! Data(contentsOf: url!)
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(WeatherData.self, from: jsonData)
                for index in 0..<12 {
                    self.shared.summaryString.append(user.hourly.data[index].summary)
                }
                for index in 0..<12 {
                    self.shared.temperatureDouble.append(user.hourly.data[index].temperature)
                }

            } catch {
                print(error.localizedDescription)
            }
            print(self.shared.summaryString)
            print(self.shared.temperatureDouble)
        }
    }
}
