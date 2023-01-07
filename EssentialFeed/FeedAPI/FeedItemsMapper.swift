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
		let items: [RemoteFeedItem]
	}

	private static var OK_200: Int { return 200 }

	internal static func map(_ data: Data, from response: HTTPURLResponse) throws -> [RemoteFeedItem] {
		guard response.statusCode == OK_200,
					let root = try? JSONDecoder().decode(Root.self, from: data)
		else {
			throw RemoteFeedLoader.Error.invalidData
		}

		return root.items
	}
}
