//
//  ViewController.swift
//  AreaAlarm
//
//  Created by Mengxuan Chen on 2018/9/14.
//  Copyright © 2018年 Mengxuan Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let areaView = AreaView(frame: CGRect(x: 10, y: 10, width: 300, height: 500))
        areaView.backgroundColor = UIColor.green
        view.addSubview(areaView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

