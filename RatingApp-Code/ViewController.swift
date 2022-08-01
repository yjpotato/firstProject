//
//  ViewController.swift
//  RatingApp-Code
//
//  Created by 정유진 on 2022/08/01.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    let titles = ["Bill Evans", "Oscar Peterson", "Dave Brubeck"]
    let subtitles = ["Tic-Tac-Toc", "Spin the Bottle", "Texas Hold'em Pocker"]
    let stars = ["4Stars","5Stars","2Stars"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: view.frame.width,
                                 height: view.frame.height)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")//셀등록
        tableView.dataSource = self//데이터를 넣어주기 위한 선언
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barButtonDidTapped(_:)))
    }

    @objc
    func barButtonDidTapped(_ sender: UIBarButtonItem){
        present(AddPlayerViewController(), animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell else {fatalError()}
        
        cell.myTitle.text = titles[indexPath.row]
        cell.myTitle.sizeToFit()
        cell.mySubTitle.text = subtitles[indexPath.row]
        cell.mySubTitle.sizeToFit()
        cell.myImageView.image = UIImage(named: stars[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
}
