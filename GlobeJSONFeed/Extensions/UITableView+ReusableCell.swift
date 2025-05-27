//
//  UITableView+ReusableCell.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/27/25.
//

import UIKit

extension UITableViewCell: ReusableCell {}

extension UITableView {
  /// Registers a set of classes for use in creating new table view cells.
  /// - Parameter cellTypes: The cell types to register
  func registerCells(
    _ cellTypes: [UITableViewCell.Type],
    bundle: Bundle = .main
  ) {
    for cellType in cellTypes {
      let reuseId = cellType.reuseIdentifier
      let nibFile = bundle.path(forResource: reuseId, ofType: "nib")
      let doesNibFileExist = (nibFile != nil)

      if doesNibFileExist {
        register(
          UINib(nibName: reuseId, bundle: nil),
          forCellReuseIdentifier: reuseId
        )
      } else {
        register(
          cellType.self,
          forCellReuseIdentifier: reuseId
        )
      }
    }
  }

  /// Dequeues a reusable table cell object located by its type.
  /// - Parameters:
  ///   - cellType: The type of the cell to dequeue.
  ///   - indexPath: The index path specifying the location of the cell.
  /// - Returns: A valid cell instance of the specified type.
  func dequeueCell<T: UITableViewCell>(
    _ cellType: T.Type,
    for indexPath: IndexPath
  ) -> T {
    guard
      let cell = dequeueReusableCell(
        withIdentifier: cellType.reuseIdentifier,
        for: indexPath
      ) as? T
    else {
      preconditionFailure("Unexpected cell type returned")
    }

    return cell
  }
}
