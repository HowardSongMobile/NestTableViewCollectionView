//
//  TableViewDataSource.swift
//  NestTableViewCollectionView
//
//  Created by Howard Song on 2022-02-26.
//

import Foundation
import UIKit

final class CustomTableViewDataSource: NSObject, UITableViewDataSource {
    
    private var viewModel: ViewModel
    private var collectionViewDataSource: CollectionViewDataSource?
    private var cachedOffsets = [Int: CGFloat]()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        collectionViewDataSource = CollectionViewDataSource(viewModel: viewModel)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.colorData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = MasterTableCell().makeTableCell(cellIndex: indexPath.row, cellData: viewModel, dequeuingTableView: tableView)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        guard let source = collectionViewDataSource else {return}
        let actualCell = MasterTableCell().makeTableCellCollectionViewDataSourceDelegate(cellIndex: indexPath.row, cell: cell, collectionViewDataSourceDelegate: source)
        guard var cell = actualCell else {return}
        cell.collectionViewOffsetX = cachedOffsets[indexPath.row] ?? 0
    }

    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        guard let cell = MasterTableCell().retrieveActualTableCell(cellIndex: indexPath.row, cell: cell) else {return}
        cachedOffsets[indexPath.row] = cell.collectionViewOffsetX
    }
}

extension CustomTableViewDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableview selected at \(indexPath.row)")
    }
}
