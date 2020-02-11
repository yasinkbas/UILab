//
//  ViewController.swift
//  UILab
//
//  Created by yasinkbas on 02/11/2020.
//  Copyright (c) 2020 yasinkbas. All rights reserved.
//

import UILab

class ViewController: UIViewController {
    
    lazy var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yellow
        return view
    }()
    
    lazy var clickButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click me", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.yellow
        button.addTarget(self, action: #selector(clickedButton(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor.white
        
        view.addSubview(yellowView)
        view.addSubview(clickButton)
        yellowView.set(.left(view.left, 0), .right(view.right, 0), .top(view.top, 0), .height(80))
        clickButton.set(.center(view), .width(200), .height(50))
    }
    
    @objc
    func clickedButton(_ sender: UIButton) {
        let height = yellowView.get(.height).first
        height?.constant = height?.constant == 500 ? 80 : 500
        
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

