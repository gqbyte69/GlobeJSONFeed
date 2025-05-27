//
//  APIClient+Anime.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/27/25.
//

import Foundation

extension API: AnimeAPI {
  func getAnimes() async throws -> [Anime] {
    let response: AnimeResponse? = try await request(
      url: "top/anime",
      method: .GET,
      parameters: ["type": "tv"],
      responseType: AnimeResponse.self
    )

    guard let response else {
      throw APIError.emptyResponse
    }

    return response.data
  }
}
