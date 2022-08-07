//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Uwais Alqadri on 8/7/22.
//  Copyright © 2022 Essential Developer. All rights reserved.
//

import Foundation

internal final class FeedItemsMapper {
	private struct Root: Decodable {
		let items: [Item]

		var feed: [FeedItem] {
			return items.map(\.item)
		}
	}

	private struct Item: Decodable {
		public let id: UUID
		public let description: String?
		public let location: String?
		public let image: URL

		var item: FeedItem {
			return FeedItem(id: id, description: description, location: location, imageURL: image)
		}
	}

	private static var OK_200: Int { return 200 }

	internal static func map(_ data: Data, from response: HTTPURLResponse) -> RemoteFeedLoader.Result {
		guard response.statusCode == OK_200,
					let root = try? JSONDecoder().decode(Root.self, from: data) else {
			return .failure(.invalidData)
		}

		return .success(root.feed)
	}
}
