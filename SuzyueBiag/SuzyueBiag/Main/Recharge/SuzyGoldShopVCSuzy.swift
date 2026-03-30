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
    private let DeserialPreviewSuzy = UIImageView()
    private let suzyBackActionBtnSuzy = UIButton(type: .custom)
    
    private var suzyRechargeListSuzy: [SuzyPurchaseItemSuzy] = [
       
        SuzyPurchaseItemSuzy(DeserialAmountSuzy: 400, suzyPriceLabelSuzy: "WCBubkRD7T13Z24W0MRAXGBFEoVTQ9Iv1SXl8Lo61yQ9RKR/yg==", suzyProductIDSuzy: "uzdgfrfuzpjotjyy"),
        SuzyPurchaseItemSuzy(DeserialAmountSuzy: 800, suzyPriceLabelSuzy: "7PG1umglFAxeBr95mWfUGo03iAskaGl8X5HKgYyUCHGQsl2f4Q==", suzyProductIDSuzy: "acsgeadxlbysvowz"),
        SuzyPurchaseItemSuzy(DeserialAmountSuzy: 2450, suzyPriceLabelSuzy: "N94GtzJAn3/PoFbXUpsYGJWrcRX2bsFfc8hWbgIkT0xZn3wqKA==", suzyProductIDSuzy: "noumfmlrqxxvsuox"),
        SuzyPurchaseItemSuzy(DeserialAmountSuzy: 2850, suzyPriceLabelSuzy: "sPkvK91d8OJmL7y0dI8bnW23qEw/6fOtomkDhhQLRJ/ECcG8Lg==", suzyProductIDSuzy: "naksbfuhssxvsurg"),
        SuzyPurchaseItemSuzy(DeserialAmountSuzy: 5150, suzyPriceLabelSuzy: "ZdYBJu+ay2oqRTteDON/G2FUa5DsJoWmBkHZM2PI5y1IAtdccw==", suzyProductIDSuzy: "zwylcqfbzaasysqi"),
        SuzyPurchaseItemSuzy(DeserialAmountSuzy: 10800, suzyPriceLabelSuzy: "KUWyHPcijvl2s8tz1re8Ox//CLofyI/Y103sCya77vOjS35ClUk=", suzyProductIDSuzy: "bmwlhteruwffzbfe"),
        SuzyPurchaseItemSuzy(DeserialAmountSuzy: 29400, suzyPriceLabelSuzy: "m9Op3Im03uttqFAsgQSmr1CCN3lQdW++XQpqVdTT3AyQoO+Iph4=", suzyProductIDSuzy: "pmyojytfhxnjamxh"),
        SuzyPurchaseItemSuzy(DeserialAmountSuzy: 63700, suzyPriceLabelSuzy: "zmhNbKIJAGuxgI/CSo2NzIODPJR80lJs5iKJH8PVv9+ice3n0Y0=", suzyProductIDSuzy: "fpptzxlvbrzdhvqm")
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
        
        DeserialPreviewSuzy.image = SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "suzy_coin_glow")
        suzyHeaderPanelSuzy.addSubview(DeserialPreviewSuzy)
        
        view.addSubview(suzyGridViewSuzy)
        
        suzyBackActionBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyHeaderPanelSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyBalanceLabelSuzy.translatesAutoresizingMaskIntoConstraints = false
        DeserialPreviewSuzy.translatesAutoresizingMaskIntoConstraints = false
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
            
            DeserialPreviewSuzy.centerYAnchor.constraint(equalTo: suzyHeaderPanelSuzy.centerYAnchor),
            DeserialPreviewSuzy.trailingAnchor.constraint(equalTo: suzyHeaderPanelSuzy.trailingAnchor, constant: -20),
            DeserialPreviewSuzy.widthAnchor.constraint(equalTo: suzyHeaderPanelSuzy.heightAnchor, multiplier: 0.6),
            DeserialPreviewSuzy.heightAnchor.constraint(equalTo: DeserialPreviewSuzy.widthAnchor),
            
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
            suzyBalanceLabelSuzy.text = "My Gold : \(currentProfile.deseriali)"
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
        SuzyHudManagerSuzy.shared.suzyShowStatusLoadingSuzy(message: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "YF0imO6l7GGb40Bo4mUOK7M0vCc79LxJUJTWyjNRl/uxTqR7jj9UGgjFRqLcWGktVM5J1wc="))
        ZompassHeadingSuzy.shared.regionLocaleSuue(calendarDateSuue: product.suzyProductIDSuzy) { [weak self] ler in
                DispatchQueue.main.async {
                    SuzyHudManagerSuzy.shared.suzyHideLoadingSuzy()
                    
                    switch ler {
                    case .success(let success):
                        SuzySecureVaultSuzy.sharedSuzy.suzyUpdateMutableAttributesSuzy(DeserialSuzy: product.DeserialAmountSuzy)
                        self?.suzyRefreshCurrentGoldSuzy()
                        SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "Gained \(product.DeserialAmountSuzy) Coins", isSuccess: true)
                    case .failure(let failure):
                        SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: failure.localizedDescription, isSuccess: false)
                    }
                    
                }
            }

    }
   
}
