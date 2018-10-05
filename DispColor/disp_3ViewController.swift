//
//  disp_3ViewController.swift
//  DispColor
//
//  Created by 스마트금융과10 on 2018. 5. 1..
//  Copyright © 2018년 jung. All rights reserved.
//

import UIKit

class disp_3ViewController: UIViewController {

    @IBOutlet weak var m_btn: UIButton!
    var color_r = 0
    var color_g = 0
    var color_b = 0
    var isHidden:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(color_r)
        print(color_g)
        print(color_b)
        
        let backColor = UIColor(red: CGFloat(color_r)/256.0, green: CGFloat(color_g)/256.0, blue: CGFloat(color_b)/256.0, alpha: 1.0)
        
        view.backgroundColor = backColor
        
        if(isHidden == true){
            m_btn.isHidden = true
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
