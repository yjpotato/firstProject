//
//  ViewController.swift
//  FrameAndBounds
//
//  Created by 정유진 on 2022/08/01.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        secondView.frame.origin = CGPoint(x: 50, y: 50)
    }


}

