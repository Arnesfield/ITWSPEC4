//
//  Item.swift
//  PracticalQuiz1
//
//  Created by JEFFERSON RYLEE ESPIRITU on 03/11/2017.
//  Copyright © 2017 iOS Arnesfield. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String
    var desc: String
    var imgSrc: String
    
    init(name: String, desc: String, imgSrc: String) {
        self.name = name
        self.desc = desc
        self.imgSrc = imgSrc
    }
}
