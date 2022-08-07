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
		HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
	}
}

class HTTPClient {
	static var shared = HTTPClient()

	func get(from url: URL) {}
}

class HTTPClientSpy: HTTPClient {
	override func get(from url: URL) {
		requestURL = url
	}

	var requestURL: URL?
}

class RemoteFeedLoadedTests: XCTestCase {

	func test_init_doesNotRequestDataFromURL() {
		let client = HTTPClientSpy()
		HTTPClient.shared = client
		_ = RemoteFeedLoader()

		XCTAssertNil(client.requestURL)
	}

	func test_load_requestDataFromURL() {
		let client = HTTPClientSpy()
		HTTPClient.shared = client
		let sut = RemoteFeedLoader()

		sut.load()

		XCTAssertNotNil(client.requestURL)
	}
}
