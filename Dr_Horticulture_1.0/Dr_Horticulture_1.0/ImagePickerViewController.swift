//
//  ImagePickerViewController.swift
//  Dr_Horticulture_1.0
//
//  Created by admin on 3/20/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var plant:PlantModel?
    var weekList = ["Week 1", "Week 2", "Week 3", "Week 4",
                    "Week 5", "Week 6", "Week 7", "Week 8"]
    
    @IBOutlet weak var plantLabel: UILabel!
    @IBOutlet weak var weekTextField: UITextField!
    @IBOutlet weak var weekDropDownPickerView: UIPickerView!
    @IBOutlet weak var plantImageView: UIImageView!
    @IBOutlet weak var fertilizerRecommendationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let p = plant {
            plantLabel.text = p.CommonName
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weekList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return weekList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.weekTextField.text = self.weekList[row]
        self.weekDropDownPickerView.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.weekTextField {
            self.weekDropDownPickerView.isHidden = false
            textField.endEditing(true)
        }
    }
    
    @IBAction func importImageTouchUpInside(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            self.present(imagePicker, animated: false, completion: nil)
        }
        else {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(imagePicker, animated: false, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            plantImageView.image = image
        }
        else {
            //Error Message
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func fertilizerRecommendatioTouchUpInside(_ sender: UIButton) {
        if weekTextField.text == "Week after planting" {
            weekTextField.textColor = UIColor.red
            return
        }
        self.performSegue(withIdentifier: "getRecommendation", sender: fertilizerRecommendationButton)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getRecommendation" {
            let destination = segue.destination as! RecommendationViewController
            destination.plant = plant
            destination.weekAfter = weekTextField.text
        }
    }
    
}
