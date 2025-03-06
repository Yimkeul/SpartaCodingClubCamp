//
//  Fonts.swift
//  StartingCamp
//
//  Created by yimkeul on 3/6/25.
//

import Foundation

enum Fonts {
    case title
    case description
    case date
    var value: CGFloat {
        switch self {
        case .title:
            return 20
        case .description:
            return 10
        case .date:
            return 8
        }
    }
}
