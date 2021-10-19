//
//  MyColorType.swift
//  MyColorMemoApp
//
//  Created by JIHA on 2021/10/14.
//

import Foundation
import UIKit

enum MyColorType {
    case `default` //#ffffff
    case orange // #f8c165
    case red // #d24141
    case blue // #4187fa
    case pink // #f064b9
    case green // #50aa41
    case purple // #965ad2
    
    var color: UIColor {
        switch self {
        case .default:
            return .white
        case .orange:
            return .rgba(red: 248, green: 193, blue: 101, alpha: 1)
        case .red:
            return .rgba(red: 210, green: 65, blue: 65, alpha: 1)
        case .blue:
            return .rgba(red: 65, green: 135, blue: 250, alpha: 1)
        case .pink:
            return .rgba(red: 240, green: 100, blue: 185, alpha: 1)
        case .green:
            return .rgba(red: 80, green: 170, blue: 65, alpha: 1)
        case .purple:
            return  .rgba(red: 150, green: 90, blue: 210, alpha: 1)
        }
    }
}

extension UIColor {
    static func rgba(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
        return UIColor(red: CGFloat(red) / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
}
