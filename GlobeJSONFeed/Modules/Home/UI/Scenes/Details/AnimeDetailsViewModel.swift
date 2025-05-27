//
//  AnimeDetailsViewModel.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/27/25.
//

import Foundation

final class AnimeDetailsViewModel: AnimeDetailsViewModelProtocol {
  private let anime: Anime

  init(anime: Anime) {
    self.anime = anime
  }
}

// MARK: - Getters

extension AnimeDetailsViewModel {
  var titleText: String? { anime.title_english }

  var synopsisText: String? { anime.synopsis }

  var imageURL: URL? {
    URL(string: anime.images.jpg.large_image_url)
  }
}
