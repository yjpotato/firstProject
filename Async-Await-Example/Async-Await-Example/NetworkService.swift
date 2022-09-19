//
//  NetworkService.swift
//  Async-Await-Example
//
//  Created by 정유진 on 2022/09/19.
//

import Foundation

class NetworkService {
    
    let url = URL(string: "https://api.quotable.io/random")!
    
    static let shared = NetworkService()
    
    private init() {}
    
    func getQuote(completion: @escaping (Result<String, NetworkError>) -> Void) -> String{
        var result = "Test" //1
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error  = error {
                print(error)
                completion(.failure(.communicationError))
                return
        }
            if let response = response as? HTTPURLResponse,
               !(200..<300).contains(response.statusCode){
                completion(.failure(.badResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return}
            do {
                let quote = try JSONDecoder().decode(Quote.self, from: data)
                print(quote)
                result = quote.content //2
                completion(.success(result))
            }catch {
                print(error)
                completion(.failure(.decodeFailed))
            }

        }.resume()
        return result //3
       
    }
    
    func continueationGetQuote() async -> String {
        return await withCheckedContinuation { continueation in
            getQuote { result in
                switch result {
                case .success(let quote):
                    continueation.resume(returning: quote) //resume은 한번만!!!
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    func getQuote() async -> String{
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            if let response = response as? HTTPURLResponse,
               !(200..<300).contains(response.statusCode){
                return "응답 에러"
            }
            let quote = try JSONDecoder().decode(Quote.self, from: data)
            return quote.content
        }catch {
            return "Decode 에러"
            
        }
        
    }
    func getQuotes() async -> [String]{
        async let firstQuote = getQuote()
        async let secondQuote = getQuote()
        async let thirdQuote = getQuote()

        return await [firstQuote,secondQuote,thirdQuote]
        
    }
    func getQuotes1() async -> [String] {
        let firstQuote = await getQuote() //1
        let secondQuote = await getQuote() //2
        let thirdQuote = await getQuote() //3
        return [firstQuote,secondQuote,thirdQuote]
    }
}



