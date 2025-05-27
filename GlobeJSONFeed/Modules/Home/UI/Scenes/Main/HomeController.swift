//
//  HomeController.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/25/25.
//

import Foundation
import UIKit

final class HomeController: UIViewController {
  var viewModel: HomeViewModelProtocol!

  @IBOutlet private(set) var tableView: UITableView!
}

// MARK: - Lifecycle

extension HomeController {
  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    refresh()
  }
}

// MARK: - Setup

private extension HomeController {
  func setup() {
    title = "Anime List"

    tableView.registerCells([AnimeCell.self])
  }
}

// MARK: - Routers

private extension HomeController {
  func pushAnimeDetails(at index: Int) {
    let sb = UIStoryboard(name: "AnimeDetails", bundle: Bundle.main)
    let vc = sb.instantiateViewController(withIdentifier: "AnimeDetailsController")

    if let vc = vc as? AnimeDetailsController {
      vc.viewModel = viewModel.animeDetailsViewModel(at: index)
    }

    navigationController?.pushViewController(vc, animated: true)
  }
}

// MARK: - Helpers

private extension HomeController {
  func refresh() {
    Task {
      do {
        try await viewModel.fetchAnimes()

        DispatchQueue.main.async {
          self.processFetchDataSuccess()
        }
      } catch {
        let errorString = String(describing: error)
        debugPrint("ERROR [\(errorString)]")

        //        DispatchQueue.main.async {
        //          LoadingOverlay.shared.hide()
        //        }
      }
    }
  }

  func processFetchDataSuccess() {
    tableView.reloadData()
  }
}

// MARK: - UITableViewDataSource

extension HomeController: UITableViewDataSource {
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    viewModel.animeCount
  }

  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let cell = tableView.dequeueCell(AnimeCell.self, for: indexPath)
    cell.viewModel = viewModel.animeCellViewModel(at: indexPath.row)
    return cell
  }
}

// MARK: - UITableViewDataSource

extension HomeController: UITableViewDelegate {
  func tableView(
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath
  ) {
    pushAnimeDetails(at: indexPath.row)
  }
}
