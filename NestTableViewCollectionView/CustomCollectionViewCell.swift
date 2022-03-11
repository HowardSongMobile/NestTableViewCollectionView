//
//  CustomCollectionViewCell.swift
//  NestTableViewCollectionView
//
//  Created by Howard Song on 2022-02-26.
//

import Foundation
import UIKit

//MARK: - custom collection view cells
class CustomCollectionViewCell_PartI: UICollectionViewCell {
    
    lazy var button: UIButton = UIButton.makeUIButton(width: 80, height: 80)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setContrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setSubviews()
        setContrains()
    }
    
    func setSubviews() {
        contentView.addSubview(button)
    }
    
    func setContrains() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setCenterConstraints(centerX: contentView.centerXAnchor, paddingX: 0, centerY: contentView.centerYAnchor, paddingY: 0)
        button.setSizeConstraints(width: 80, height: 80)
    }
}

final class CustomCollectionViewCell_PartII: UICollectionViewCell {
    
    lazy var containerView = UIView.makeUIView(width: Int(contentView.frame.width), height: 111)
    lazy var bottomTitle: UILabel = UILabel.makeUILabel(font: .systemFont(ofSize: 12.0), textColor: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setContrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setSubviews()
        setContrains()
    }
    
    func setSubviews() {
        contentView.addSubview(containerView)
        contentView.addSubview(bottomTitle)
    }
    
    func setContrains() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.anchorConstraints(top: contentView.topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: contentView.leadingAnchor, paddingLeft: 0, right: contentView.trailingAnchor, paddingRight: 0)
        containerView.setSizeConstraints(width: contentView.bounds.width, height: 111)
        
        bottomTitle.anchorConstraints(top: containerView.bottomAnchor, paddingTop: 10, bottom: nil, paddingBottom: 0, left: containerView.leadingAnchor, paddingLeft: 10, right: containerView.trailingAnchor, paddingRight: 0)
    }
}

final class CustomCollectionViewCell_PartIII: UICollectionViewCell {
    
    lazy var containerView = UIView.makeUIView(width: Int(contentView.frame.width), height: 190)
    lazy var bottomTitle: UILabel = UILabel.makeUILabel(font: .systemFont(ofSize: 12.0), textColor: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setContrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setSubviews()
        setContrains()
    }
    
    func setSubviews() {
        contentView.addSubview(containerView)
        contentView.addSubview(bottomTitle)
    }
    
    func setContrains() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.anchorConstraints(top: contentView.topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: contentView.leadingAnchor, paddingLeft: 0, right: contentView.trailingAnchor, paddingRight: 0)
        containerView.setSizeConstraints(width: contentView.bounds.width, height: 190)
        bottomTitle.anchorConstraints(top: containerView.bottomAnchor, paddingTop: 10, bottom: nil, paddingBottom: 0, left: containerView.leadingAnchor, paddingLeft: 10, right: containerView.trailingAnchor, paddingRight: 0)
    }
}
