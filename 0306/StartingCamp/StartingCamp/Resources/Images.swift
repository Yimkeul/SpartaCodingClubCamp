//
//  Images.swift
//  StartingCamp
//
//  Created by yimkeul on 3/6/25.
//

import Foundation
import UIKit

enum Images: String, CaseIterable {
    case bgImg
    case cat
    case kitchen
    case music
    case panda
    case reta
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
    
}
