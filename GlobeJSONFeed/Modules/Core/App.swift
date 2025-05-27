//
//  App.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/25/25.
//

import Foundation

class App {
  static let shared = App()

  private(set) var config: AppConfigProtocol!

  private(set) var api: API!

  private(set) var anime: AnimeServiceProtocol!

  func bootstrap() {
    config = AppConfig()

    guard let url = URL(string: config.baseUrl) else {
      preconditionFailure("We should have a valid URL")
    }

    api = API(
      baseURL: url,
      version: config.version
    )

    anime = AnimeService(api: api)
  }
}
