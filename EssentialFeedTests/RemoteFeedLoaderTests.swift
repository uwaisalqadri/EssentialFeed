//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Uwais Alqadri on 8/7/22.
//  Copyright © 2022 Essential Developer. All rights reserved.
//

import XCTest
import EssentialFeed

class RemoteFeedLoaderTests: XCTestCase {

	func test_init_doesNotRequestDataFromURL() {
		let (_, client) = makeSUT()

		XCTAssertNil(client.requestURL)
	}

	func test_load_requestDataFromURL() {
		let url = URL(string: "https://a-given-url.com")!
		let (sut, client) = makeSUT(url: url)

		sut.load()

		XCTAssertEqual(client.requestURL, url)
	}

	// MARK: Helpers

	private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
		let client = HTTPClientSpy()
		let sut = RemoteFeedLoader(url: url, client: client)
		return (sut, client)
	}

	private class HTTPClientSpy: HTTPClient {
		var requestURL: URL?

		func get(from url: URL) {
			requestURL = url
		}
	}

}
