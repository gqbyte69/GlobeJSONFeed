//
//  AnimeService.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/27/25.
//

import Foundation

final class AnimeService: AnimeServiceProtocol {
  private let api: AnimeAPI

  init(api: AnimeAPI) {
    self.api = api
  }
}

// MARK: - Methods

extension AnimeService {
  func fetchAnimes() async throws -> [Anime] {
    try await api.getAnimes()
  }
}
