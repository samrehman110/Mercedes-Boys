//
//  Dealership.swift
//  Mercedes
//
//  Created by Kiprop Korir on 22/04/2019.
//  Copyright © 2019 Kiprop Korir. All rights reserved.
//

import Foundation

class Dealership{
    var name:String = ""
    var location: String = ""
    var opening_times: String = ""
    var image_url: String = ""
    var maps_link: String = ""
    var phone: String = ""
    var id: String = ""
    
    
    
}
//
//extension Dealership{
//    init?(dictionary: [String : Any], id: String) {
//        guard   let name = dictionary["name"] as? String,
//           let location = dictionary["location"] as? String,
//            let opening_times = dictionary["opening_times"] as? String,
//        let image_url = dictionary["image_url"] as? String,
//        let maps_link = dictionary["maps_link"] as? String,
//        let phone = dictionary["phone"] as? String,
//        let id = dictionary["id"] as? String
//            else { return nil }
//
//
//        self.init(name: name, location: location, opening_times: opening_times, image_url: image_url, maps_link: maps_link, phone: phone, id: id)
//    }
//}
