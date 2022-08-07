//
//  RemoteFeedLoadedTests.swift
//  EssentialFeedTests
//
//  Created by Uwais Alqadri on 8/7/22.
//  Copyright © 2022 Essential Developer. All rights reserved.
//

import XCTest

class RemoteFeedLoader {

	func load() {
		HTTPClient.shared.requestURL = URL(string: "https://a-url.com")
	}
}

class HTTPClient {
	static let shared = HTTPClient()

	private init() {}

	var requestURL: URL?
}

class RemoteFeedLoadedTests: XCTestCase {

	func test_init_doesNotRequestDataFromURL() {
		let client = HTTPClient.shared
		_ = RemoteFeedLoader()

		XCTAssertNil(client.requestURL)
	}

	func test_load_requestDataFromURL() {
		let client = HTTPClient.shared
		let sut = RemoteFeedLoader()

		sut.load()

		XCTAssertNotNil(client.requestURL)
	}
}
