//
//  ViewController.swift
//  StackViews
//
//  Created by Iransamaneh on 2/7/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private static let imageCount = 6;
    private var index = 0
    
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var imageContainer: UIImageView!
    
    
    @IBAction func nextImage(sender: UIButton) {
        index = (index + 1) % ViewController.imageCount
        showImage(index)
    }
    
    @IBAction func prevImage(sender: UIButton) {
        index = index == 0 ? ViewController.imageCount - 1 : --index
        showImage(index)    
    }
    
    @IBAction func resetImage(sender: UIButton) {
        showImage(0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        showImage(0)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func showImage(index: Int) {
        imageTitle.text = "Image \(index)"
        imageContainer.image = UIImage(named: "image\(index)")
    }

}

