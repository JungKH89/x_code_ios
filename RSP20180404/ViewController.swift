//
//  ViewController.swift
//  RSP20180404
//
//  Created by 스마트금융과10 on 2018. 4. 4..
//  Copyright © 2018년 jung. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    let randomSource=GKARC4RandomSource()
    var m_playerWin=0
    var m_computerWin=0
    
    @IBOutlet weak var computerImageView: UIImageView!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var playerWinLabel: UILabel!
    
    @IBOutlet weak var computerWinLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let angle:CGFloat = CGFloat((180.0 * Double.pi) / 180.0)
        print("radian angle= ",angle)
        computerImageView.transform=CGAffineTransform(rotationAngle: angle)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapScissors() {
        playerImageView.image=UIImage(named: "scissors.png")
        doComputer(player: 0)
    }
    
    @IBAction func tapRock() {
        playerImageView.image=UIImage(named: "rock.png")
        doComputer(player: 1)
    }
    
    @IBAction func tapPaper() {
        playerImageView.image=UIImage(named: "paper.png")
        doComputer(player: 2)
    }
    
    func doComputer(player: Int){
        let computer = randomSource.nextInt(upperBound: 3)
        var msg=""
        switch computer {
        case 0:
            computerImageView.image=UIImage(named: "scissors.png")
            switch player{
            case 0:
                msg="비겼습니다."
            case 1:
                msg="이겼습니다."
            case 2:
                msg="졌습니다."
            default:
                break
            }
        case 1:
            computerImageView.image=UIImage(named: "rock.png")
            switch player{
            case 0:
                msg="졌습니다."
            case 1:
                msg="비겼습니다."
            case 2:
                msg="이겼습니다."
            default:
                break
            }
        case 2:
            computerImageView.image=UIImage(named: "paper.png")
            switch player{
            case 0:
                msg="이겼습니다."
            case 1:
                msg="졌습니다."
            case 2:
                msg="비겼습니다."
            default:
                break
            }
            
        default:
            break
        }
        
        resultLabel.text=msg
    }
    
}



