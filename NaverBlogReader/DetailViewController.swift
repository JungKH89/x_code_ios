//
//  DetailViewController.swift
//  NaverBlogReader
//
//  Created by 스마트금융과10 on 2018. 5. 30..
//  Copyright © 2018년 jung. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

//    @IBOutlet weak var detailDescriptionLabel: UILabel!


    @IBOutlet weak var detailTextView: UITextView!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            self.title = detail.bloggerlink
            print(detail.blogdescription)
            if let showTextView = self.detailTextView{
                showTextView.text = detail.blogdescription
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Event? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

