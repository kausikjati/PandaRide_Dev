//
//  Bike.swift
//  Panda Rides
//
//  Created by Kausik Jati on 18/03/18.
//  Copyright © 2018 Kausik Jati. All rights reserved.
//

import Foundation
import SwiftyJSON

class Bike {
    
    var _id     =   String()
    var name    =   String()
    var type   =   String()
    var description     =    String()
    var term_cond   =    String()
    var vendor = String()
    var image = String()
    var offer_avail = String()
    var hour_cost = String()
    var day_cost = String()
    var isavailable = String()
    var location = [String]()
   
    
    init(BikeJson: JSON){
        self._id   =   BikeJson["prod_id"].stringValue
        self.name   =   BikeJson["prod_name"].stringValue
        self.type   =   BikeJson["prod_type"].stringValue
        self.description   =   BikeJson["prod_description"].stringValue
        self.term_cond    =   BikeJson["prod_term_cond"].stringValue
        self.vendor    =   BikeJson["prod_vendor"].stringValue
        self.image    =   BikeJson["prod_image"].stringValue
        self.offer_avail    =   BikeJson["prod_offer_avail"].stringValue
        self.hour_cost    =   BikeJson["prod_hour_cost"].stringValue
        self.day_cost    =   BikeJson["prod_day_cost"].stringValue
        self.isavailable    =   BikeJson["prod_available"].stringValue
        
        for item in BikeJson["prod_location"].arrayValue {
            
            self.location.append(item.stringValue)
            
        }
        
    }
    
}
    
    
    
 
