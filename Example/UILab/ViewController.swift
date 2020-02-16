//
//  ViewController.swift
//  UILab
//
//  Created by yasinkbas on 02/11/2020.
//  Copyright (c) 2020 yasinkbas. All rights reserved.
//

// Explanation //
// (1)
// (2)
// (3)
// (4)
// (5)

import UILab

class ViewController: UIViewController {
    
    lazy var thinBarWidth: CGFloat = self.view.bounds.width / 2 - 10
    lazy var thinBarHeight: CGFloat = 1
    
    // MARK: - set view objects basically
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = label.font.withSize(16)
        label.textAlignment = .center
        label.text = "UILab"
        label.verboseName = "my_title_label" // (1)
        return label
    }()
    
    lazy var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yellow
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.layer.shouldRasterize = false
        view.verboseName = "my_yellow_view" // (1)
        return view
    }()
    
    lazy var clickButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 10
        button.verboseName = "my_yellow_button" // (1)
        button.addTarget(self, action: #selector(clickedButton(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var thinWhiteBar: UIView = {
        let bar = UIView()
        bar.backgroundColor = UIColor.white
        bar.verboseName = "my_thin_white_bar" // (1)
        return bar
    }()
    
    // MARK: - loadView
    override func loadView() {
        super.loadView()
        view.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        view.addSubview(yellowView)
        view.addSubview(titleLabel)
        view.addSubview(clickButton)
        view.addSubview(thinWhiteBar)
        
        setConstraints()
    }
    
    // MARK: - setup initial constraints
    func setConstraints() {
        // (2)
        yellowView.set(
            .left(view.left),
            .right(view.right),
            .top(view.top),
            .height(80)
        )
        
        // (3)
        titleLabel.set(
            .bottom(yellowView.bottom, 8),
            .left(yellowView.left),
            .right(yellowView.right)
        )
        
        // (4)
        clickButton.set(
            .center(view),
            .width(200),
            .height(50)
        )
        
        // (5)
        thinWhiteBar.set(
            .top(yellowView.bottom, 16),
            .width(thinBarWidth),
            .height(thinBarHeight),
            .centerX(yellowView.centerX)
        )
    }
    
    // MARK: - button target
    @objc
    func clickedButton(_ sender: UIButton) {
        let height = yellowView.get(.height).first // (6)
        let to = self.view.bounds.height * 8 / 10
        height?.constant = height?.constant == to ? 80 : to
        
        let clicked = height?.constant == to
        
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
            self.titleLabel.transform = clicked ?
                CGAffineTransform(scaleX: 2, y: 2).concatenating(CGAffineTransform(translationX: 0, y: 100)) : .identity
        }
        
        
        UIView.transition(with: titleLabel, duration: 0.2, options: .transitionFlipFromTop, animations: {
            self.titleLabel.textColor = clicked ? UIColor.white : UIColor.black
        })
        
        UIView.transition(with: clickButton, duration: 0.2, options: .transitionFlipFromTop, animations: {
            clicked ?
                self.clickButton.setTitleColor(UIColor.black, for: .normal) :
                self.clickButton.setTitleColor(UIColor.white, for: .normal)
        })
        
        if clicked {
            self.yellowView.roundCorners([.bottomLeft, .bottomRight], radius: self.yellowView.bounds.width / 2)
        }
    }
}

// MARK: - extension
extension UIView {
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
