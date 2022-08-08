//
//  GestureViewController.swift
//  RatingApp-Code
//
//  Created by 정유진 on 2022/08/01.
//

import UIKit

class GestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let leftGesture = UISwipeGestureRecognizer(target: self, action: #selector(didLeftSwipe(_:)))
        
        leftGesture.direction = .left
        view.addGestureRecognizer(leftGesture)
        
        let rightGesture = UISwipeGestureRecognizer(target: self, action: #selector(didRightSwipe(_:)))
        rightGesture.direction = .right
        view.addGestureRecognizer(rightGesture)

    }
    
    @objc
    func didRightSwipe(_ sender: UISwipeGestureRecognizer) {
        var touchLocation = sender.location(in: view)
        
        print(touchLocation)
        let nextVC = RightGestureViewController()
        present(nextVC, animated: true)
        
    }
    @objc
    func didLeftSwipe(_ sender: UISwipeGestureRecognizer) {
        var touchLocation = sender.location(in: view)
        
        print(touchLocation)
        let nextVC = RightGestureViewController()
        present(nextVC, animated: true)
}
}
