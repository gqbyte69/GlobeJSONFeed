//
//  Resuable.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/27/25.
//

import Foundation

typealias ReusableCell = ReusableView

protocol ReusableView: AnyObject {
  static var reuseIdentifier: String { get }
}

// MARK: Default protocol implementation

extension ReusableView {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}
