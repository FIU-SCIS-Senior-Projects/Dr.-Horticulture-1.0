//
//  RecommendationViewController.swift
//  Dr_Horticulture_1.0
//
//  Created by admin on 4/20/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class RecommendationViewController: UIViewController {
    
    @IBOutlet weak var plantNameLabel: UILabel!
    @IBOutlet weak var weekAfterPlantingLabel: UILabel!
    @IBOutlet weak var recommendationLabel: UILabel!
    
    var plant:PlantModel?
    var weekAfter:String?
    var lowerLimit:Double?
    var upperLimit:Double?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let p = plant {
            plantNameLabel.text = p.CommonName
            weekAfterPlantingLabel.text = weekAfter
            if p.CommonName == "Arizona Apricot" {
                lowerLimit = 0.612
                upperLimit = 0.793
            }
            else {
                lowerLimit = 0.80
                upperLimit = 0.92            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
