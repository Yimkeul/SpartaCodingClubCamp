//
//  UIViewController+Extension.swift
//  StartingCamp
//
//  Created by yimkeul on 3/5/25.
//

import Foundation
import UIKit

extension UIViewController {
    var screen: UIScreen? {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return view.window?.windowScene?.screen
        }
        return window.screen
    }
    
    var cardSize: CGSize {
        guard let window = screen?.bounds else {
            return CGSize()
        }
        let width = window.width
        
        let cWidth = width / 2 - CGFloat(Sizes.padding.value) * 1.5
        let cHeight = cWidth * 1.5
        
        return CGSize(width: cWidth, height: cHeight)
    }
    
    var cardImageSize: CGSize {
        let (cWidth, cHeight) = (cardSize.width, cardSize.height)
        let cardImageHeight = cHeight * 2 / 3
        return CGSize(width: cWidth, height: cardImageHeight)
    }
}
