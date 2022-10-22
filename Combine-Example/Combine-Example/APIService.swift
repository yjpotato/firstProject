//
//  APIService.swift
//  Combine-Example
//
//  Created by 정유진 on 2022/10/17.
//

import Foundation

struct APIService {
    func getquote(completion: @escaping (Result<Quote, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: URL.quote,
                                   completionHandler: {data, response, error in
            if let error = error {
                completion(.failure(.communicationError))
                print(error)
                return
            }
            if let response = response as? HTTPURLResponse,
               !(200..<300).contains(response.statusCode) {
                completion(.failure(.badrespose))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let quote = try JSONDecoder().decode(Quote.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(quote))
                }
            } catch {
                completion(.failure(.decodeFaild))
            }
            
        }).resume()
    }
        
        func getQuote() async throws -> Quote {
            let (data, reponse) = try await URLSession.shared.data(from: URL.quote)
            print(reponse)
            return try JSONDecoder().decode(Quote.self, from: data)
        }
        
        
    }

