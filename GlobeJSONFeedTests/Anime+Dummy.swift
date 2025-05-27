//
//  Anime+Dummy.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/27/25.
//

import Foundation

@testable import GlobeJSONFeed

extension Anime {
  static func dummy(
    title: String? = nil,
    synopsis: String? = nil
  ) -> Anime {
    Anime(
      mal_id: 12345,
      url: "https://myanimelist.net/anime/12345/Example_Anime",
      images: Images(
        jpg: ImageSize(
          image_url: "https://cdn.example.com/images/anime12345.jpg",
          small_image_url: "https://cdn.example.com/images/anime12345_small.jpg",
          large_image_url: "https://cdn.example.com/images/anime12345_large.jpg"
        ),
        webp: ImageSize(
          image_url: "https://cdn.example.com/images/anime12345.webp",
          small_image_url: "https://cdn.example.com/images/anime12345_small.webp",
          large_image_url: "https://cdn.example.com/images/anime12345_large.webp"
        )
      ),
      approved: true,
      titles: [
        Title(type: "main", title: "Example Anime"),
        Title(type: "synonym", title: "ExAnime")
      ],
      title: "Example Anime",
      title_english: title ?? "Example English Title",
      title_japanese: "エグザンプルアニメ",
      title_synonyms: ["ExAnime", "SampleAnime"],
      type: "TV",
      source: "Manga",
      episodes: 24,
      status: "Finished Airing",
      airing: false,
      duration: "24 min per ep",
      rating: "PG-13",
      score: 8.5,
      scored_by: 150000,
      rank: 120,
      popularity: 200,
      members: 300000,
      favorites: 5000,
      synopsis: synopsis ?? "This is a mock description of the anime.",
      background: "Some background information.",
      season: "Fall",
      year: 2021,
      broadcast: Broadcast(day: "Sunday", time: "18:00", timezone: "Asia/Tokyo", string: "Sunday at 6 PM JST"),
      producers: [Producer(mal_id: 111, type: "Animation Studio", name: "Sample Studio", url: "https://myanimelist.net/studio/111/Sample_Studio")],
      licensors: [Licer(mal_id: 222, type: "License", name: "Sample Licensor", url: "https://myanimelist.net/license/222/Sample_Licensor")],
      studios: [Studio(mal_id: 333, type: "Studio", name: "Example Studio", url: "https://myanimelist.net/studio/333/Example_Studio")],
      genres: [Genre(mal_id: 1, type: "Genre", name: "Adventure", url: "https://myanimelist.net/genre/1/Adventure")],
      explicit_genres: [Genre(mal_id: 3, type: "Genre", name: "Horror", url: "https://myanimelist.net/genre/3/Horror")],
      themes: [Genre(mal_id: 4, type: "Theme", name: "Good vs Evil", url: "https://myanimelist.net/theme/4/Good_vs_Evil")],
      demographics: [Genre(mal_id: 5, type: "Demographic", name: "Shonen", url: "https://myanimelist.net/demographic/5/Shonen")]
    )
  }
}
