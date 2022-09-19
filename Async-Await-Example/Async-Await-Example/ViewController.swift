//
//  ViewController.swift
//  Async-Await-Example
//
//  Created by 정유진 on 2022/09/19.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    /*    let result = NetworkService.shared.getQuote { result in
            switch result {
            case .success(let quote):
                print("Escaping: \(quote)")
            case .failure(let error):
                NetworkError
          
        
        }*/
        Task {
            print(await NetworkService.shared.continueationGetQuote())

        }
        
    }
    
}




