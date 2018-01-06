//
//  PhotoInfoController.swift
//  UnsplashAPI
//
//  Created by Amaan on 2018-01-06.
//  Copyright © 2018 BearStacks. All rights reserved.
//

import Foundation
import SwiftyJSON

class PhotoInfoController {
    
    var photoInfoList = [PhotoInfo]()

    func fetchPhotoInfo() {
        let baseURL = URL(string: "https://api.unsplash.com/search/photos")!
        
        let query: [String: String] =
            ["page": "1",
             "query": "sunset",
             "client_id": "" //MARK: - INSERT YOUR API KEY HERE!
        ]
        
        let url = baseURL.withQueries(query)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let json = JSON.init(data: data)
                self.parseResults(completeJSON: json)
                print(self.photoInfoList)
            } else {
                //print("Either no data was returned, or data was not serialized.")
            }
        }
        task.resume()
    }
    
    //TODO: - read on mutating funcs
    func parseResults (completeJSON: JSON) {

        for result in completeJSON["results"].arrayValue {
            let photoInfo = PhotoInfo(photoInfoJSON: result)
            photoInfoList.append(photoInfo)
        }
        
    }
}
