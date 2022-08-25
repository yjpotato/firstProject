//
//  SecondViewController.swift
//  Delegate-Example
//
//  Created by 정유진 on 2022/08/22.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func didDismissed(text: String)
    
}

class SecondViewController: UIViewController {
    
    let label = UILabel()
    
    weak var delegate: SecondViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        setUI()
      
    }
    deinit {
        delegate?.didDismissed(text: "Dismissed")//중요!
    }

}


extension SecondViewController {
    func setUI(){
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        

}
}
