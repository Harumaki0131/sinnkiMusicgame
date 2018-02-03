//
//  ViewController.swift
//  新規musicgame
//
//  Created by EriyaMurakami on 2017/09/16.
//  Copyright © 2017年 EriyaMurakami. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var hanteiLabel: UILabel!
    
    @IBOutlet var hanteiLabel2: UILabel!
    
    @IBOutlet weak var poseImage: UIImageView!
    
    @IBOutlet weak var poseYameru: UIButton!
    @IBOutlet weak var poseModoru: UIButton!
    @IBOutlet weak var poseButton: UIButton!

    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
        
    var delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate //AppDelegateのインスタンスを取得
    
    
    var count: Float = 0.0
    var timer: Timer = Timer()
    
    var speed: Float = 10.0
    var targetLabel: UILabel = UILabel()
  
    
      var globalY:CGFloat!
    
    var audio:AVAudioPlayer!
    
    let sayuArray: [Int] = [0,1,0,1,0,0,1]
    
    
    var count2: Float = 0.0
    var timer2: Timer = Timer()
    
    var speed2: Float = 10.0
    var targetLabel2: UILabel = UILabel()
    
    var globalY2:CGFloat!
    
    //var audio2:AVAudioPlayer!
    
    let sayuArray2: [Int] = [0,1,0,1,0,0,1]
    
    
    
    //    var timingArray:float = [3.0,5.0,10.0]
    let timingArray: [Float] = [0.1 ]
    //いつブロックを落とすか、秒数をまとめた配列
    
    let timingArray2: [Float] = [0.89,  ]
    //いつブロックを落とすか、秒数をまとめた配列
    
    
    var timingCount:Int!
    var timingCount2 :Int!
    //timingArray内の順番を切り替える変数
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //        timingArray = []
        
        timingCount = 0
        timingCount2 = 0
        //if timer.valid {
        timer = Timer.scheduledTimer(timeInterval: 0.01,target: self,
                                                       selector: #selector(self.up),userInfo: nil,repeats: true)
        
        timer2 = Timer.scheduledTimer(timeInterval: 0.01,target: self,
                                                        selector: #selector(self.up2),userInfo: nil,repeats: true)
        //        }
        
        targetLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))// CGRectMake(0, 0, 50, 50))
        targetLabel.text = ""
        targetLabel.font = UIFont.systemFont(ofSize: 50)
        targetLabel.backgroundColor = UIColor.clear
        self.view.addSubview(targetLabel)
        
        targetLabel2 = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))// CGRectMake(0, 0, 50, 50))
        targetLabel2.text = ""
        targetLabel2.font = UIFont.systemFont(ofSize: 50)
        targetLabel2.backgroundColor = UIColor.clear
        self.view.addSubview(targetLabel2)
        
        //        let appframe: CGRect = UIScreen.mainScreen().bounds
        //speed = Float(appframe.size.height) / 1.2
        
      
     
        
        
    }
    
    //         let appframe:CGRect = UIScreen.mainScreen().bounds
    //            speed = Float(appframe.size.height) / 1.2
    
    
    
    
    func up () {
        
        count += 0.01
        
        targetLabel.text = "■"
        let appframe:CGRect = UIScreen.main.bounds
        let x = (appframe.size.width - 100) / 3 * 2 + 50
        
        //258
        
        if timingCount<timingArray.count{
            
            //        let y = CGFloat((count - 3.0 + 1.2) * speed - 75)
            //            let y = CGFloat((count - timingArray[timingCount] + 1.2) * speed - 75)
            
            let sizeY = UIScreen.main.bounds.height
            
            speed = (75+Float(sizeY))/timingArray[timingCount]
            print(speed)
            
            let y = CGFloat(speed * count - 75)
            
            print("count:\(count),timingcount:\(timingCount)")
            
            targetLabel.frame = CGRect(x: x, y: y, width: 50.0, height: 50.0)
            
            if y > sizeY{
                timingCount=timingCount+1
                count = 0
            }
            
            
            
            //        }else if timingCount==timingArray.count{
        }
        if timingCount == 5{
            //ゲーム結果画面へ画面遷移
            timer.invalidate()
            audio.stop()
            performSegue(withIdentifier: "seguetest", sender: self)
        }
        
        
        
        print("\(targetLabel.center)")
    }
    
    
    func up2 () {
        
        count2 += 0.01
        
        targetLabel2.text = "■"
        let appframe:CGRect = UIScreen.main.bounds
        let x = (appframe.size.width - 100) / 3 * 1 - 50
        
        //258
        
        if timingCount2<timingArray2.count{
            
            //        let y = CGFloat((count - 3.0 + 1.2) * speed - 75)
            //            let y = CGFloat((count - timingArray[timingCount] + 1.2) * speed - 75)
            
            let sizeY = UIScreen.main.bounds.height
            
            speed2 = (75+Float(sizeY))/timingArray2[timingCount2]
            
            let y = CGFloat(speed2 * count2 - 75)
            
            
            targetLabel2.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
            
            if y > sizeY{
                timingCount2 = timingCount2+1
                count2 = 0
            }
            
            
            
            //        }else if timingCount==timingArray.count{
        }
        if timingCount2 == 5{
            //ゲーム結果画面へ画面遷移
            timer.invalidate()
            audio.stop()
            performSegue(withIdentifier: "seguetest", sender: self)
        }
        
        
        print("\(targetLabel.center)")
    }
    
    func hantei(number: Float) -> String{
        
        
        
        if count > number - 0.02 && count < number + 0.02 {
            delegate.scoreTotal=delegate.scoreTotal+600
            return "素晴らしい!"
            
        }else if count > number - 0.10 && count < number + 0.10 {
            delegate.scoreTotal=delegate.scoreTotal+300
            return "良い!"
            
        }else {
            delegate.scoreTotal=delegate.scoreTotal+0
            return "ドンマイ"
        }
    }
    
    
    func hantei2(number: Float) -> String{
        
        
        
        if count2 > number - 0.02 && count2 < number + 0.02 {
            delegate.scoreTotal=delegate.scoreTotal+600
            return "素晴らしい!"
            
        }else if count2 > number - 0.10 && count2 < number + 0.10 {
            delegate.scoreTotal=delegate.scoreTotal+300
            return "良い!"
            
        }else {
            delegate.scoreTotal=delegate.scoreTotal+0
            return "ドンマイ"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func pushButton() {
        //        hanteiLabel.text = hantei(10.0)
        //        hanteiLabel.text = hantei(5.0)
        //        hanteiLabel.text = hantei(9.0)
        //        hanteiLabel.text = hantei(12.0)
        //
        hanteiLabel.text = hantei(number: timingArray[timingCount])
        
        
    }
    
    @IBAction func pushButton2() {
        //        hanteiLabel.text = hantei(3.0)
        //        hanteiLabel.text = hantei(5.0)
        //        hanteiLabel.text = hantei(6.0)
        //        hanteiLabel.text = hantei(7.0)
        //        hanteiLabel.text = hantei(12.0)
        //
        hanteiLabel2.text = hantei2(number: timingArray2[timingCount2])
        
    }
    
    
    @IBAction func pushpause(sender: AnyObject) {
        timer.invalidate()
        timer2.invalidate()
        audio.pause()
        
        
        poseImage.isHidden = false
        poseModoru.isHidden = false
        poseYameru.isHidden = false
               
        rightButton.isEnabled = false
        leftButton.isEnabled = false
    }
    
    @IBAction func pushmodoru(sender: AnyObject) {
        timer = Timer.scheduledTimer(timeInterval: 0.01,target: self,
                                                       selector: #selector(self.up),userInfo: nil,repeats: true)
        
        timer2 = Timer.scheduledTimer(timeInterval: 0.01,target: self,
                                                        selector: #selector(self.up2),userInfo: nil,repeats: true)
        audio.play()
        
        poseImage.isHidden = true
        poseModoru.isHidden = true
        poseYameru.isHidden = true
        
        
        rightButton.isEnabled = true
        leftButton.isEnabled = true
        
        
        
    }
    
    
}
        // Do any additional setup after loading the view.


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


