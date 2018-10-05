//
//  ViewController.swift
//  Ex20180411_1
//
//  Created by 스마트금융과10 on 2018. 4. 11..
//  Copyright © 2018년 jung. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {

    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //첫번째 예제때는 웹뷰에서 인터넷을 여는거라 https밖에 호출이 안됐던거고
    //지금은 사파리를 띄우는거라 http도 가능함
    @IBAction func tapBtnSafari(_ sender: Any) {
        if let myurl = URL(string: "http://www.nate.com"){
            //url이 nil이 아니라면 SFSafariViewController를 출력
            let vc = SFSafariViewController(url: myurl)
            vc.delegate=self
            present(vc, animated: true, completion: myCallBack)
        }
    }
    
    func myCallBack(){
        print("사파리 브라우저 열림")
    }
    
    //비동기방식(언제 끝날지 모르는거지~ 굳이 안기다려도 되는?)
    //이미 클래스내에 정의가 되어있는 예약함수! Done이 눌리면 print문날리겠다고 재정의한 것!
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        print("Safari Close")
    }
    
    
    @IBAction func imgLoadingBtn(_ sender: Any) {
        //이미지 출처 : https://pixabay.com/ko/
        let stringURL="https://cdn.pixabay.com/photo/2017/04/10/15/06/japan-2218781_1280.jpg"
        if let url=URL(string: stringURL){
            if let data=NSData(contentsOf: url){
                myImageView.image=UIImage(data: data as Data)
            }
        }
    }
    
    @IBAction func btnTextLoad(_ sender: Any) {
        //1. URL -> request-------Server --->Response (test file : .txt)
        if let url = URL(string: "https://www.google.com/robots.txt"){
            //url이 nil이 아니라면 URLSession 객체 생성
            let urlSession = URLSession.shared
            //데이터를 읽어들이는 태스크를 완료하면 completionHandler 처리가 수행됨
            let task = urlSession.dataTask(with: url, completionHandler: onFinish)
            task.resume()   //request -> -----SERVER---->respone:onFinish -> text data
        }
    }
    
    //2. respone -> var text:String  -> alert popup
    //읽어들이기를 완료했을 때 호출할 메서드 생성(이름은 자유)
    func onFinish(data: Data?, response: URLResponse?, error: Error?){
        //Raw데이터를 UTF8 문자열로 변환
        if let nsstr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue){
            //UTF8 문자열로 변환되면 일반적인 문자열로 변환
            let str = String(nsstr)
            //문자열 출력
            print("문자열=[\(str)]")
            
            if let response = response as? HTTPURLResponse{
                if response.statusCode == 200 {
                    print("Success")
                    
                    //alert 사용법: https://stackoverflow.com/questions/24022479/how-would-i-create-a-uialertview-in-swift
                    let alert = UIAlertController(title: "결과", message: str, preferredStyle: UIAlertControllerStyle.alert)
                    
                    //add an action(button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    //show the alert
                    self.present(alert, animated: true, completion: nil)
                }
                else{ //404 page not found, 503 internal server error, 403 forbidden..
                    print("Error " + "\(response.statusCode)")
                }
            }
        }
    }
    
}

