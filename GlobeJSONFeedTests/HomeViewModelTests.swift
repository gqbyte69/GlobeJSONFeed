//
//  HomeViewModelTests.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/27/25.
//

import XCTest

@testable import GlobeJSONFeed

final class HomeViewModelTests: XCTestCase {
  func test_fetchData_ShouldFailOnError() async {
    let sut = makeSUT()
    sut.animeService.shouldThrowError = true

    do {
      try await sut.sut.fetchAnimes()
      XCTFail("Expected fetchData to throw, but it succeeded")
    } catch {
      XCTAssertTrue(error is APIError)
    }
  }

  func test_fetchAnimes_ShouldSuccessfullyLoadAnimes() async {
    let sut = makeSUT()
    let anime = Anime.dummy(
      title: "Sample Title",
      synopsis: "Synopsis"
    )
    sut.animeService.responseAnime = anime

    do {
      try await sut.sut.fetchAnimes()
    } catch {
      XCTFail("Expected fetchData to succeed, but got error: \(error)")
    }

    XCTAssertEqual(sut.sut.animeCount, 1)

    let cellVM = sut.sut.animeCellViewModel(at: 0)
    XCTAssertEqual(cellVM.titleText, "Sample Title")

    let detailsVM = sut.sut.animeDetailsViewModel(at: 0)
    XCTAssertEqual(detailsVM.synopsisText, "Synopsis")
  }
}

// MARK: - Helpers

private extension HomeViewModelTests {
  typealias SUT = (sut: HomeViewModel, animeService: MockAnimeService)

  func makeSUT() -> SUT {
    let animeService = MockAnimeService()
    let vm = HomeViewModel(service: animeService)

    return (sut: vm, animeService: animeService)
  }
}
