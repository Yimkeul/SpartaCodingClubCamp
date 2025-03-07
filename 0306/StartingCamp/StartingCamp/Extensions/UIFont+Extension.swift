//
//  UIFont+Extension.swift
//  StartingCamp
//
//  Created by yimkeul on 3/6/25.
//

import Foundation
import UIKit

extension UIFont {
    static func applyFont(for type: Fonts) -> UIFont? {
        switch type {
        case .title:
            return UIFont.systemFont(ofSize: type.value, weight: .bold)
        case .description:
            return UIFont.systemFont(ofSize: type.value, weight: .regular)
        case .date:
            return UIFont.systemFont(ofSize: type.value, weight: .regular)
        case .detailTitle:
            return UIFont.systemFont(ofSize: type.value, weight: .bold)
        case .detailDesctiption:
            return UIFont.systemFont(ofSize: type.value, weight: .regular)
        case .detailDate:
            return UIFont.systemFont(ofSize: type.value, weight: .regular)
        }
    }
}
