//
//  ViewController2.swift
//  新規musicgame
//
//  Created by EriyaMurakami on 2018/01/06.
//  Copyright © 2018年 EriyaMurakami. All rights reserved.
//

import UIKit


class ViewController2: UIViewController, UITableViewDataSource{
    
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        table.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tabelView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
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
        
        return cell!
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


