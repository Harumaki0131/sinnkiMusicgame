//
//  scoreViewController.swift
//  新規musicgame
//
//  Created by EriyaMurakami on 2017/09/16.
//  Copyright © 2017年 EriyaMurakami. All rights reserved.
//

import UIKit

class scoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
            
            var number: Int = 0
            var scorelabel: UILabel!
            
            func viewDidLoad(){
                //画面が最初に起動したときに呼び出される
                super.viewDidLoad()
                var delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                //        delegate.scoreTotal
                scorelabel.text = String(delegate.scoreTotal)
                
                // Do any additional setup after loading the view.
            
                
            }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
