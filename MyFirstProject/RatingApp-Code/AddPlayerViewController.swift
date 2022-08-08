//
//  AddPlayerViewController.swift
//  RatingApp-Code
//
//  Created by 정유진 on 2022/08/01.
//

import UIKit

class AddPlayerViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    
    lazy var cancelBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapBarButtonItem(_:)))
    
    lazy var doneBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapBarButtonItem(_:)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add Player"
        cancelBarButtonItem.tag = 0
        doneBarButtonItem.tag = 1
        navigationItem.leftBarButtonItem = cancelBarButtonItem
        navigationItem.rightBarButtonItem = doneBarButtonItem
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AddPlyaerTextFieldTableViewCell.self, forCellReuseIdentifier: AddPlyaerTextFieldTableViewCell.identifier)
        
    }
    
@objc
    func didTapBarButtonItem(_ sender: UIBarButtonItem){
        switch sender {
        case cancelBarButtonItem:
            print("Cancle")
        case doneBarButtonItem:
            print("Done")
        default:
            fatalError()
        }
        
    }
   

}
extension AddPlayerViewController: UITableViewDataSource {
    //section의 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    //section title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Plyaer Name"
        }
        return nil
    }// 각 Row의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddPlyaerTextFieldTableViewCell.identifier,
        for: indexPath) as?
        AddPlyaerTextFieldTableViewCell else { fatalError()
            
        }
        
            return cell
        }else {
            let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
            var content = cell.defaultContentConfiguration()
            content.text = "Game"
            content.secondaryText = "Detail"
            content.secondaryTextProperties.color = .black
            content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 14)
            cell.contentConfiguration = content
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
            
    
            return cell
        }
        
        
    }
}

extension AddPlayerViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
        guard indexPath.section == 1 else {return}
        let nextVC = GameSelectionViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
