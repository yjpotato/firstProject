//
//  ViewController.swift
//  MyFirstProject
//
//  Created by 정유진 on 2022/07/25.
//

import UIKit

class ViewController: UIViewController {

    let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.setTitle("버튼", for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        button.sizeToFit()
        let widthAdjustment = button.frame.width/2
        let heightAdjustment = button.frame.height/2
        //버튼 바깥 사이즈!
        button.frame.origin = CGPoint(x: view.frame.midX - widthAdjustment,
                                      y: view.frame.midY - heightAdjustment)
       
        //button.frame.size = CGSize(width: 100, height: 100)
       // button.frame.origin = CGPoint(x: view.frame.midX,
                               //       y: view.frame.midY)
      
        
    }
    
    @objc
    func didTapButton(_ sender: UIButton) {
        print("Button Tapped")
    }

}

