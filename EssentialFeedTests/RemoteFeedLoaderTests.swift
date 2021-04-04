//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Arup Sarkar on 4/3/21.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    //nned a collaborator like http client
    func load() {
        //HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
        client.get(from: URL(string: "https://a-url.com")!) //not optional
    }
}
//interface
protocol HTTPClient {
    func get(from url: URL)
}

//sub class of HTTP client
class HTTPClientSpy: HTTPClient {
    
    func get(from url: URL) {
        requestedURL = url
    }
    var requestedURL: URL? //optional
}

class RemoteFeedLoaderTests: XCTestCase {
    // test initializer
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)
        //no url
        XCTAssertNil(client.requestedURL)
    }
    
    // second test
    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        //system under test sut
        let sut = RemoteFeedLoader(client: client)
        sut.load();
        //assertion
        XCTAssertNotNil(client.requestedURL)
    }

}
