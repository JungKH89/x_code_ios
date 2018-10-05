//
//  ViewController.swift
//  ExTableViewApp
//
//  Created by 스마트금융과10 on 2018. 5. 16..
//  Copyright © 2018년 jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let testArray = ["apple", "pear", "banana", "strawberry"]
    let testArray2 = ["사과", "배", "바나나", "딸기"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "test")
        
        print(indexPath.row)
        
        cell.textLabel?.text = String(indexPath.section) + ":" + testArray[indexPath.row]
        cell.detailTextLabel?.text = testArray2[indexPath.row]
       
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

