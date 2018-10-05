//
//  ViewController.swift
//  CoreDataEx
//
//  Created by 스마트금융과10 on 2018. 5. 4..
//  Copyright © 2018년 jung. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //저장하기 [START]-----------------------------------------------
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //access core data by manageable variable
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserData", into: context)
        newUser.setValue("경패", forKey: "username")
        newUser.setValue("1234", forKey: "password")
        
        
        do{
            try context.save()
            print("CoreData Saved")
        } catch{
            print("There was an error")
        }
        
        //저장하기 [END]-------------------------------------------------
        
        
        
        
        //읽어오기 [START]-----------------------------------------------
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
        
        //request.returnObjectsAsFaults = false
        //request.predicate = NSPredicate(format: "username = %@", "정경화")  // SELECT * FROM UserData WHERE username = "정경화"
        
        do{
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if let username = result.value(forKey: "username") as? String{
                        //print(username)
                    }
                    if let password = result.value(forKey: "password") as? String{
                        //print(password)
                    }
                    
                    //지우기 [START]-------------------------------------
                    /*
                    context.delete(result)
                    do {
                        try context.save()   //commit
                    } catch{
                        print("Delete failed")
                    }
                    */
                    //지우기 [END]---------------------------------------
                    
                    
                    //업데이트 [START]------------------------------------
                    /*
                    result.setValue("KyungHwa J", forKey: "username")
                    do{
                        try context.save()
                    } catch {
                        print("Rename failed")
                    }
                     */
                    //업데이트 [END]--------------------------------------
                    
                }
            }else{
                print("No results")
            }
        } catch {
            print("Couldn't fetch results")
        }
        
        //읽어오기 [END]--------------------------------------------------
        
        //predicate 응용 [START]-----------------------------------------
        
        let request2 = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
        
        var attributeName = "username"
        var attributeValue = "경패"
        
        request2.predicate = NSPredicate(format: "%K CONTAINS %@", attributeName, attributeValue) //SELECT * FROM UserData WHERE username = "경패"
        
        do{
            let results = try context.fetch(request2)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if let username = result.value(forKey: "username") as? String{
                        print(username)
                    }
                    if let pwd = result.value(forKey: "password") as? String{
                        print(pwd)
                    }
                }
            }
        }catch{
            print("Couldn't fetch results!!")
        }
        
        //predicate 응용 [END]-------------------------------------------
        
    }
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear called")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

