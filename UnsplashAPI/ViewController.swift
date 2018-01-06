//
//  ViewController.swift
//  UnsplashAPI
//
//  Created by Amaan on 2018-01-03.
//  Copyright © 2018 BearStacks. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    // https://api.unsplash.com/search/photos?page=1&query=office&client_id=
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PhotoInfoController().fetchPhotoInfo()
    }
    
    
}

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

