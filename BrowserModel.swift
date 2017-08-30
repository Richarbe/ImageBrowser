//
//  BrowserModel.swift
//  ImageBrowser_v2
//
//  Created by student on 8/30/17.
//  Copyright © 2017 SSU. All rights reserved.
//

import UIKit

class BrowserModel: NSObject {
    private let baseURLstr = "https://www.cs.sonoma.edu/~kooshesh/cs470/sf_pics/"
    
    private let imageNames = ["ggb_1.jpg", "bay_b_1.jpg", "city_1.jpg",
                              "ggb_2.jpg", "ggb_3.jpg", "city_2.jpg",
                              "city_3.jpg", "ggb_3.jpg", "city_4.jpg", "city_5.jpg"]
    private let imageTitles = ["Golden Gate Bridge 1", "Bay Bridge 1", "City View 1",
                               "Golden Gate Bridge 2", "Golden Gate Bridge 3", "City View 2",
                               "City View 3", "Golden Gate Bridge 3", "City View 4", "City View 5"]
    private var currentIdx = 0
    
    func currentImage() -> UIImage? {//returning optional UIImage so that we can sometimes return nil
        
        if let url = URL(string: baseURLstr + imageNames[currentIdx]),
            let data = try? Data(contentsOf: url),
            let image = UIImage(data: data) {
            return image
        }else{
            return nil
        }
    }
    func next(){
        currentIdx = (currentIdx + 1) % imageNames.count
    }
    
    func previous() {
        if currentIdx == 0 {
            currentIdx = imageNames.count - 1
        } else {
            currentIdx -= 1
        }
    }
    
    func currentTitle() -> String {
        return imageTitles[currentIdx]
    }
    
    func currentImagePosition() -> Int {
        return currentIdx + 1
    }
    
    func numberOfImages() -> Int {
        return imageNames.count
    }
}
