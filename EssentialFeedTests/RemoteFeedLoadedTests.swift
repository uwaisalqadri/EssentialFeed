//
//  RemoteFeedLoadedTests.swift
//  EssentialFeedTests
//
//  Created by Uwais Alqadri on 8/7/22.
//  Copyright © 2022 Essential Developer. All rights reserved.
//

import XCTest

class RemoteFeedLoader {
	let client: HTTPClient

	init(client: HTTPClient) {
		self.client = client
	}

	func load() {
		client.get(from: URL(string: "https://a-url.com")!)
	}
}

protocol HTTPClient {
	func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
	func get(from url: URL) {
		requestURL = url
	}

	var requestURL: URL?
}

class RemoteFeedLoadedTests: XCTestCase {

	func test_init_doesNotRequestDataFromURL() {
		let client = HTTPClientSpy()
		_ = RemoteFeedLoader(client: client)

		XCTAssertNil(client.requestURL)
	}

	func test_load_requestDataFromURL() {
		let client = HTTPClientSpy()
		let sut = RemoteFeedLoader(client: client)

		sut.load()

		XCTAssertNotNil(client.requestURL)
	}
}
