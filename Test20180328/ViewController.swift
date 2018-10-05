//
//  ViewController.swift
//  Test20180328
//
//  Created by 스마트금융과10 on 2018. 3. 28..
//  Copyright © 2018년 jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var m_myButton: UIButton!
    
    @IBOutlet weak var m_label: UILabel!
    
    @IBOutlet weak var m_mySwitch: UISwitch!
    
    @IBOutlet weak var m_mySlider: UISlider!
    @IBOutlet weak var m_myTextField: UITextField!{ didSet{
        m_myTextField.delegate=self
        }
    }
    @IBOutlet weak var m_myTextView: UITextView!
    @IBOutlet weak var m_myUIImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        m_myButton.setTitle("눌러주세요", for: UIControlState.normal)
        m_myButton.isEnabled=true
        m_myButton.isSelected=true
        
        m_myTextField.placeholder="여기에 입력해주세요!"
        m_myTextField.textColor=UIColor.white
        m_myTextField.backgroundColor=UIColor.black
        m_myTextField.textAlignment=NSTextAlignment.center
        m_myTextField.font=UIFont.systemFont(ofSize: 20)
        m_myTextField.keyboardType=UIKeyboardType.emailAddress
        m_myTextField.returnKeyType=UIReturnKeyType.done
        
        m_myTextView.text="안녕"
        m_myTextView.textColor=UIColor.black
        m_myTextView.backgroundColor=UIColor.gray
        m_myTextView.textAlignment=NSTextAlignment.left
        m_myTextView.font=UIFont(name: "AmericanTypewriter", size: 20)
        m_myTextView.isEditable=true
        m_myTextView.keyboardType=UIKeyboardType.URL
        m_myTextView.returnKeyType=UIReturnKeyType.send
        
        
        m_myUIImageView.image=UIImage(named: "flower.jpg")
        m_myUIImageView.contentMode=UIViewContentMode.scaleAspectFit
    }
    
    //화면의 아무곳이나 누르면 키보드가 사라지는 함수
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
//    }
//
    //키보드의 엔터키를 누르면 키보드가 사라지는 함수
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        m_myTextField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func funcBtnTap(_ sender: Any) {
        m_label.text=NSLocalizedString("Hello", comment: "인사말")
        
        m_label.textColor=UIColor.white
        m_label.backgroundColor=UIColor.purple
        m_label.textAlignment=NSTextAlignment.left
        
        m_label.font=UIFont.systemFont(ofSize:20)
        m_label.numberOfLines=0
    }
    
    @IBAction func funcSwitchChanged(_ sender: Any) {
        if(m_mySwitch.isOn==true){
            m_mySwitch.onTintColor=UIColor.red
            m_mySwitch.thumbTintColor=UIColor.yellow
            m_label.text="켜짐"
        }
        else{
            m_mySwitch.onTintColor=UIColor.blue
            m_mySwitch.thumbTintColor=UIColor.purple
            m_label.text="꺼짐"
        }
    }
    
    
    @IBAction func funcSliderChanged(_ sender: Any) {
        m_mySlider.minimumValue=0
        m_mySlider.maximumValue=100
        m_mySlider.minimumTrackTintColor=UIColor.purple
        m_mySlider.maximumTrackTintColor=UIColor.yellow
        m_mySlider.isContinuous=true  //이게 true이면 움직일때마다 값을 받고
                                      //false이면 마지막에 땔때 값을 한번만 받는다
        print(m_mySlider.value)
    }
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        m_myTextView.resignFirstResponder()
       // m_myTextField.resignFirstResponder()
    }
    
    
}

