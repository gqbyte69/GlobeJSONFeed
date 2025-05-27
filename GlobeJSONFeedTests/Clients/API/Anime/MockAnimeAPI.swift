//
//  MockAnimeAPI.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/27/25.
//

import Foundation

@testable import GlobeJSONFeed

final class MockAnimeAPI: AnimeAPI {
  var shouldThrowError: Bool = false
  var mockAnime: Anime?

  private(set) var getAnimesCallCount: Int = 0
}

// MARK: - Methods

extension MockAnimeAPI {
  func getAnimes() throws -> [Anime] {
    getAnimesCallCount += 1

    if shouldThrowError {
      throw APIError.emptyResponse
    }

    guard let anime = mockAnime else {
      throw APIError.emptyResponse
    }

    return [anime]
  }
}
