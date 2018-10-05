//
//  ViewController.swift
//  DispColor
//
//  Created by 스마트금융과10 on 2018. 5. 1..
//  Copyright © 2018년 jung. All rights reserved.
//

import UIKit
import GameplayKit



class ViewController: UIViewController {
   
    //레이블 색상표시
    @IBOutlet weak var m_colorLabel: UILabel!
    
    let m_randomSource = GKARC4RandomSource() //random generate
    var m_colorR = 0 //red
    var m_colorG = 0 //green
    var m_colorB = 0 //blue
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnShowColor(_ sender: Any) {


    }
    @IBAction func returnTop(segue: UIStoryboardSegue){
        print("Returned")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //R G B 랜덤하게 받아오기
        m_colorR = m_randomSource.nextInt(upperBound: 256)
        m_colorG = m_randomSource.nextInt(upperBound: 256)
        m_colorB = m_randomSource.nextInt(upperBound: 256)
        
        //레이블에 3개의 값을 출력
        m_colorLabel.text = "R=\(m_colorR), G=\(m_colorG), b=\(m_colorB)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //2번째 화면 (->dispColorViewController 클래스)으로 RGB 값 전달하기
        //let nextvc = segue.destination as! dispColorViewController
        if let nextvc = segue.destination as? dispColorViewController{

        //변경될 화면에 있는 변수에 값을 전달
        nextvc.colorRed = m_colorR
        nextvc.colorGreen = m_colorG
        nextvc.colorBlue = m_colorB
        }else if let nextvc = segue.destination as? disp_3ViewController{
            
            //변경될 화면에 있는 변수에 값을 전달
            nextvc.color_r = m_colorR
            nextvc.color_g = m_colorG
            nextvc.color_b = m_colorB
            
            nextvc.isHidden = true
            
        }
    }
}
