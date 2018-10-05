//
//  ViewController.swift
//  JungKH
//
//  Created by 스마트금융과10 on 2018. 4. 25..
//  Copyright © 2018년 jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var m_myLabel: UILabel!
    @IBOutlet weak var m_myImgView: UIImageView!
    @IBOutlet weak var m_mySwitch: UISwitch!
    @IBOutlet weak var m_myTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        m_myImgView.image=UIImage(named: "flower1.jpg")
        
        if let url = URL(string: "https://www.google.com/robots.txt"){
            let urlSession = URLSession.shared
            //데이터를 읽어들이는 태스크를 완료하면 completionHandler 처리가 수행됨
            let task = urlSession.dataTask(with: url, completionHandler: onFinish)
            task.resume()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func onFinish(data: Data?, response: URLResponse?, error: Error?){
        //Raw데이터를 UTF8 문자열로 변환
        if let nsstr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue){
            //UTF8 문자열로 변환되면 일반적인 문자열로 변환
            let str = String(nsstr)
            
            if let response = response as? HTTPURLResponse{
                if response.statusCode == 200 {
                    print("Success")
                    //main thread가 아닌 곳에서 처리를 하고 싶을 때는 DispatchQueue를 이용함
                    DispatchQueue.main.sync(execute: {
                        self.m_myTextView.text=str
                    })
                }
                else{ //404 page not found, 503 internal server error, 403 forbidden..
                    print("Error " + "\(response.statusCode)")
                }
            }
        }
    }
    
    @IBAction func funcLabelChg(_ sender: Any) {
        m_myLabel.text="정경화"
    }
    

    @IBAction func funcImageChg(_ sender: Any) {
        if(m_mySwitch.isOn==true){
            m_myImgView.image=UIImage(named: "flower1.jpg")
        }else{
            m_myImgView.image=UIImage(named: "flower2.jpg")
        }
    }
    
    
    
    
    
    

}

