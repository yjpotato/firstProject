//
//  ViewController.swift
//  Delegate-Example
//
//  Created by 정유진 on 2022/08/22.
//

import UIKit

class FirstViewController: UIViewController {
    
    let label = UILabel() //선언!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI() //선언!
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let nextVC = SecondViewController() 
        nextVC.label.text = "SecondViewController"
        nextVC.delegate = self //신호가 오면 받을겡
        present(nextVC, animated: true)
    }


}
extension FirstViewController: SecondViewControllerDelegate {
    func didDismissed(text: String) {
        label.text = text
    }
}

extension FirstViewController {
    func setUI(){
        label.text = "FirstViewcontroller"
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
