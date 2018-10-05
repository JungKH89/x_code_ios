//
//  ThirdViewController.swift
//  ExConvertUnit
//
//  Created by 스마트금융과10 on 2018. 5. 16..
//  Copyright © 2018년 jung. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var m_dataTextField: UITextField!
    let ap = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        // appDelegate 변수에서 읽어서 화면(textfield)에 표시
        let sunValue = ap.cmValue * 0.33
        m_dataTextField.text = String(sunValue)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClicked(_ sender: Any) {
        //사용자가 입력(버튼 클릭)시 textfield값을 appDelegate변수에 적용(업데이트)
        //키보드를 닫는다.
        m_dataTextField.resignFirstResponder()
        
        if let text = m_dataTextField.text{
            if let cmValue = Double(text){
                ap.cmValue = cmValue / 0.33
            }
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
