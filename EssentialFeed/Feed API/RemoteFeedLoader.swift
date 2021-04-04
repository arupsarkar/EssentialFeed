//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Arup Sarkar on 4/3/21.
//

import Foundation

//interface
public protocol HTTPClient {
    func get(from url: URL)
}


public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    //default url in the init function
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    //nned a collaborator like http client
    public func load() {
        //HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
        client.get(from: url) //not optional
    }
}
