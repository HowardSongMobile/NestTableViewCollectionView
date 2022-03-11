//
//  CollectionViewDataSource.swift
//  NestTableViewCollectionView
//
//  Created by Howard Song on 2022-02-26.
//

import Foundation
import UIKit

final class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    private let viewModel: ViewModel
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.colorData[collectionView.tag].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = MasterCollectionCell().makeCollectionCell(indexPath: indexPath, cellData: viewModel.colorData[collectionView.tag][indexPath.item], dequeuingCollectionView: collectionView)
        return cell
        
    }
}

extension CollectionViewDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("source class Collection view at table row \(collectionView.tag) selected index row \(indexPath.row)")
    }
}
