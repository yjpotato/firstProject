//
//  ViewController.swift
//  FileManager-Example
//
//  Created by 정유진 on 2022/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    let userDefault = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    @IBAction func didTapSaveButton(_ sender: UIButton) {
        save() //함수호출
            }
    @IBAction func didTapLoadButton(_ sender: UIButton) {
        load()  //함수호출
        print(#function)
    }
    
    
}
extension ViewController {
    func save() {
        let restaurant = Restaurant(name: "활어세꼬시", owner: "쿵야")
        do {
            let encodedData = try JSONEncoder().encode(restaurant)
            userDefault.set(encodedData,forKey: "restaurant")
            print("Save")
        } catch {
            print("Save Failed: \(error)")
        }

    }
    func load() {
        guard let object = userDefault.data(forKey: "restaurant") else {return}
        do {
            let decodedObject = try JSONDecoder().decode(Restaurant.self, from: object)
            print("Load", decodedObject.name)
        } catch {
            print("Decode Failed:\(error) ")
        }
       
    }
    
}

struct Restaurant: Codable {
    let name: String
    let owner: String
    
    init(name: String, owner: String) {
        self.name = name
        self.owner = owner
    }
}








