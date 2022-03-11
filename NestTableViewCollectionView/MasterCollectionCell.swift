//
//  MasterCollectionCell.swift
//  NestTableViewCollectionView
//
//  Created by Howard Song on 2022-03-06.
//

import Foundation
import UIKit

protocol CollectionCellCustomManageable {
    associatedtype T
    func makeCollectionCell<T>(indexPath: IndexPath, cellData: T?, dequeuingCollectionView: UICollectionView) -> UICollectionViewCell
}

class MasterCollectionCell: CollectionCellCustomManageable {
    typealias T = UInt32
    func makeCollectionCell<T>(indexPath: IndexPath, cellData: T?, dequeuingCollectionView: UICollectionView) -> UICollectionViewCell {
        
        switch dequeuingCollectionView.tag {
        case 0:
            return CollectionCell_PartI().makeCollectionCell(indexPath: indexPath, cellData: cellData, dequeuingCollectionView: dequeuingCollectionView)
        case 1, 2:
            return CollectionCell_PartII().makeCollectionCell(indexPath: indexPath, cellData: cellData, dequeuingCollectionView: dequeuingCollectionView)
        default:
            return CollectionCell_PartIII().makeCollectionCell(indexPath: indexPath, cellData: cellData, dequeuingCollectionView: dequeuingCollectionView)
        }
    }
}

final class CollectionCell_PartI: CollectionCellCustomManageable {
    typealias T = UInt32
    
    func makeCollectionCell<T>(indexPath: IndexPath, cellData: T?, dequeuingCollectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = dequeuingCollectionView.dequeueReusableCell(withReuseIdentifier: CellReuseId.collectionCell1_id, for: indexPath) as? CustomCollectionViewCell_PartI else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .white
        if let cellData = cellData {
            cell.button.backgroundColor = UIColor.generateRandomColor(number: cellData as! UInt32)
        }
        return cell
    }
}

final class CollectionCell_PartII: CollectionCellCustomManageable {
    typealias T = UInt32
    
    func makeCollectionCell<T>(indexPath: IndexPath, cellData: T?, dequeuingCollectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = dequeuingCollectionView.dequeueReusableCell(withReuseIdentifier: CellReuseId.collectionCell2_id, for: indexPath) as? CustomCollectionViewCell_PartII else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .lightGray
        if let cellData = cellData {
            cell.containerView.backgroundColor = UIColor.generateRandomColor(number: cellData as! UInt32)
            if dequeuingCollectionView.tag == 1 {
                cell.bottomTitle.text = "Title - Popular item " + String(format: "%d", indexPath.row)
            }else{
                cell.bottomTitle.text = "Title - Recommend " + String(format: "%d", indexPath.row)
            }
        }
        return cell
    }
}

final class CollectionCell_PartIII: CollectionCellCustomManageable {
    typealias T = UInt32
    
    func makeCollectionCell<T>(indexPath: IndexPath, cellData: T?, dequeuingCollectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = dequeuingCollectionView.dequeueReusableCell(withReuseIdentifier: CellReuseId.collectionCell3_id, for: indexPath) as? CustomCollectionViewCell_PartIII else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .lightGray
        if let cellData = cellData {
            cell.containerView.backgroundColor = UIColor.generateRandomColor(number: cellData as! UInt32)
            cell.bottomTitle.text = "Title - You love " + String(format: "%dx%d", dequeuingCollectionView.tag, indexPath.row)
        }
        return cell
    }
}
