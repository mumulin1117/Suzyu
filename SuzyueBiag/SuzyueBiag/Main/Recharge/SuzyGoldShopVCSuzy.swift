//
//  SuzyGoldShopVCSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/25.
//

import UIKit
import StoreKit
final class SuzyGoldShopVCSuzy: UIViewController {
    
    private let suzyHeaderPanelSuzy = UIView()
    private let suzyBalanceLabelSuzy = UILabel()
    private let suzyCoinPreviewSuzy = UIImageView()
    private let suzyBackActionBtnSuzy = UIButton(type: .custom)
    
    private var suzyRechargeListSuzy: [SuzyPurchaseItemSuzy] = [
       
        SuzyPurchaseItemSuzy(suzyCoinAmountSuzy: 400, suzyPriceLabelSuzy: "$0.99", suzyProductIDSuzy: "uzdgfrfuzpjotjyy"),
        SuzyPurchaseItemSuzy(suzyCoinAmountSuzy: 800, suzyPriceLabelSuzy: "$1.99", suzyProductIDSuzy: "acsgeadxlbysvowz"),
        SuzyPurchaseItemSuzy(suzyCoinAmountSuzy: 2450, suzyPriceLabelSuzy: "$4.99", suzyProductIDSuzy: "noumfmlrqxxvsuox"),
        SuzyPurchaseItemSuzy(suzyCoinAmountSuzy: 2850, suzyPriceLabelSuzy: "$5.99", suzyProductIDSuzy: "naksbfuhssxvsurg"),
        SuzyPurchaseItemSuzy(suzyCoinAmountSuzy: 5150, suzyPriceLabelSuzy: "$9.99", suzyProductIDSuzy: "zwylcqfbzaasysqi"),
        SuzyPurchaseItemSuzy(suzyCoinAmountSuzy: 10800, suzyPriceLabelSuzy: "$19.99", suzyProductIDSuzy: "bmwlhteruwffzbfe"),
        SuzyPurchaseItemSuzy(suzyCoinAmountSuzy: 29400, suzyPriceLabelSuzy: "$49.99", suzyProductIDSuzy: "pmyojytfhxnjamxh"),
        SuzyPurchaseItemSuzy(suzyCoinAmountSuzy: 63700, suzyPriceLabelSuzy: "$99.99", suzyProductIDSuzy: "fpptzxlvbrzdhvqm")
    ]
    
    private lazy var suzyGridViewSuzy: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let screenWidth = UIScreen.main.bounds.width
        let padding = 15.0
        let itemWidth = (screenWidth - (padding * 3)) / 2
        layout.itemSize = CGSize(width: itemWidth, height: 184)
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.delegate = self
        cv.dataSource = self
        cv.register(SuzyRechargeGridCellSuzy.self, forCellWithReuseIdentifier: "SuzyRechargeCell")
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        suzyAssembleBaseViewSuzy()
        suzyRefreshCurrentGoldSuzy()
    }
    
      private let suzyFallbackBgImageViewSuzy: UIImageView = {
          let iv = UIImageView.init(frame: UIScreen.main.bounds)
          iv.image = SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "SuzyWelcomeBgSuzyELUA")
          iv.contentMode = .scaleAspectFill
         
          return iv
      }()
    private func suzyAssembleBaseViewSuzy() {
        
        view.addSubview(suzyFallbackBgImageViewSuzy)
        
        suzyBackActionBtnSuzy.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        suzyBackActionBtnSuzy.tintColor = .white
        suzyBackActionBtnSuzy.addTarget(self, action: #selector(suzyDismissShopSuzy), for: .touchUpInside)
        view.addSubview(suzyBackActionBtnSuzy)
        
        suzyHeaderPanelSuzy.layer.cornerRadius = 25
        suzyHeaderPanelSuzy.layer.masksToBounds = true
        view.addSubview(suzyHeaderPanelSuzy)
        
        suzyBalanceLabelSuzy.textColor = .white
        suzyBalanceLabelSuzy.font = .systemFont(ofSize: 28, weight: .heavy)
        suzyHeaderPanelSuzy.addSubview(suzyBalanceLabelSuzy)
        
        suzyCoinPreviewSuzy.image = SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "suzy_coin_glow")
        suzyHeaderPanelSuzy.addSubview(suzyCoinPreviewSuzy)
        
        view.addSubview(suzyGridViewSuzy)
        
        suzyBackActionBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyHeaderPanelSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyBalanceLabelSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyCoinPreviewSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyGridViewSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            suzyBackActionBtnSuzy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            suzyBackActionBtnSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            suzyBackActionBtnSuzy.widthAnchor.constraint(equalToConstant: 44),
            suzyBackActionBtnSuzy.heightAnchor.constraint(equalToConstant: 44),
            
            suzyHeaderPanelSuzy.topAnchor.constraint(equalTo: suzyBackActionBtnSuzy.bottomAnchor, constant: 20),
            suzyHeaderPanelSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            suzyHeaderPanelSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            suzyHeaderPanelSuzy.heightAnchor.constraint(equalToConstant: 60),
            
            suzyBalanceLabelSuzy.centerYAnchor.constraint(equalTo: suzyHeaderPanelSuzy.centerYAnchor),
            suzyBalanceLabelSuzy.leadingAnchor.constraint(equalTo: suzyHeaderPanelSuzy.leadingAnchor, constant: 25),
            
            suzyCoinPreviewSuzy.centerYAnchor.constraint(equalTo: suzyHeaderPanelSuzy.centerYAnchor),
            suzyCoinPreviewSuzy.trailingAnchor.constraint(equalTo: suzyHeaderPanelSuzy.trailingAnchor, constant: -20),
            suzyCoinPreviewSuzy.widthAnchor.constraint(equalTo: suzyHeaderPanelSuzy.heightAnchor, multiplier: 0.6),
            suzyCoinPreviewSuzy.heightAnchor.constraint(equalTo: suzyCoinPreviewSuzy.widthAnchor),
            
            suzyGridViewSuzy.topAnchor.constraint(equalTo: suzyHeaderPanelSuzy.bottomAnchor, constant: 10),
            suzyGridViewSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            suzyGridViewSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            suzyGridViewSuzy.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let graidientdent = CAGradientLayer()
        graidientdent.colors = [UIColor(red: 0.38, green: 0.18, blue: 0.94, alpha: 1).cgColor, UIColor(red: 0.75, green: 0.18, blue: 0.94, alpha: 1).cgColor]
        graidientdent.locations = [0, 1]
        graidientdent.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: 60)
        graidientdent.startPoint = CGPoint(x: 0, y: 0.5)
        graidientdent.endPoint = CGPoint(x: 0.5, y: 0.5)
        suzyHeaderPanelSuzy.layer.insertSublayer(graidientdent, at: 0)
        
    }
    
    private func suzyRefreshCurrentGoldSuzy() {
        if let currentProfile = SuzySecureVaultSuzy.sharedSuzy.suzyFetchCurrentProfileSuzy() {
            suzyBalanceLabelSuzy.text = "My Gold : \(currentProfile.suzyCoinsSuzy)"
        }
    }
    
    @objc private func suzyDismissShopSuzy() {
        if navigationController == nil {
            self.dismiss(animated: true)
            return
        }
        
        navigationController?.popViewController(animated: true)
    }
}

extension SuzyGoldShopVCSuzy: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suzyRechargeListSuzy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuzyRechargeCell", for: indexPath) as! SuzyRechargeGridCellSuzy
        cell.suzyUpdateCellSuzy(item: suzyRechargeListSuzy[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = suzyRechargeListSuzy[indexPath.item]
        suzyTriggerPurchaseWorkflowSuzy(product: selectedItem)
    }
    
    private func suzyTriggerPurchaseWorkflowSuzy(product: SuzyPurchaseItemSuzy) {
        SuzyHudManagerSuzy.shared.suzyShowStatusLoadingSuzy(message: "Processing Payment...")
        ZompassHeadingSuzy.shared.regionLocaleSuue(calendarDateSuue: product.suzyProductIDSuzy) { [weak self] ler in
                DispatchQueue.main.async {
                    SuzyHudManagerSuzy.shared.suzyHideLoadingSuzy()
                    
                    switch ler {
                    case .success(let success):
                        SuzySecureVaultSuzy.sharedSuzy.suzyUpdateMutableAttributesSuzy(deltaCoinsSuzy: product.suzyCoinAmountSuzy)
                        self?.suzyRefreshCurrentGoldSuzy()
                        SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "Gained \(product.suzyCoinAmountSuzy) Coins", isSuccess: true)
                    case .failure(let failure):
                        SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: failure.localizedDescription, isSuccess: false)
                    }
                    
                }
            }

    }
   
}
