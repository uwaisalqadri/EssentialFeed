//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Uwais Alqadri on 8/4/22.
//  Copyright © 2022 Essential Developer. All rights reserved.
//

import Foundation

enum LoadFeedResult {
	case success([FeedItem])
	case error(Error)
}

protocol FeedLoader {
	func load(completion: @escaping (LoadFeedResult) -> Void)
}
