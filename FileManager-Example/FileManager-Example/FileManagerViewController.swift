//
//  FileManagerViewController.swift
//  FileManager-Example
//
//  Created by 정유진 on 2022/09/21.
//

import UIKit

class FileManagerViewController: UIViewController {
    
    let fileManager = FileManager.default

    
    @IBAction func didTapSaveButton(_ sender: UIButton) {
        save1()
    }
    
    @IBAction func didTapLoadButton(_ sender: UIButton) {
        load1()
    }

}

extension FileManagerViewController {
    
    func save() { // 그냥 외워!
        var isDirecotory: ObjCBool = true
        if fileManager.fileExists(atPath: getMyAppDirectoryPath().path, isDirectory: &isDirecotory) {
            let someString = "Hello World"
            do {
               try someString.write(to: getMyAppFilePath(), atomically: true, encoding: .utf8)
                print("파일 쓰기 성공")
            } catch {
                print("파일 쓰기 실패 :\(error)")
            }
        } else {
            do {
                try fileManager.createDirectory(atPath: getMyAppDirectoryPath().path, withIntermediateDirectories: false)
                print("폴더 생성 완료")
            } catch {
                print("폴더 생성 실패: \(error)")
            }
            
        }
    }
    func load() {
        do {
            let somestring = try String(contentsOf: getMyAppFilePath())
            print(somestring)
        }catch {
            print("파일 로드 에러: \(error)")
        }
        
        
    }
}

extension FileManagerViewController {
    
    func save1() {
            var isDirectory: ObjCBool = true
            if fileManager.fileExists(atPath: getMyAppDirectoryPath().path, isDirectory: &isDirectory) {
                let person = Person(name: "ABC", age: "111")
                do {
                    let data = try NSKeyedArchiver.archivedData(withRootObject: person, requiringSecureCoding: false)
                    do {
                        try data.write(to: getMyAppFilePath())
                        print("파일 쓰기 성공")
                    } catch {
                        print("파일 쓰기 에러: \(error)")
                    }
                } catch {
                    print("아카이브 에러: \(error)")
                }
            } else {
                do {
                    try fileManager.createDirectory(atPath: getMyAppDirectoryPath().path, withIntermediateDirectories: false)
                    print("폴더 생성 완료")
                } catch {
                    print("폴더 생성 실패: \(error)")
                }
            }
        }
    func load1() {
        do {
            let data = try Data(contentsOf: getMyAppFilePath())
            do {
                let person = try NSKeyedUnarchiver.unarchivedObject(ofClass: Person.self, from: data)
                print("언아카이브 성공: \(person?.name), \(person?.age)")
            } catch {
                print("언아카이브 에러: \(error)")
            }

        }catch {
            print("파일 로드 에러: \(error)")
        }
        
        
    }
}


extension FileManagerViewController {
    
    func getDocumentDirectioryPath() -> URL {
        let documentDirectoryPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentDirectoryPath
    }
    func getMyAppDirectoryPath() -> URL {
        let documentDirectioryPath = getDocumentDirectioryPath()
        let myAppDirectoryPath = documentDirectioryPath.appendingPathComponent("MyApp", isDirectory: true)
        return myAppDirectoryPath
    }
    func getMyAppFilePath() -> URL {
        let myAppDirectoryPath = getMyAppDirectoryPath()
        let filePath = myAppDirectoryPath.appendingPathComponent("Test.txt")
        return filePath
    }
}


class Person: NSObject, NSCoding ,NSSecureCoding { // = codable과 같은것
    //
    
    static var supportsSecureCoding: Bool = true
    
    let name: String
    let age: String
    // 인코딩
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(age, forKey: "age")
    }
    // 디코딩
    required convenience init?(coder: NSCoder) {
        let name = coder.decodeObject(forKey: "name") as! String
        let age = coder.decodeObject(forKey: "age") as! String
        self.init(name: name, age: age)
    }
    
   
    init(name: String, age: String) {
        self.name = name
        self.age = age
    }
}
