//
//  ViewController.swift
//  Dr_Horticulture_1.0
//
//  Created by admin on 3/8/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var plantsReference:DatabaseReference?
    var plantsList = [PlantModel]()
    
    @IBOutlet weak var tbPlants: UITableView!
    @IBOutlet weak var plantIdLabel: UILabel!
    @IBOutlet weak var plantCommonNameLabel: UILabel!
    @IBOutlet weak var plantScientificNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        plantsReference = Database.database().reference().child("Plants")
        plantsReference?.observe(DataEventType.value, with: { (snapshot) in
            if snapshot.childrenCount>0 {
                //print("inside if statement")
                self.plantsList.removeAll()
                
                for plants in snapshot.children.allObjects as! [DataSnapshot]{
                    //print("runing for loop")
                    let plantObject = plants.value as? [String: AnyObject]
                    let plantId = plantObject?["Id"]
                    let plantCommonName = plantObject?["CommonName"]
                    let plantScientificName = plantObject?["ScientificName"]
                    let plantWeek2Lower = plantObject?["Week2Lower"]
                    let plantWeek2Upper = plantObject?["Week2Upper"]
                    let plantWeek3Lower = plantObject?["Week3Lower"]
                    let plantWeek3Upper = plantObject?["Week3Upper"]
                    let plantWeek4Lower = plantObject?["Week4Lower"]
                    let plantWeek4Upper = plantObject?["Week4Upper"]
                    let plantWeek5Lower = plantObject?["Week5Lower"]
                    let plantWeek5Upper = plantObject?["Week5Upper"]
                    let plantWeek6Lower = plantObject?["Week6Lower"]
                    let plantWeek6Upper = plantObject?["Week6Upper"]
                    
                    let plant = PlantModel(Id: plantId as! String?, CommonName: plantCommonName as! String?,
                                           ScientificName: plantScientificName as! String?,
                                           Week2Lower: plantWeek2Lower as! Double?, Week2Upper: plantWeek2Upper as! Double?,
                                           Week3Lower: plantWeek3Lower as! Double?, Week3Upper: plantWeek3Upper as! Double?,
                                           Week4Lower: plantWeek4Lower as! Double?, Week4Upper: plantWeek4Upper as! Double?,
                                           Week5Lower: plantWeek5Lower as! Double?, Week5Upper: plantWeek5Upper as! Double?,
                                           Week6Lower: plantWeek6Lower as! Double?, Week6Upper: plantWeek6Upper as! Double?)
                    self.plantsList.append(plant)
                }
                self.tbPlants.reloadData()
                print("end view did load")
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let plant:PlantModel = plantsList[indexPath.row]
        cell.textLabel?.text = plant.CommonName
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plantsList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let plant:PlantModel = plantsList[indexPath.row]
        plantIdLabel.text = plant.Id
        plantCommonNameLabel.text = plant.CommonName
        plantScientificNameLabel.text = plant.ScientificName
    }


}

