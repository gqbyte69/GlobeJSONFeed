//
//  HomeViewModelProtocol.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/25/25.
//

import Foundation

protocol HomeViewModelProtocol {
  var animeCount: Int { get }

  func fetchAnimes() async throws
  func animeCellViewModel(at index: Int) -> AnimeCellViewModelProtocol
  func animeDetailsViewModel(at index: Int) -> AnimeDetailsViewModelProtocol
}
