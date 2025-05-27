//
//  AnimeDetailsController.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/27/25.
//

import Kingfisher
import UIKit

final class AnimeDetailsController: UIViewController {
  var viewModel: AnimeDetailsViewModelProtocol!

  @IBOutlet private(set) var imageView: UIImageView!
  @IBOutlet private(set) var titleLabel: UILabel!
  @IBOutlet private(set) var synopsisLabel: UILabel!
}

// MARK: - Lifecycle

extension AnimeDetailsController {
  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }
}

// MARK: - Setup

private extension AnimeDetailsController {
  func setup() {
    title = viewModel.titleText

    titleLabel.text = viewModel.titleText
    synopsisLabel.text = viewModel.synopsisText

    if let url = viewModel.imageURL {
      imageView.kf.setImage(with: url)
    }
  }
}
