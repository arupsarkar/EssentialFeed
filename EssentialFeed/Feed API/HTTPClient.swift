//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Arup Sarkar on 4/6/21.
//

import Foundation


public enum HTTPClientResult {
    case success (Data, HTTPURLResponse)
    case failure (Error)
}

//interface
public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
