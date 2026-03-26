//
//  SuzyRechargeGridCellSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/25.
//

import UIKit

final class SuzyRechargeGridCellSuzy: UICollectionViewCell {
    private let suzyMainContainerSuzy = UIImageView.init(image: UIImage.init(named: "bMainContainerg"))
    private let suzyCoinIconSuzy = UIImageView()
    private let suzyAmountLabelSuzy = UILabel()
    private let suzyPurchaseBtnSuzy = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        suzyBuildCellHierarchySuzy()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func suzyBuildCellHierarchySuzy() {
  
        contentView.addSubview(suzyMainContainerSuzy)
        
        suzyCoinIconSuzy.image = UIImage(named: "bubbleacall")
        suzyCoinIconSuzy.contentMode = .scaleAspectFit
        suzyMainContainerSuzy.addSubview(suzyCoinIconSuzy)
        
        suzyAmountLabelSuzy.textColor = .white
        suzyAmountLabelSuzy.font = .systemFont(ofSize: 18, weight: .bold)
        suzyAmountLabelSuzy.textAlignment = .center
        suzyMainContainerSuzy.addSubview(suzyAmountLabelSuzy)
        
        suzyPurchaseBtnSuzy.backgroundColor = .systemPurple
        suzyPurchaseBtnSuzy.textColor = .white
        suzyPurchaseBtnSuzy.font = .systemFont(ofSize: 14, weight: .black)
        suzyPurchaseBtnSuzy.textAlignment = .center
        suzyPurchaseBtnSuzy.layer.cornerRadius = 18
        suzyPurchaseBtnSuzy.layer.masksToBounds = true
        suzyMainContainerSuzy.addSubview(suzyPurchaseBtnSuzy)
        
        
        suzyMainContainerSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyCoinIconSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyAmountLabelSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyPurchaseBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            suzyMainContainerSuzy.topAnchor.constraint(equalTo: contentView.topAnchor),
            suzyMainContainerSuzy.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            suzyMainContainerSuzy.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            suzyMainContainerSuzy.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            suzyCoinIconSuzy.topAnchor.constraint(equalTo: suzyMainContainerSuzy.topAnchor, constant: 0),
            suzyCoinIconSuzy.centerXAnchor.constraint(equalTo: suzyMainContainerSuzy.centerXAnchor),
            suzyCoinIconSuzy.widthAnchor.constraint(equalTo: suzyMainContainerSuzy.widthAnchor, multiplier: 0.5),
            suzyCoinIconSuzy.heightAnchor.constraint(equalTo: suzyCoinIconSuzy.widthAnchor),
            
            suzyAmountLabelSuzy.topAnchor.constraint(equalTo: suzyCoinIconSuzy.bottomAnchor, constant: 4),
            suzyAmountLabelSuzy.centerXAnchor.constraint(equalTo: suzyMainContainerSuzy.centerXAnchor),
            
            suzyPurchaseBtnSuzy.bottomAnchor.constraint(equalTo: suzyMainContainerSuzy.bottomAnchor, constant: -15),
            suzyPurchaseBtnSuzy.centerXAnchor.constraint(equalTo: suzyMainContainerSuzy.centerXAnchor),
            suzyPurchaseBtnSuzy.widthAnchor.constraint(equalTo: suzyMainContainerSuzy.widthAnchor, multiplier: 0.8),
            suzyPurchaseBtnSuzy.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    func suzyUpdateCellSuzy(item: SuzyPurchaseItemSuzy) {
        suzyAmountLabelSuzy.text = "\(item.suzyCoinAmountSuzy)"
        suzyPurchaseBtnSuzy.text = item.suzyPriceLabelSuzy
    }
}
