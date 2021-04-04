//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Arup Sarkar on 4/3/21.
//

import XCTest
import EssentialFeed

class RemoteFeedLoaderTests: XCTestCase {
    // test initializer
    func test_init_doesNotRequestDataFromURL() {
        let(_, client) = makeSUT()
        //no url
        XCTAssertNil(client.requestedURL)
    }
    
    // second test
    func test_load_requestDataFromURL() {
        let url = URL(string: "https://a-given-url.com")!
        //system under test sut
        let (sut, client) = makeSUT(url: url)
        sut.load();
        //assertion
        XCTAssertEqual(client.requestedURL, url)
    }
    
    //create a factory method, which will return a RemoteFeedLoader
    //returning a tuple
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return(sut, client)
    }
    
    //sub class of HTTP client
    private class HTTPClientSpy: HTTPClient {
        var requestedURL: URL? //optional
        func get(from url: URL) {
            requestedURL = url
        }
    }

}
