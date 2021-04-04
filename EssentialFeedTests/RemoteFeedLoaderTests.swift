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
    // test method naming convention
    //test_method-testing_behaviour-we-expect
    func test_init_doesNotRequestDataFromURL() {
        let(_, client) = makeSUT()
        //no url
        XCTAssertTrue(client.requestedURLs.isEmpty)
    }
    
    // second test
    func test_load_requestsDataFromURL() {
        let url = URL(string: "https://a-given-url.com")!
        //system under test sut
        let (sut, client) = makeSUT(url: url)
        sut.load();
        //assertion
        XCTAssertEqual(client.requestedURLs, [url])
    }
    
    func test_loadTwice_requestsDataFromURLTwice() {
        let url = URL(string: "https://a-given-url.com")!
        //system under test sut
        let (sut, client) = makeSUT(url: url)
        sut.load();
        sut.load()
        //assertion
        XCTAssertEqual(client.requestedURLs, [url, url])
    }
    
    
    func test_load_deliversErrorOnClientError() {
        let (sut, client) = makeSUT()
        client.error = NSError(domain: "Test", code: 0)
        var capturedErrors = [RemoteFeedLoader.Error]()
        sut.load { capturedErrors.append($0) }
        XCTAssertEqual(capturedErrors, [.connectivity])
    }
    
    // MARK: - Helpers
    
    //create a factory method, which will return a RemoteFeedLoader
    //returning a tuple
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return(sut, client)
    }
    
    //sub class of HTTP client
    private class HTTPClientSpy: HTTPClient {
        var requestedURLs = [URL]()
        var error: Error?
        func get(from url: URL, completion: @escaping (Error) -> Void) {
            if let error = error {
                completion(error)
            }
            requestedURLs.append(url)
        }
    }

}
