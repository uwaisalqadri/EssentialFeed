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

		XCTAssertTrue(client.requestURLs.isEmpty)
	}

	func test_load_requestsDataFromURL() {
		let url = URL(string: "https://a-given-url.com")!
		let (sut, client) = makeSUT(url: url)

		sut.load()

		XCTAssertEqual(client.requestURLs, [url])
	}

	func test_loadTwice_requestsDataFromURLTwice() {
		let url = URL(string: "https://a-given-url.com")!
		let (sut, client) = makeSUT(url: url)

		sut.load()
		sut.load()

		XCTAssertEqual(client.requestURLs, [url, url])
	}

	func test_load_deliversErrorOnClientError() {
		let (sut, client) = makeSUT()

		var capturedErrors = [RemoteFeedLoader.Error]()
		sut.load { capturedErrors.append($0) }

		let clientError = NSError(domain: "Test", code: 0)
		client.completions[0](clientError)

		XCTAssertEqual(capturedErrors, [.connectivity])
	}


	// MARK: - Helpers

	private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
		let client = HTTPClientSpy()
		let sut = RemoteFeedLoader(url: url, client: client)
		return (sut, client)
	}

	private class HTTPClientSpy: HTTPClient {
		var requestURLs = [URL]()
		var completions = [(Error) -> Void]()

		func get(from url: URL, completion: @escaping (Error) -> Void) {
			completions.append(completion)
			requestURLs.append(url)
		}
	}

}
