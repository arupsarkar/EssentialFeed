//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Arup Sarkar on 4/3/21.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

//extension LoadFeedResult: Equatable where Error: Equatable {}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
