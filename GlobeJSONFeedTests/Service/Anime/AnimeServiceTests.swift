//
//  AnimeServiceTests.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/27/25.
//

import Foundation
import XCTest

@testable import GlobeJSONFeed

final class AnimeServiceTests: XCTestCase {
  func testFetchAnimes_ShouldReturnsValidResponse() async throws {
    let sut = makeSUT()
    sut.animeAPI.mockAnime = Anime.dummy(title: "Anime Title")
    let animes = try await sut.sut.fetchAnimes()

    XCTAssertEqual(animes.first?.title_english, "Anime Title")
  }

  func testFetchAnimes_ShouldThrowEmptyResponse() async {
    let sut = makeSUT()
    sut.animeAPI.shouldThrowError = true

    do {
      _ = try await sut.sut.fetchAnimes()
      XCTFail("Expected to throw APIError.emptyResponse but did not")
    } catch let error as APIError {
      XCTAssertEqual(error, .emptyResponse)
    } catch {
      XCTFail("Unexpected error: \(error)")
    }
  }

  func test_fetchAnimes_callsAnimeAPIGetAnimes() async {
    let sut = makeSUT()
    sut.animeAPI.mockAnime = Anime.dummy(title: "The Jewel")

    do {
      _ = try await sut.sut.fetchAnimes()
    } catch {
      XCTFail("Expected success, but got error: \(error)")
    }

    XCTAssertEqual(sut.animeAPI.getAnimesCallCount, 1)
  }
}

// MARK: - Helpers

private extension AnimeServiceTests {
  typealias SUT = (sut: AnimeService, animeAPI: MockAnimeAPI)

  func makeSUT() -> SUT {
    let animeAPI = MockAnimeAPI()
    let sut = AnimeService(api: animeAPI)

    return (sut: sut, animeAPI: animeAPI)
  }
}
