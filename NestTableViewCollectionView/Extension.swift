//
//  Extension.swift
//  NestTableViewCollectionView
//
//  Created by Howard Song on 2022-02-25.
//

import Foundation
import UIKit

//MARK: - extension UILabel
//by using factory methods pattern here, make code of view controllers more cleaner
extension UILabel {
    static func makeUILabel(font: UIFont = .systemFont(ofSize: 16), textColor: UIColor = .gray) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = textColor
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        return label
    }
}
//MARK: - extension UIButton
extension UIButton {
    static func makeUIButton(width: Int, height: Int) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .lightGray//UIColor.generateRandomColor()
        button.frame = CGRect(x: 0, y: 0, width: width, height: height)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.setTitleColor(.white, for: .normal)
        return button
    }
}
//MARK: - extension UIView
extension UIView {
    static func makeUIView(width: Int, height: Int) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        view.backgroundColor = .lightGray//UIColor.generateRandomColor()
        return view
    }
}

extension  UIView {
    func anchorConstraints(top: NSLayoutYAxisAnchor?, paddingTop: CGFloat,
                bottom: NSLayoutYAxisAnchor?, paddingBottom: CGFloat,
                left: NSLayoutXAxisAnchor?, paddingLeft: CGFloat,
                right: NSLayoutXAxisAnchor?, paddingRight: CGFloat, width: CGFloat = 0, height: CGFloat = 0){
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        if let left = left {
            leadingAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            trailingAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
        if  width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if  height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func setCenterConstraints(centerX: NSLayoutXAxisAnchor?, paddingX: CGFloat, centerY: NSLayoutYAxisAnchor?, paddingY: CGFloat)  {
        translatesAutoresizingMaskIntoConstraints = false
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX , constant: paddingX).isActive = true
        }
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY , constant: paddingY).isActive = true
        }
    }
    
    func setSizeConstraints( width : CGFloat ,  height : CGFloat)  {
        translatesAutoresizingMaskIntoConstraints = false
        if  width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if  height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
//MARK: - extension UICollectionViewFlowLayout
extension UICollectionViewFlowLayout {
    static func makeCollectionViewFlowLayout(itemWidth: Int, itemHeight: Int) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let minimumInteritemSpacing = 4.0
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.sectionInset = UIEdgeInsets(top: CGFloat(minimumInteritemSpacing), left: CGFloat(minimumInteritemSpacing), bottom: CGFloat(minimumInteritemSpacing), right: CGFloat(minimumInteritemSpacing))
        return layout
    }
}

//MARK: - extension UIColor
extension UIColor {
    static func generateRandomColor(number: UInt32) -> UIColor {
        let hue = CGFloat(number) / 100
        let saturation = 0.9
        let brightness = 0.9
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
}

