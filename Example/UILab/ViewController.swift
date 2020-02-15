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
        view.layer.shadowColor = UIColor.black.cgColor
        return view
    }()
    
    lazy var clickButton: UIButton = {
        let button = UIButton()
        button.setTitle("UILab", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.yellow
        button.verboseName = "my_yellow_button"
        button.addTarget(self, action: #selector(clickedButton(_:)), for: .touchUpInside)
        return button
    }()
    
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
        let to = self.view.bounds.height * 6 / 10
        height?.constant = height?.constant == to ? 80 : to
        
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
}
