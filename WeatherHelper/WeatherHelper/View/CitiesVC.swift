//
//  CitiesVC.swift
//  WeatherHelper
//
//  Created by Vladyslav Zhulavskyi on 1/23/19.
//  Copyright © 2019 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class CitiesVC: UIViewController {
    //MARK: -Properties
    var shared = CitiesController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shared.getDataFromJSON()
    }
}

