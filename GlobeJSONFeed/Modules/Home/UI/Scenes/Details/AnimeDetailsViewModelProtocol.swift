//
//  AnimeDetailsViewModelProtocol.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/27/25.
//

import Foundation

protocol AnimeDetailsViewModelProtocol {
  var titleText: String? { get }

  var genreText: String? { get }

  var studiosText: String? { get }

  var synopsisText: String? { get }

  var imageURL: URL? { get }
}
