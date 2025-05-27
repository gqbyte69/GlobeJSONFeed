//
//  MockAnimeService.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/27/25.
//

import Foundation

@testable import GlobeJSONFeed

final class MockAnimeService: AnimeServiceProtocol {
  var shouldThrowError: Bool = false
  var responseAnime: Anime?

  private(set) var fetchAnimesCallCount: Int = 0
}

// MARK: - Methods

extension MockAnimeService {
  func fetchAnimes() async throws -> [Anime] {
    fetchAnimesCallCount += 1

    if shouldThrowError {
      throw APIError.emptyResponse
    }

    if let responseAnime {
      return [responseAnime]
    } else {
      return [Anime.dummy()]
      return []
    }
  }
}
