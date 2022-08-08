//
//  GameSelectionViewController.swift
//  RatingApp-Code
//
//  Created by 정유진 on 2022/08/08.
//

import UIKit

class GameSelectionViewController: UIViewController {
    
    let tableView = UITableView()
    let games = ["Angry Bird", "Chess", "Russian Rullet", "Spin the Bottle", "Texas Hold'em Poker", "Tic-Tac-Toc"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self //연결작업을 도와줌!
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    }
    
 

}
extension GameSelectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count //개수
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = games[indexPath.row]
        cell.contentConfiguration = content
        cell.selectionStyle = .none
        return cell //위에 만들어준걸 설정해준당
        
    }
}

extension GameSelectionViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print(indexPath)
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }
}
