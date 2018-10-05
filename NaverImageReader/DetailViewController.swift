//
//  DetailViewController.swift
//  NaverImageReader
//
//  Created by 스마트금융과10 on 2018. 5. 30..
//  Copyright © 2018년 jung. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

//    @IBOutlet weak var detailDescriptionLabel: UILabel!


    @IBOutlet var m_imageView: UIView!
    
    func configureView() {
        // Update the user interface for the detail item.
        
        
//        let stringURL="https://cdn.pixabay.com/photo/2017/04/10/15/06/japan-2218781_1280.jpg"
//        if let url=URL(string: stringURL){
//            if let data=NSData(contentsOf: url){
//                myImageView.image=UIImage(data: data as Data)
//            }
//        }
        
        
        if let detail = detailItem {
            self.title = detail.imagelink
            if let showImageView = self.m_imageView{
//                showImageView = detail.blogdescription
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

