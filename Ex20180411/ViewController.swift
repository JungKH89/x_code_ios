//
//  ViewController.swift
//  Ex20180411
//
//  Created by 스마트금융과10 on 2018. 4. 11..
//  Copyright © 2018년 jung. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var depView: UIWebView!
    
    
//    http주소도 포함하고 싶으면?!
//    info.plist 클릭
//    빈공간 오른쪽 클릭 -> show raw keys/values 클릭
//    NSAppTransportSecurity 추가
//    다시 show raw keys/values 클릭해서 체크해제
//    그아래 Allow Arbitrary Loads ( Yes ) 추가!!!
//    이러면 완료!!!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myURL=URL(string: "https://www.apple.com")
        let myRequest=URLRequest(url: myURL!)
        myWebView.load(myRequest)
        
        if let url=URL(string: "https://www.apple.com"){
            //url이 nil이 아니라면 출력함
            let urlreq=URLRequest(url: url)
            depView.loadRequest(urlreq)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

