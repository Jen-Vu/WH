//
//  RecommendationViewController.swift
//  WeatherHelper
//
//  Created by 123 on 1/24/19.
//  Copyright © 2019 Vladyslav Zhulavskyi. All rights reserved.
//

import UIKit

class RecommendationViewController: UIViewController {
    
    var controller = RecommendationController()
    
    //MARK: IBoutlets
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var recomendationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recomendationTableView.delegate = self
        recomendationTableView.dataSource = self
        
        recomendationTableView.register(UINib(nibName: "RecomendationTableViewCell", bundle: nil), forCellReuseIdentifier: "RecomendationTableViewCell")

        // Do any additional setup after loading the view.
    }
}

extension RecommendationViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.recommnedations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentRecomendation = controller.recommnedations[indexPath.row]
        
        let cell = recomendationTableView.dequeueReusableCell(withIdentifier: "RecomendationTableViewCell", for: indexPath) as! RecomendationTableViewCell
        
        cell.item.text = currentRecomendation.recommendation
        
        return cell
    }
    
}
