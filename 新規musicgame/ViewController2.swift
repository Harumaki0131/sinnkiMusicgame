//
//  ViewController2.swift
//  新規musicgame
//
//  Created by EriyaMurakami on 2018/01/06.
//  Copyright © 2018年 EriyaMurakami. All rights reserved.
//

import UIKit


class ViewController2: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var songNameArray = [String]()
    
    var sendSongName:String!
    
    var seniName:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        table.dataSource = self
        table.delegate = self
        

        songNameArray = ["[作業用BGM]果てしない道","old Gold","shakiujiiparl"]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tabelView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: indexPath) -> UITableViewCell {
//        let cell = tableView.depueueReusableCell(withIndentifier: "cell")
//
//        cell?.textLabel.text ="テスト"
//
//        return cell!
//
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "test"
        
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました")
        sendSongName = songNameArray[indexPath.row]
        
        if seniName == "Input"{
            performSegue(withIdentifier: "toInput", sender: nil)
        }
        if seniName == "Play"{
            performSegue(withIdentifier: "toPlay", sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toInput"{
            var vc = segue.destination as! InputViewController
            vc.audioName = sendSongName
        }
        
        if segue.identifier == "toPlay"{
            var vc = segue.destination as! PlayViewController
            vc.audioName = sendSongName
        }
        
        
    }
}
    

    

    

    /*
    // MARK: - Nagation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


