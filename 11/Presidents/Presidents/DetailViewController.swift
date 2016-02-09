//
//  DetailViewController.swift
//  Presidents
//
//  Created by Iransamaneh on 2/8/16.
//  Copyright © 2016 Iransamaneh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var webView : UIWebView!

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        
        if let detail = self.detailItem{
            if let label = self.detailDescriptionLabel{
                let dic = detail as! [String : String]
                let urlString = dic["url"]!
                label.text = urlString
                
                let url = NSURL(string: urlString)
                
                let request = NSURLRequest(URL: url!)
                webView.loadRequest(request)
                
                let name = dic["name"]!
                title = name
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

