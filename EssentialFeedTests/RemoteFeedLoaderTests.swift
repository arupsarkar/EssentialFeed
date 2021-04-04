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
        HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
    }
}
// singleton: single point of access
class HTTPClient {
    static let shared = HTTPClient()
    
    //private initializer
    private init() {}
    var requestedURL: URL? //optional
}
class RemoteFeedLoaderTests: XCTestCase {
    // test initializer
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.shared
        _ = RemoteFeedLoader()
        //no url
        XCTAssertNil(client.requestedURL)
    }
    
    // second test
    func test_load_requestDataFromURL() {
        let client = HTTPClient.shared
        //system under test sut
        let sut = RemoteFeedLoader()
        sut.load();
        //assertion
        XCTAssertNotNil(client.requestedURL)
    }

}
