//
//  LocalFeedLoader.swift
//  EssentialFeed
//
//  Created by Uwais Alqadri on 1/7/23.
//  Copyright © 2023 Essential Developer. All rights reserved.
//

import Foundation

public class LocalFeedLoader {
	private let store: FeedStore
	private let currentDate: () -> Date

	public typealias SaveResult = Error?

	public init(store: FeedStore, currentDate: @escaping () -> Date) {
		self.store = store
		self.currentDate = currentDate
	}

	public func save(_ feed: [FeedImage], completion: @escaping (SaveResult) -> Void = { _ in }) {
		store.deleteCachedFeed { [weak self] error in
			guard let self = self else { return }

			if let cacheDeletionError = error {
				completion(cacheDeletionError)
			} else {
				self.cache(feed, with: completion)
			}
		}
	}

	private func cache(_ feed: [FeedImage], with completion: @escaping (SaveResult) -> Void) {
		store.insert(feed.toLocal(), timestamp: currentDate()) { [weak self] error in
			guard self != nil else { return }
			completion(error)
		}
	}
}

public extension Array where Element == FeedImage {
	func toLocal() -> [LocalFeedImage] {
		return self.map {
			LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url)
		}
	}
}
