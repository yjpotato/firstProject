//
//  ViewController.swift
//  Combine-Example
//
//  Created by 정유진 on 2022/10/17.
//
import Combine
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var quoteLabel: UILabel!
//    var content = PassthroughSubject<String, Never>()
    var cancellables = Set<AnyCancellable>()
    
    private let viewModel = ViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
        

        
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        viewModel.request()
       
    }
    func bindUI() {
        viewModel.content
            .receive(on: DispatchQueue.main)
            .map { Optional($0)}
            .assign(to: \.quoteLabel.text, on: self)
            .store(in: &cancellables)
    }
    
}
