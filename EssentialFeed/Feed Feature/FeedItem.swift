//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Uwais Alqadri on 8/4/22.
//  Copyright © 2022 Essential Developer. All rights reserved.
//

import Foundation

public struct FeedItem: Equatable {
	let id: UUID
	let description: String?
	let location: String?
	let imageURL: URL
}
