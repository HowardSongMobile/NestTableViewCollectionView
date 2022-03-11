//
//  ViewModel.swift
//  NestTableViewCollectionView
//
//  Created by Howard Song on 2022-02-25.
//

import Foundation

final class ViewModel {
    var colorData = [[UInt32]]()
    var colorDataBottom = [[UInt32]]()
    
    private let numberOfCollectionViewCellsPerRow = 10
    private let numberOfMiddleTableCells = 3
    private let numberOfBottomTableCells = 10
    private let numberOfBottomColumn = 2
    
    init () {
        colorData = generateRandomNumber(num1: numberOfMiddleTableCells, num2: numberOfCollectionViewCellsPerRow)
        colorDataBottom = generateRandomNumber(num1: numberOfBottomTableCells, num2: numberOfBottomColumn)
        colorData.append(contentsOf: colorDataBottom)
    }
    
    func generateRandomNumber(num1: Int, num2: Int) -> [[UInt32]] {
        return (0..<num1).map { _ in
            return (0..<num2).map {_ in arc4random() % 100}
        }
    }
}
