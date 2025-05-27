//
//  AppConfig.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/25/25.
//

protocol AppConfigProtocol {
  var baseUrl: String { get }
  var version: String { get }
}

struct AppConfig: AppConfigProtocol {
//  var baseUrl: String { "https://dogapi.dog/api/" }
  var baseUrl: String { "https://api.jikan.moe/" }
  var version: String { "v4/" }
}
