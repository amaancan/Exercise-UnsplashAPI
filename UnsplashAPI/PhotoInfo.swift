//
//  PhotoInfo.swift
//  UnsplashAPI
//
//  Created by Amaan on 2018-01-04.
//  Copyright © 2018 BearStacks. All rights reserved.
//

import Foundation
import SwiftyJSON

struct PhotoInfo {
    
    var width: String
    var height: String
    var description: String
    var urls: [String: JSON]
    var likes: String
    var userInfo: [String: JSON]

    init(photoInfoJSON: JSON) {
        self.width = photoInfoJSON["width"].stringValue
        self.height = photoInfoJSON["height"].stringValue
        self.description = photoInfoJSON["description"].stringValue
        self.urls = photoInfoJSON["urls"].dictionaryValue
        self.likes = photoInfoJSON["likes"].stringValue
        self.userInfo = photoInfoJSON["user"].dictionaryValue
    }
}

// heap: long-term memory that a program has - few things go here - classes, global objects
// stack: short-term memory - used for local var - puts stuff in and takes it out
