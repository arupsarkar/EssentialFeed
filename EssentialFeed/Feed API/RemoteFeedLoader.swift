//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Arup Sarkar on 4/3/21.
//

import Foundation





public final class RemoteFeedLoader: FeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
        
    public typealias Result = LoadFeedResult
    
    //default url in the init function
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    //nned a collaborator like http client
    public func load(completion: @escaping (Result) -> Void ) {
        client.get(from: url) {[weak self] result in
            
            guard self != nil else { return }
            
            switch result {
            case let .success(data, response):
                completion(FeedItemsMapper.map(data, from: response))
            case .failure:
                completion(.failure(Error.connectivity))
            }
        }
    }
}


