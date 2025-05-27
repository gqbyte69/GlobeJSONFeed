//
//  RemoteAnime.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/27/25.
//

import Foundation

struct RemoteAnimeResponse: Codable {
  let data: [Anime]
  let pagination: Pagination
}

struct RemoteAnime: Codable {
  let mal_id: Int
  let url: String
  let images: Images
  let approved: Bool
  let titles: [Title]
  let title: String
  let title_english: String
  let title_japanese: String
  let title_synonyms: [String]
  let type: String
  let source: String
  let episodes: Int
  let status: String
  let airing: Bool
  let duration: String
  let rating: String
  let score: Double
  let scored_by: Int
  let rank: Int
  let popularity: Int
  let members: Int
  let favorites: Int
  let synopsis: String
  let background: String
  let season: String
  let year: Int
  let broadcast: Broadcast
  let producers: [Producer]
  let licensors: [Licer]
  let studios: [Studio]
  let genres: [Genre]
  let explicit_genres: [Genre]
  let themes: [Genre]
  let demographics: [Genre]
}

struct Images: Codable {
  let jpg: ImageSize
  let webp: ImageSize
}

struct ImageSize: Codable {
  let image_url: String
  let small_image_url: String
  let large_image_url: String
}

struct Title: Codable {
  let type: String
  let title: String
}

struct DateComponents: Codable {
  let day: Int
  let month: Int
  let year: Int
}

struct Broadcast: Codable {
  let day: String
  let time: String
  let timezone: String
  let string: String
}

struct Producer: Codable {
  let mal_id: Int
  let type: String
  let name: String
  let url: String
}

struct Licer: Codable {
  let mal_id: Int
  let type: String
  let name: String
  let url: String
}

struct Studio: Codable {
  let mal_id: Int
  let type: String
  let name: String
  let url: String
}

struct Genre: Codable {
  let mal_id: Int
  let type: String
  let name: String
  let url: String
}

struct Pagination: Codable {
  let last_visible_page: Int
  let has_next_page: Bool
  let current_page: Int
  let items: PaginationItems
}

struct PaginationItems: Codable {
  let count: Int
  let total: Int
  let per_page: Int
}
