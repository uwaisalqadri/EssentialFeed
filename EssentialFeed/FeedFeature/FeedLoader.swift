//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Uwais Alqadri on 8/4/22.
//  Copyright © 2022 Essential Developer. All rights reserved.
//

import Foundation

public enum LoadFeedResult<Error: Swift.Error> {
	case success([FeedItem])
	case failure(Error)
}

protocol FeedLoader {
	associatedtype Error: Swift.Error

	func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
