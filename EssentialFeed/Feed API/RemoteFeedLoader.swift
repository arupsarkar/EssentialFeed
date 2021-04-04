//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Arup Sarkar on 4/3/21.
//

import Foundation

//interface
public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (Error) -> Void)
}


public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
    }
    //default url in the init function
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    //nned a collaborator like http client
    public func load(completion: @escaping (Error) -> Void = { _ in}) {
        //HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
        client.get(from: url) { error in completion(.connectivity)}
    }
}
