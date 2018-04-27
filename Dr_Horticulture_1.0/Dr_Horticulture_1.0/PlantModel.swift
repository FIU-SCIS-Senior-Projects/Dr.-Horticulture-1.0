//
//  PlantModel.swift
//  Dr_Horticulture_1.0
//
//  Created by admin on 3/8/18.
//  Copyright © 2018 admin. All rights reserved.
//

class PlantModel{
    var Id:String?
    var CommonName:String?
    var ScientificName:String?
    var Week2Lower:Double?
    var Week2Upper:Double?
    var Week3Lower:Double?
    var Week3Upper:Double?
    var Week4Lower:Double?
    var Week4Upper:Double?
    var Week5Lower:Double?
    var Week5Upper:Double?
    var Week6Lower:Double?
    var Week6Upper:Double?
    
    init(Id:String?, CommonName:String?, ScientificName:String?, Week2Lower:Double?, Week2Upper:Double?,
         Week3Lower:Double?, Week3Upper:Double?, Week4Lower:Double?, Week4Upper:Double?,
         Week5Lower:Double?, Week5Upper:Double?, Week6Lower:Double?, Week6Upper:Double?){
        self.Id = Id
        self.CommonName = CommonName
        self.ScientificName = ScientificName
        self.Week2Lower = Week2Lower
        self.Week2Upper = Week2Upper
        self.Week3Lower = Week3Lower
        self.Week3Upper = Week3Upper
        self.Week4Lower = Week4Lower
        self.Week4Upper = Week4Upper
        self.Week5Lower = Week5Lower
        self.Week5Upper = Week5Upper
        self.Week6Lower = Week6Lower
        self.Week6Upper = Week6Upper
    }
}
