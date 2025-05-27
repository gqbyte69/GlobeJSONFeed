//
//  AnimeCellViewModel.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/27/25.
//

import Foundation

final class AnimeCellViewModel: AnimeCellViewModelProtocol {
  private let anime: Anime

  init(anime: Anime) {
    self.anime = anime
  }
}

// MARK: - Getters

extension AnimeCellViewModel {
  var titleText: String? {
    anime.title_english
  }

  var imageURL: URL? {
    URL(string: anime.images.jpg.small_image_url)
  }
}
