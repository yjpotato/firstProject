//
//  ViewController.swift
//  Comporent-Starter
//
//  Created by 정유진 on 2022/08/03.
//

import UIKit

class ViewController: UIViewController {
    
    let textField = UITextField()
    let button = UIButton(type: .system)
    let stepper = UIStepper(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Title"
//        navigationItem.title = "New title"
        let image = UIImage(systemName: "gamecontroller")
        let imageView = UIImageView(image: image)
        navigationItem.titleView = imageView
        
        view.addSubview(stepper)
        view.addSubview(textField)
        view.addSubview(button)
        textField.frame = CGRect(x: view.frame.midX - 100, y: view.frame.midY - 30, width: 200, height: 40)
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 4
         
        
        //button.frame = CGRect(x: view.frame.midX, y: view.frame.midY + 100, width: 0, height: 0)
        button.setTitle("Next", for: .normal)
        button.sizeToFit()
        let buttonWidth = button.frame.width
        button.frame.origin = CGPoint(x: view.frame.midX - buttonWidth / 2, y: view.frame.midY + 40)
        button.addTarget(self, action: #selector(didTabButton(_:)), for: .touchUpInside)
        let stepperWidth = stepper.frame.width
        stepper.frame.origin = CGPoint(x: view.frame.midX - stepperWidth / 2, y: view.frame.midY - 100)
        stepper.stepValue = 2
        stepper.autorepeat = true
    
        stepper.addTarget(self, action: #selector(didTapStepper(_:)), for: .valueChanged)
    }
@objc
func didTabButton(_ sender: UIButton){
    let nextVC = SecondViewController()
    nextVC.label.text = textField.text ?? ""
    present(nextVC, animated: true)
        
    }
@objc
    func didTapStepper(_ sender: UIStepper){
        print(sender.value)
        textField.text = String(sender.value)
    }
}

//Delegate Pattern
extension ViewController: UITextViewDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(textField.text?.count)
        
        return false
    }
    
}
