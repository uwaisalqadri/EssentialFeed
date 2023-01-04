//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Uwais Alqadri on 1/4/23.
//  Copyright © 2023 Essential Developer. All rights reserved.
//

import XCTest

class LocalFeedLoader {
	init(store: FeedStore) {

	}
}

class FeedStore {
	var deleteCachedFeedCallCount = 0
}

class CacheFeedUseCaseTests: XCTestCase {

	func test_init_doesNotDeleteCacheUponCreation() {
		let store = FeedStore()
		_ = LocalFeedLoader(store: store)

		XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
	}
}
