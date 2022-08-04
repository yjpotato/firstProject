//
//  SecondViewController.swift
//  Comporent-Starter
//
//  Created by 정유진 on 2022/08/03.
//

import UIKit

class SecondViewController: UIViewController {
    let label = UILabel()
    let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(label)
        label.frame = CGRect(x: view.frame.midX - 100, y: view.frame.midY - 20, width: 200, height: 40)
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.borderWidth = 0.5
        label.layer.cornerRadius = 4
        
        view.addSubview(button)
        button.setTitle("Alert", for: .normal)
        button.sizeToFit()
        let buttonWidth = button.frame.width
        button.frame.origin = CGPoint(x: view.frame.midX - buttonWidth / 2, y: view.frame.midY + 40)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
      
    }
    @objc
    func didTapButton(_ sender: UIButton){
        let alertController = UIAlertController(title: "경고", message: "마지막 화면 입니다.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel,
                                         handler: { _ in
            print(alertController.textFields?.first?.text)
            print("취소 버튼이 눌렸습니다")
            
        })
        let confirmAction = UIAlertAction(title: "확인",
                                           style: .destructive)
        
        alertController.addTextField(configurationHandler: {
            textfield in textfield.keyboardType = .numberPad
        })
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
        
    }
    
}
