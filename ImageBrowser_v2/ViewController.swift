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
    @IBOutlet weak var imageTitle2: UILabel!
    @IBOutlet weak var imageView2: UIImageView!

    let browserModel1 = BrowserModel()
    let browserModel2 = BrowserModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        browserModel2.next()
        displayCurrentImage()
    }
    
    func displayCurrentImage(){
        if let image1 = browserModel1.currentImage(),
           let image2 = browserModel2.currentImage(){
            imageView.image = image1
            imageTitle.text = browserModel1.currentTitle()
            imageView2.image = image2
            imageTitle2.text = browserModel2.currentTitle()
            imageCounter.text = "\(browserModel1.currentImagePosition()) and \(browserModel2.currentImagePosition()) of \(browserModel2.numberOfImages())"
        }else{
            imageTitle.text = ""
            imageCounter.text = ""
        }
    }
    
    
    @IBAction func didSwipeUp(_ sender: UISwipeGestureRecognizer) {
        print("didSwipeLeft")
        browserModel1.next()
        browserModel2.next()
        displayCurrentImage()
    }
    
    @IBAction func didSwipeDown(_ sender: UISwipeGestureRecognizer) {
        print("didSwipeRight")
        browserModel1.previous()
        browserModel2.previous()
        displayCurrentImage()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


