//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Arup Sarkar on 4/3/21.
//

import Foundation

struct FeedItem {
    let id: UUID //Required
    let description: String? //Optional String
    let location: String? //optional
    let imageURL: URL
}
