//
//  UILab
//
//  Created on 02/11/2020.
//  Copyright (c) 2020 yasinkbas. All rights reserved.
//

import UILab

class ViewController: UIViewController {
    lazy var thinBarWidth: CGFloat = self.view.bounds.width / 2 - 10
    var thinBarHeight: CGFloat = 1
    
    // MARK: - View Elements
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        label.text = "UILab"
        label.verboseName = "my_title_label"
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
        view.verboseName = "my_yellow_view"
        return view
    }()
    
    lazy var clickButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 10
        button.verboseName = "my_yellow_button"
        button.addTarget(self, action: #selector(clickedButton(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var thinWhiteBar: UIView = {
        let bar = UIView()
        bar.backgroundColor = UIColor.white
        bar.verboseName = "my_thin_white_bar"
        return bar
    }()
    
    // MARK: - View Lifecycles
    override func loadView() {
        super.loadView()
        view.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    
        view.addSubview(yellowView)
        // multiple line
        yellowView.set(.left(view.left), priority: 500)
        yellowView.set(.right(view.right))
        yellowView.set(.top(view.top))
        yellowView.set(.height(80))
        
        view.addSubview(titleLabel)
        // single line
        titleLabel.set(.bottom(yellowView.bottom, 8), .left(yellowView.left), .right(yellowView.right))
        
        view.addSubview(clickButton)
        clickButton.set(.center(view), .width(200), .height(50))
        
        // with subscript syntax
        view.addSubview(thinWhiteBar)
        var constraints = thinWhiteBar[.top(yellowView.bottom, 16), .width(thinBarWidth), .height(thinBarHeight), .centerX(yellowView.centerX)] // commit false as default
        constraints.commit = true
    }
    
    // MARK: - Actions
    @objc
    func clickedButton(_ sender: UIButton) {
        performAnimation()
    }
    
    private func performAnimation() {
        let yellowViewHeightAnchor = yellowView.get(.height).first
        let to = self.view.bounds.height * 8 / 10
        yellowViewHeightAnchor?.constant = yellowViewHeightAnchor?.constant == to ? 80 : to
        
        let clicked = yellowViewHeightAnchor?.constant == to
        
        UIView.animate(withDuration: 0.75) {
            self.view.layoutIfNeeded()
            if clicked {
                self.titleLabel.transform = CGAffineTransform(scaleX: 2, y: 2).concatenating(CGAffineTransform(translationX: 0, y: 100))
                
                if #available(iOS 11, *) {
                    self.yellowView.layer.cornerRadius = self.yellowView.bounds.width / 5
                    self.yellowView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
                }
                
            } else {
                self.titleLabel.transform = .identity
                self.yellowView.layer.cornerRadius = 0
            }
        }
        
        UIView.transition(with: titleLabel, duration: 0.2, options: .transitionFlipFromTop, animations: {
            self.titleLabel.textColor = clicked ? UIColor.white : UIColor.black
        })
        
        UIView.transition(with: clickButton, duration: 0.2, options: .transitionFlipFromTop, animations: {
            let color = clicked ? UIColor.black : UIColor.white
            self.clickButton.setTitleColor(color, for: .normal)
        })
    }
}
