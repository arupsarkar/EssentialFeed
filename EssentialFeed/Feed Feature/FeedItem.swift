//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Arup Sarkar on 4/3/21.
//

import Foundation

public struct FeedItem: Equatable {
    public let id: UUID //Required
    public let description: String? //Optional String
    public let location: String? //optional
    public let imageURL: URL
    
    public init(id: UUID, description: String?, location: String?, imageURL: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.imageURL = imageURL
    }
}
