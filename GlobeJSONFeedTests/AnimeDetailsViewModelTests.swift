//
//  AnimeDetailsViewModelTests.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/27/25.
//

import Foundation
import XCTest

@testable import GlobeJSONFeed

final class AnimeDetailsViewModelTests: XCTestCase {
  func testTitleText() {
    let anime = Anime.dummy(title: "My Title")
    let sut = makeSUT(anime: anime)

    XCTAssertEqual(sut.titleText, "My Title")
  }

  func testSynopsisText() {
    let anime = Anime.dummy(synopsis: "My Synopsis")
    let sut = makeSUT(anime: anime)

    XCTAssertEqual(sut.synopsisText, "My Synopsis")

  }
}

// MARK: - Helpers

private extension AnimeDetailsViewModelTests {
  typealias SUT = AnimeDetailsViewModel

  func makeSUT(anime: Anime) -> SUT {
    AnimeDetailsViewModel(anime: anime)
  }
}
