//
//  MasterTableCell.swift
//  NestTableViewCollectionView
//
//  Created by Howard Song on 2022-02-27.
//

import Foundation
import UIKit

protocol TableCellCustomManageable {
    associatedtype T
    func makeTableCell<T>(cellIndex: Int, cellData: T?, dequeuingTableView: UITableView) -> UITableViewCell
}

final class MasterTableCell: TableCellCustomManageable {
    typealias T = AnyObject
    func makeTableCell<T>(cellIndex: Int, cellData: T?, dequeuingTableView: UITableView) -> UITableViewCell {
        
        switch cellIndex {
        case 0:
            return TableCell_PartI().makeTableCell(cellIndex: cellIndex, cellData: cellData, dequeuingTableView: dequeuingTableView)
        case 1, 2:
            return TableCell_PartII().makeTableCell(cellIndex: cellIndex, cellData: cellData, dequeuingTableView: dequeuingTableView)
        default:
            return TableCell_PartIII().makeTableCell(cellIndex: cellIndex, cellData: cellData, dequeuingTableView: dequeuingTableView)
        }
    }
    
    func makeTableCellCollectionViewDataSourceDelegate(cellIndex: Int, cell: UITableViewCell, collectionViewDataSourceDelegate: CollectionViewDataSource) -> TableViewCellFactory? {
        var tableCell: TableViewCellFactory
        switch cellIndex {
        case 0:
            guard let cell = cell as? TableViewCell_I else { return nil}
            cell.backgroundColor = .clear
            tableCell = cell
        case 1, 2:
            guard let cell = cell as? TableViewCell_II else { return nil}
            tableCell = cell
        default:
            guard let cell = cell as? TableViewCell_III else { return nil}
            tableCell = cell
        }
        
        tableCell.setCollectionViewDataSourceDelegate(collectionViewDataSourceDelegate: collectionViewDataSourceDelegate, row: cellIndex)
        return tableCell
    }
    
    func retrieveActualTableCell(cellIndex: Int, cell: UITableViewCell) -> TableViewCellFactory? {
        var tableCell: TableViewCellFactory
        switch cellIndex {
        case 0:
            guard let cell = cell as? TableViewCell_I else { return nil}
            cell.backgroundColor = .clear
            tableCell = cell
        case 1, 2:
            guard let cell = cell as? TableViewCell_II else { return nil}
            tableCell = cell
        default:
            guard let cell = cell as? TableViewCell_III else { return nil}
            tableCell = cell
        }
        return tableCell
    }
}

final class TableCell_PartI: TableCellCustomManageable {
    typealias T = AnyObject
    
    func makeTableCell<T>(cellIndex: Int, cellData: T?, dequeuingTableView: UITableView) -> UITableViewCell {
        guard let cell = dequeuingTableView.dequeueReusableCell(withIdentifier: CellReuseId.tableCell1_id) as? TableViewCell_I else {
            return UITableViewCell()
        }
        cell.title.text = CellTitle.value(index: cellIndex)
        return cell
    }
}

final class TableCell_PartII: TableCellCustomManageable {
    typealias T = AnyObject
    func makeTableCell<T>(cellIndex: Int, cellData: T?, dequeuingTableView: UITableView) -> UITableViewCell {
        guard let cell = dequeuingTableView.dequeueReusableCell(withIdentifier: CellReuseId.tableCell2_id) as? TableViewCell_II else {
            return UITableViewCell()
        }
        cell.title.text = CellTitle.value(index: cellIndex)
        return cell
    }
}

final class TableCell_PartIII: TableCellCustomManageable {
    typealias T = AnyObject
    func makeTableCell<T>(cellIndex: Int, cellData: T?, dequeuingTableView: UITableView) -> UITableViewCell {
        guard let cell = dequeuingTableView.dequeueReusableCell(withIdentifier: CellReuseId.tableCell3_id) as? TableViewCell_III else {
            return UITableViewCell()
        }
        cell.title.text = CellTitle.value(index: cellIndex)
        return cell
    }
}
