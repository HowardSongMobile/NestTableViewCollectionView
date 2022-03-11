//
//  TableCells.swift
//  NestTableViewCollectionView
//
//  Created by Howard Song on 2022-02-25.
//

import Foundation
import UIKit

//MARK: - TableView Cell Protocol
protocol TableViewCellFactory {
    var collectionView: UICollectionView {get set}
    var collectionViewOffsetX: CGFloat {get set}
    
    typealias T = UICollectionViewDataSource & UICollectionViewDelegate
    func setCollectionViewDataSourceDelegate(collectionViewDataSourceDelegate: T, row: Int)
}
extension TableViewCellFactory {
    func setCollectionViewDataSourceDelegate(collectionViewDataSourceDelegate: T, row: Int) {

        collectionView.delegate = collectionViewDataSourceDelegate
        collectionView.dataSource = collectionViewDataSourceDelegate
        collectionView.tag = row
        collectionView.setContentOffset(collectionView.contentOffset, animated:false)
        collectionView.reloadData()
    }

    var collectionViewOffsetX: CGFloat {
        set { collectionView.contentOffset.x = newValue }
        get { return collectionView.contentOffset.x }
    }
}

//MARK: - TableView Cells
class TableViewCell_I: UITableViewCell, TableViewCellFactory {
    
    lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    lazy var title: UILabel = UILabel.makeUILabel(font: .systemFont(ofSize: 14), textColor: .black)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupCollectionView()
        setupConstraints()
    }
       
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addSubviews(){
        self.addSubview(title)
        self.addSubview(collectionView)
    }
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout.makeCollectionViewFlowLayout(itemWidth: 90, itemHeight: 90)
        collectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 129)
        collectionView.collectionViewLayout = layout
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CustomCollectionViewCell_PartI.self, forCellWithReuseIdentifier: CellReuseId.collectionCell1_id)
        collectionView.backgroundColor = .white
        contentView.isUserInteractionEnabled = false
    }
    func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        title.anchorConstraints(top: self.topAnchor, paddingTop: 1, bottom: collectionView.topAnchor, paddingBottom: 0, left: self.leadingAnchor, paddingLeft: 5, right: self.trailingAnchor, paddingRight: 0)
        collectionView.anchorConstraints(top: nil, paddingTop: 0, bottom: self.bottomAnchor, paddingBottom: -1, left: self.leadingAnchor, paddingLeft: 3, right: self.trailingAnchor, paddingRight: -1)
        collectionView.heightAnchor.constraint(equalToConstant: 129).isActive = true
    }
}

//MARK: - TableViewCell_II
class TableViewCell_II: UITableViewCell, TableViewCellFactory {
    lazy var title: UILabel = UILabel.makeUILabel(font: .systemFont(ofSize: 14.0), textColor: .black)
    var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupCollectionView()
        setupConstraints()
    }
       
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews(){
        self.addSubview(title)
        self.addSubview(collectionView)
    }
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout.makeCollectionViewFlowLayout(itemWidth: 150, itemHeight: 170)
        collectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 180)
        collectionView.collectionViewLayout = layout
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CustomCollectionViewCell_PartII.self, forCellWithReuseIdentifier: CellReuseId.collectionCell2_id)
        collectionView.backgroundColor = .white
        contentView.isUserInteractionEnabled = false
    }
    func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        title.anchorConstraints(top: self.topAnchor, paddingTop: 1, bottom: collectionView.topAnchor, paddingBottom: 0, left: self.leadingAnchor, paddingLeft: 5, right: self.trailingAnchor, paddingRight: 0)
        collectionView.anchorConstraints(top: title.bottomAnchor, paddingTop: 0, bottom: self.bottomAnchor, paddingBottom: -1, left: self.leadingAnchor, paddingLeft: 1, right: self.trailingAnchor, paddingRight: -1)
        collectionView.heightAnchor.constraint(equalToConstant: 180).isActive = true
    }
}
//MARK: - TableViewCell_III
class TableViewCell_III: UITableViewCell, TableViewCellFactory {
    lazy var title: UILabel = UILabel.makeUILabel(font: .systemFont(ofSize: 14.0), textColor: .black)
    lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupCollectionView()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews(){
        self.addSubview(title)
        self.addSubview(collectionView)
    }
    func setupCollectionView() {
        let minimumItemSpace = 5
        let numberOfCollectionCell = 2
        let width = Int(Int(UIScreen.main.bounds.width) - 3*minimumItemSpace) / numberOfCollectionCell
        let itemHeight = Double(width) * 1.35
        let layout = UICollectionViewFlowLayout.makeCollectionViewFlowLayout(itemWidth: width, itemHeight: Int(itemHeight))
        layout.minimumInteritemSpacing = CGFloat(minimumItemSpace)
        layout.minimumLineSpacing = CGFloat(minimumItemSpace)
        layout.sectionInset = UIEdgeInsets(top: 0, left: CGFloat(minimumItemSpace), bottom: 0, right: CGFloat(minimumItemSpace))
        collectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: itemHeight + Double(minimumItemSpace*2))
        collectionView.collectionViewLayout = layout
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CustomCollectionViewCell_PartIII.self, forCellWithReuseIdentifier: CellReuseId.collectionCell3_id)
        collectionView.backgroundColor = .white
        contentView.isUserInteractionEnabled = false
    }
    func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        title.anchorConstraints(top: self.topAnchor, paddingTop: 1, bottom: collectionView.topAnchor, paddingBottom: 0, left: self.leadingAnchor, paddingLeft: 5, right: self.trailingAnchor, paddingRight: 0)
        collectionView.anchorConstraints(top: title.bottomAnchor, paddingTop: 0, bottom: self.bottomAnchor, paddingBottom: -1, left: self.leadingAnchor, paddingLeft: 1, right: self.trailingAnchor, paddingRight: -1)
        collectionView.heightAnchor.constraint(equalToConstant: 262).isActive = true
    }
}
