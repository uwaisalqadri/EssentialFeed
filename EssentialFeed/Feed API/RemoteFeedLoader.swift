//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Uwais Alqadri on 8/7/22.
//  Copyright © 2022 Essential Developer. All rights reserved.
//

import Foundation

public protocol HTTPClient {
	func get(from url: URL)
}

public final class RemoteFeedLoader {
	private let url: URL
	private let client: HTTPClient

	public init(url: URL, client: HTTPClient) {
		self.url = url
		self.client = client
	}

	public func load() {
		client.get(from: url)
	}
}
