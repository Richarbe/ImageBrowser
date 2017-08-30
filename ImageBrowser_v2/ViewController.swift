//
//  ViewController.swift
//  ImageBrowser_v2
//
//  Created by AAK on 8/30/17.
//  Copyright © 2017 SSU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageCounter: UILabel!

    let browserModel = BrowserModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayCurrentImage()
    }
    
    func displayCurrentImage(){
        if let image = browserModel.currentImage(){
            imageView.image = image
            imageTitle.text = browserModel.currentTitle()
            imageCounter.text = "\(browserModel.currentImagePosition())/\(browserModel.numberOfImages())"
        }else{
            imageTitle.text = ""
            imageCounter.text = ""
        }
    }
    
    
    @IBAction func didSwipeLeft(_ sender: UISwipeGestureRecognizer) {
        print("didSwipeLeft")
        browserModel.next()
        displayCurrentImage()
    }
    
    @IBAction func didSwipeRight(_ sender: UISwipeGestureRecognizer) {
        print("didSwipeRight")
        browserModel.previous()
        displayCurrentImage()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

