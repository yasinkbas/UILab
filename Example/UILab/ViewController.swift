//
//  ViewController.swift
//  UILab
//
//  Created by yasinkbas on 02/11/2020.
//  Copyright (c) 2020 yasinkbas. All rights reserved.
//

import UILab

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor.white
        
        let yellowView = UIView()
        yellowView.backgroundColor = UIColor.yellow
        
        view.addSubview(yellowView)
        yellowView.equalToSuper(.top(20),.right(20),.bottom(20),.left(20))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

