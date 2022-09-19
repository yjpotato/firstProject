//
//  NetworkError.swift
//  Async-Await-Example
//
//  Created by 정유진 on 2022/09/19.
//

import Foundation

enum NetworkError: Error {
    case badResponse
    case communicationError
    case decodeFailed
    case noData
}
