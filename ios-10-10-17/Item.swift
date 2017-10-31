//
//  Item.swift
//  Activity5
//
//  Created by Jefferson Rylee on 31/10/2017.
//  Copyright © 2017 iOS Arnesfield. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String
    var desc: String
    var price: Double
    var imgSrc: String
    
    init(name: String, desc: String, price: Double, imgSrc: String) {
        self.name = name
        self.desc = desc
        self.price = price
        self.imgSrc = imgSrc
    }
}
