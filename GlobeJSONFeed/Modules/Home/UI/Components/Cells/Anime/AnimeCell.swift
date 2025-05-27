//
//  AnimeCell.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/27/25.
//

import Kingfisher
import UIKit

final class AnimeCell: UITableViewCell {
  var viewModel: AnimeCellViewModelProtocol! {
    didSet {
      refresh()
    }
  }
  
  @IBOutlet private(set) var titleLabel: UILabel!
  @IBOutlet private(set) var iconImageView: UIImageView!

  override func awakeFromNib() {
    super.awakeFromNib()

    setup()
  }
}

// MARK: - Refresh

private extension AnimeCell {
  func setup() {
    iconImageView.layer.cornerRadius = 8
    iconImageView.clipsToBounds = true
    iconImageView.layer.borderColor = UIColor.white.cgColor
    iconImageView.layer.borderWidth = 1
  }
}

// MARK: - Refresh

private extension AnimeCell {
  func refresh() {
    titleLabel.text = viewModel.titleText

    if let url = viewModel.imageURL {
      iconImageView.kf.setImage(with: url)
    }
  }
}
