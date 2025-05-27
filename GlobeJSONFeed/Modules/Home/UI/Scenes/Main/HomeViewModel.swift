//
//  HomeViewModel.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/25/25.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
  private let service: AnimeServiceProtocol

  private var animes: [Anime] = []

  init(
    service: AnimeServiceProtocol = App.shared.anime
  ) {
    self.service = service
  }
}

// MARK: - Methods

extension HomeViewModel {
  func fetchAnimes() async throws {
    animes = try await service.fetchAnimes()
  }

  func animeCellViewModel(at index: Int) -> AnimeCellViewModelProtocol {
    let anime = animes[index]
    return AnimeCellViewModel(anime: anime)
  }

  func animeDetailsViewModel(at index: Int) -> AnimeDetailsViewModelProtocol {
    let anime = animes[index]
    return AnimeDetailsViewModel(anime: anime)
  }
}

// MARK: - Getters

extension HomeViewModel {
  var animeCount: Int { animes.count }
}
