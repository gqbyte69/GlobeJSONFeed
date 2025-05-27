//
//  AnimeAPI.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/27/25.
//

import Foundation

protocol AnimeAPI {
  func getAnimes() async throws -> [Anime]
}
