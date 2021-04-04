//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Arup Sarkar on 4/3/21.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient
    let url: URL
    //default url in the init function
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    //nned a collaborator like http client
    func load() {
        //HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
        client.get(from: url) //not optional
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
        let url = URL(string: "https://a-url.com")!
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(url: url, client: client)
        //no url
        XCTAssertNil(client.requestedURL)
    }
    
    // second test
    func test_load_requestDataFromURL() {
        let url = URL(string: "https://a-given-url.com")!
        let client = HTTPClientSpy()
        //system under test sut
        let sut = RemoteFeedLoader(url: url, client: client)
        sut.load();
        //assertion
        XCTAssertEqual(client.requestedURL, url)
    }

}
