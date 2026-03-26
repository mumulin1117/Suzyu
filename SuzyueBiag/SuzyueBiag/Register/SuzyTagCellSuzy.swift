//
//  SuzyTagCellSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/20.
//

import UIKit
//struct SuzyInterestItemSuzy {
//    let suzyTitleSuzy: String
//    let suzyIconSuzy: String // 对应设计图中的 Emoji 或 SF Symbols
//}
final class SuzyTagCellSuzy: UICollectionViewCell {
    
    private let suzyBgViewSuzy = UIView()
    private let suzyTitleLabelSuzy = UILabel()
    private let suzyGradientLayerSuzy = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        suSetupUISuzy()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func suSetupUISuzy() {
        suzyBgViewSuzy.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        suzyBgViewSuzy.layer.cornerRadius = 20
        suzyBgViewSuzy.layer.masksToBounds = true
        suzyBgViewSuzy.layer.borderWidth = 1
        suzyBgViewSuzy.layer.borderColor = UIColor.white.withAlphaComponent(0.1).cgColor
        contentView.addSubview(suzyBgViewSuzy)
        
        suzyTitleLabelSuzy.textColor = .white
        suzyTitleLabelSuzy.font = .systemFont(ofSize: 14, weight: .medium)
        suzyTitleLabelSuzy.textAlignment = .center
        contentView.addSubview(suzyTitleLabelSuzy)
        
        // 预设渐变层
        suzyGradientLayerSuzy.colors = [
            UIColor(red: 0.65, green: 0.3, blue: 1, alpha: 1).cgColor,
            UIColor(red: 0.47, green: 0.09, blue: 1, alpha: 1).cgColor
        ]
        suzyGradientLayerSuzy.startPoint = CGPoint(x: 0, y: 0)
        suzyGradientLayerSuzy.endPoint = CGPoint(x: 1, y: 1)
        suzyGradientLayerSuzy.isHidden = true
        suzyBgViewSuzy.layer.insertSublayer(suzyGradientLayerSuzy, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        suzyBgViewSuzy.frame = contentView.bounds
        suzyTitleLabelSuzy.frame = contentView.bounds
        suzyGradientLayerSuzy.frame = suzyBgViewSuzy.bounds
    }
    
    func suzyConfigureSuzy(item: String, isSelected: Bool) {
        suzyTitleLabelSuzy.text = item
        suzyGradientLayerSuzy.isHidden = !isSelected
        suzyBgViewSuzy.layer.borderColor = isSelected ? UIColor.clear.cgColor : UIColor.white.withAlphaComponent(0.1).cgColor
    }
}
