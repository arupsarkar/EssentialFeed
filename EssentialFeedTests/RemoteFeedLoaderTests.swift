//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Arup Sarkar on 4/3/21.
//

import XCTest

class RemoteFeedLoader {
    
    //nned a collaborator like http client
}

class HTTPClient {
    var requestedURL: URL? //optional
}
class RemoteFeedLoaderTests: XCTestCase {
    // test initializer
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        //system under test sut
        _ = RemoteFeedLoader()
        
        //no url
        XCTAssertNil(client.requestedURL)
        //invoke command like load
        
        //expects
        
    }

}
