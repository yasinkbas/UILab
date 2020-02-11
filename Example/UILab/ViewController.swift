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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor.white
        
        view.addSubview(yellowView)
        view.addSubview(clickButton)
        yellowView.set(.left(view.left, 100), .right(view.right, 100), .top(view.top, 50), .height(100))
        clickButton.set(.center(view))
    }
    
    @objc
    func clickedButton(_ sender: UIButton) {
        self.yellowView.get(.height).first?.constant = self.yellowView.get(.height).first?.constant != 500 ? 500 : 100
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

