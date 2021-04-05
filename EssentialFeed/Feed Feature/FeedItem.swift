//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Arup Sarkar on 4/3/21.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID //Required
    let description: String? //Optional String
    let location: String? //optional
    let imageURL: URL
}
