//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Arup Sarkar on 4/3/21.
//

import Foundation

//interface
public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (Error?, HTTPURLResponse?) -> Void)
}


public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    //default url in the init function
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    //nned a collaborator like http client
    public func load(completion: @escaping (Error) -> Void ) {
        //HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
        client.get(from: url) { error, response in
            
            if(response != nil) {
                completion(.invalidData)
            }else {
                completion(.connectivity)
            }
            
            
        }
    }
}
