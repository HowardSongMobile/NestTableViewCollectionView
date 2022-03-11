//
//  ViewController.swift
//  NestTableViewCollectionView
//
//  Created by Howard Song on 2022-02-25.
//

import UIKit

class ViewController: UIViewController {

    private lazy var tableView = UITableView()
    private var viewModel = ViewModel()
    private var customTableViewDataSourceDelegate: CustomTableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        addConstraints()
    }
}

//MARK: - extension
extension ViewController {
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.register(TableViewCell_I.self, forCellReuseIdentifier: CellReuseId.tableCell1_id)
        tableView.register(TableViewCell_II.self, forCellReuseIdentifier: CellReuseId.tableCell2_id)
        tableView.register(TableViewCell_III.self, forCellReuseIdentifier: CellReuseId.tableCell3_id)
    
        customTableViewDataSourceDelegate = CustomTableViewDataSource(viewModel: viewModel)
        tableView.delegate = customTableViewDataSourceDelegate
        tableView.dataSource = customTableViewDataSourceDelegate
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 190
        tableView.separatorStyle = .none
        view.layer.borderWidth = 2.0
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.cornerRadius = 6.0
    }
    
    func addConstraints() {
        tableView.anchorConstraints(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 1, bottom: view.layoutMarginsGuide.bottomAnchor, paddingBottom: 0, left: view.leadingAnchor, paddingLeft: 0, right: view.trailingAnchor, paddingRight: 0)
        view.bringSubviewToFront(tableView)
    }
}
