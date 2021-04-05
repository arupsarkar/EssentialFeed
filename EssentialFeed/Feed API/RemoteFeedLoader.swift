//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Arup Sarkar on 4/3/21.
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




public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public enum Result: Equatable {
        case success ([FeedItem])
        case failure(Error)
    }
    
    //default url in the init function
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    //nned a collaborator like http client
    public func load(completion: @escaping (Result) -> Void ) {
        //HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
        client.get(from: url) { result in
            switch result {
            case let .success(data, _):
                if let _ = try?
                    JSONSerialization.jsonObject(with: data) {
                        completion(.success([]))
                }else{
                    completion(.failure(.invalidData))
                }
            case .failure:
                completion(.failure(.connectivity))
            }
        }
    }
}
