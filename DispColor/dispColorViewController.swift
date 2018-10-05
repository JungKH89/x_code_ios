//
//  dispColorViewController.swift
//  DispColor
//
//  Created by 스마트금융과10 on 2018. 5. 1..
//  Copyright © 2018년 jung. All rights reserved.
//

import UIKit

class dispColorViewController: UIViewController {
    
    var colorRed = 0
    var colorGreen = 0
    var colorBlue = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(colorRed)
        print(colorGreen)
        print(colorBlue)
        
        let backColor = UIColor(red: CGFloat(colorRed)/256.0, green: CGFloat(colorGreen)/256.0, blue: CGFloat(colorBlue)/256.0, alpha: 1.0)
        
        view.backgroundColor = backColor
    }
    
    @IBAction func returnTop1(segue: UIStoryboardSegue){
        print("Returned")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //2번째 화면 (->dispColorViewController 클래스)으로 RGB 값 전달하기
//        let nextvc = segue.destination as! disp_3ViewController
//
//
//        //변경될 화면에 있는 변수에 값을 전달
//        nextvc.color_r = colorRed
//        nextvc.color_g = colorGreen
//        nextvc.color_b = colorBlue
        
        if let nextvc = segue.destination as? disp_3ViewController {
            nextvc.color_r = colorRed
            nextvc.color_g = colorGreen
            nextvc.color_b = colorBlue
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
