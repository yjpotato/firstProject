//
//  NetworkError.swift
//  Combine-Example
//
//  Created by 정유진 on 2022/10/17.
//

import Foundation

enum NetworkError: Error {
    
    case badURL
    case badrespose
    case communicationError
    case decodeFaild
    case noData
    
}
