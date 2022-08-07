//
//  RemoteFeedLoadedTests.swift
//  EssentialFeedTests
//
//  Created by Uwais Alqadri on 8/7/22.
//  Copyright © 2022 Essential Developer. All rights reserved.
//

import XCTest

class RemoteFeedLoader {

}

class HTTPClient {
	var requestURL: URL?
}

class RemoteFeedLoadedTests: XCTestCase {

	func test_init_doesNotRequestDataFromURL() {
		let client = HTTPClient()
		_ = RemoteFeedLoader()

		XCTAssertNil(client.requestURL)
	}

}
