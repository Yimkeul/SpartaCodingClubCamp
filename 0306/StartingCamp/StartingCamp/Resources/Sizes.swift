//
//  Sizes.swift
//  StartingCamp
//
//  Created by yimkeul on 3/5/25.
//

import Foundation

enum Sizes {
    case padding
    case corner
    case innerPadding
    var value: CGFloat {
        switch self {
        case .padding:
            return 16
        case .corner:
            return 16
        case .innerPadding:
            return 8
        }
    }
}
