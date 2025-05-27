//
//  AnimeServiceProtocol.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/27/25.
//

import Foundation

protocol AnimeServiceProtocol {
  func fetchAnimes() async throws -> [Anime]
}
