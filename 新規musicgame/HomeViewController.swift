//
//  HomeViewController.swift
//  新規musicgame
//
//  Created by EriyaMurakami on 2018/02/03.
//  Copyright © 2018年 EriyaMurakami. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var inputButton:UIButton!
    @IBOutlet var playButton:UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tappedButton(sender:UIButton){
        
        if sender == playButton {
            performSegue(withIdentifier: "Play", sender: nil)
        }
        if sender == inputButton {
            performSegue(withIdentifier: "Input", sender: nil)
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var vc = segue.destination as! ViewController2
        if segue.identifier == "Input"{
            vc.seniName = "Input"
        }
        if segue.identifier == "Play"{
            vc.seniName = "Play"
        }
        
    }

}
