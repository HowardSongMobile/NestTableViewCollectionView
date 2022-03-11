//
//  CellTitle.swift
//  NestTableViewCollectionView
//
//  Created by Howard Song on 2022-03-02.
//

import Foundation
import CoreText

enum CellTitle: String {
    case first = "Hot Trends"
    case second = "Popular Elements"
    case third = "Recommended"
    case more = "More...You May Love"
    
    static func value(index: Int) -> String {
        switch index {
        case 0:
            return CellTitle.first.rawValue
        case 1:
            return CellTitle.second.rawValue
        case 2:
            return CellTitle.third.rawValue
        case 3:
            return CellTitle.more.rawValue
        default:
            return ""
        }
    }
}
