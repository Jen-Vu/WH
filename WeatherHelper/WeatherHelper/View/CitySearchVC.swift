//
//  CitySearchVC.swift
//  WeatherHelper
//
//  Created by Vladyslav Zhulavskyi on 1/23/19.
//  Copyright © 2019 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class CitySearchVC: UIViewController {
    //MARK: -Properties
    var ciryController = CitiesController()
    var recommendationController = RecommendationController()
    
    
    //MARK: IBoutlets
    
    @IBOutlet weak var citiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        citiesTableView.delegate = self
        citiesTableView.dataSource = self
        
        citiesTableView.register(UINib(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "CityTableViewCell")
        
    }
}

extension CitySearchVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ciryController.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCity = ciryController.cities[indexPath.row]
        
        let cell = citiesTableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        
        cell.cityName.text = currentCity.cityName

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "nextView", sender: self)
    }
}
