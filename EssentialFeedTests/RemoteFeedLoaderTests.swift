//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Arup Sarkar on 4/3/21.
//

import XCTest

class RemoteFeedLoader {
    //nned a collaborator like http client
    func load() {
        //HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!) //not optional
    }
}
// singleton: single point of access
class HTTPClient {
    // instead of var, using let would make it singleton
    // var would allow it to become global var
    static var shared = HTTPClient()
    
    //private initializer not needed if not a singleton
//    private init() {}
    
    func get(from url: URL) {}
}

//sub class of HTTP client
class HTTPClientSpy: HTTPClient {
    
    override func get(from url: URL) {
        requestedURL = url
    }
    var requestedURL: URL? //optional
}

class RemoteFeedLoaderTests: XCTestCase {
    // test initializer
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        //override the shared property
        HTTPClient.shared = client
        _ = RemoteFeedLoader()
        //no url
        XCTAssertNil(client.requestedURL)
    }
    
    // second test
    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        //system under test sut
        let sut = RemoteFeedLoader()
        sut.load();
        //assertion
        XCTAssertNotNil(client.requestedURL)
    }

}
