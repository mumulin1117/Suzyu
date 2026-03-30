//
//  SuzyAcknowledgePolicyViewControllerSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/20.
//

import UIKit

final class SuzyAcknowledgePolicyViewControllerSuzy: UIViewController {
    
     var suzyDraftProfileSuzy: SuzyUserProfileSuzy?

    // MARK: - UI Configuration Suzy (Data Structure)
   
    private struct SuzyPolicyDetailSuzy {
        let suzyTitleSuzy: String
        let suzySubSuzy: String
    }
    
    private let suzyPolicyDatasSuzy = [
        SuzyPolicyDetailSuzy(suzyTitleSuzy: "Be Yourself", suzySubSuzy: "Authenticity Is The Key To Real Connection"),
        SuzyPolicyDetailSuzy(suzyTitleSuzy: "Be Kind", suzySubSuzy: "Help Us Create A Safe And Respectful Space"),
        SuzyPolicyDetailSuzy(suzyTitleSuzy: "Respect Diversity", suzySubSuzy: "Treat Every User With Dignity"),
        SuzyPolicyDetailSuzy(suzyTitleSuzy: "18+ Only", suzySubSuzy: "Strictly For Adults. No Minors Allowed"), // 匹配年龄选择页逻辑
        SuzyPolicyDetailSuzy(suzyTitleSuzy: "Stay Informed", suzySubSuzy: "Review Our Privacy Agreement Beforestarting")
    ]

   
    private let suzyMainScrollSuzy: UIScrollView = {
        let scrollSuzy = UIScrollView()
        scrollSuzy.isScrollEnabled = false
        scrollSuzy.translatesAutoresizingMaskIntoConstraints = false
        return scrollSuzy
    }()
    
    private let suzyContentStackSuzy: UIStackView = {
        let stackSuzy = UIStackView()
        stackSuzy.axis = .vertical
        stackSuzy.spacing = 25
        stackSuzy.alignment = .leading
        stackSuzy.isLayoutMarginsRelativeArrangement = true
        stackSuzy.layoutMargins = UIEdgeInsets(top: 10, left: 30, bottom: 20, right: 30) // 整体页边距
        stackSuzy.translatesAutoresizingMaskIntoConstraints = false
        return stackSuzy
    }()
    
   
    private let suzyWelcomeLabelSuzy: UILabel = {
        let labelSuzy = UILabel()
        labelSuzy.text = "Welcome Suzyu 😘"
        labelSuzy.textColor = .white
       
        labelSuzy.font = UIFont(name: "Baskerville-Italic", size: 36) ?? .systemFont(ofSize: 36, weight: .bold)
        labelSuzy.textAlignment = .center
        labelSuzy.translatesAutoresizingMaskIntoConstraints = false
        return labelSuzy
    }()
    
    
    private let suzyPersonImageViewSuzy: UIImageView = {
        let ivSuzy = UIImageView()
        ivSuzy.image = SuzyArtToyVibeEngine.suzyfilterApplySuzy(assetManagerSuue: "Tnahakdio") // 需导入对应人物素材
        ivSuzy.contentMode = .scaleAspectFit
        ivSuzy.translatesAutoresizingMaskIntoConstraints = false
        return ivSuzy
    }()
    
   
    private let suzyAcceptButtonSuzy: UIButton = {
        let btnSuzy = UIButton(type: .custom)
        
        btnSuzy.setImage(SuzyArtToyVibeEngine.suzyfilterApplySuzy(assetManagerSuue: "completerdNiu"), for: .normal)
        btnSuzy.contentMode = .scaleAspectFit
        btnSuzy.translatesAutoresizingMaskIntoConstraints = false
        return btnSuzy
    }()

    // MARK: - Lifecycle Suzy

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        suzyBuildBackgroundViewSuzy()
        suzyBuildInterfaceSuzy()
        suzyApplyLayoutSuzy()
        suzyRegisterEventsSuzy()
    }
    
    
    
    func suzyPassRegistrationCacheSuzy(profileSuzy: SuzyUserProfileSuzy) {
        self.suzyDraftProfileSuzy = profileSuzy
    }
    
    private func suzyBuildBackgroundViewSuzy() {
        let imageViewSuzy = UIImageView(frame: self.view.bounds)
        imageViewSuzy.image = SuzyArtToyVibeEngine.suzyfilterApplySuzy(assetManagerSuue: "SuzyWelcomeBgSuzyELUA")
        imageViewSuzy.contentMode = .scaleAspectFill
        imageViewSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageViewSuzy)
        
        NSLayoutConstraint.activate([
            imageViewSuzy.topAnchor.constraint(equalTo: view.topAnchor),
            imageViewSuzy.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageViewSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageViewSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func suzyBuildInterfaceSuzy() {
        view.addSubview(suzyMainScrollSuzy)
        suzyMainScrollSuzy.addSubview(suzyContentStackSuzy)
       
        suzyContentStackSuzy.addArrangedSubview(suzyWelcomeLabelSuzy)
        let subTitleSuzy = UILabel()
        subTitleSuzy.text = "A few things to remember..."
        subTitleSuzy.textColor = .white.withAlphaComponent(0.6)
        subTitleSuzy.font = .systemFont(ofSize: 16)
        subTitleSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyContentStackSuzy.addArrangedSubview(subTitleSuzy)
        suzyContentStackSuzy.setCustomSpacing(40, after: subTitleSuzy) // 给列表留出空间
        
       
        for itemSuzy in suzyPolicyDatasSuzy {
            let rowStackSuzy = suzyCreatePolicyRowSuzy(itemSuzy)
            suzyContentStackSuzy.addArrangedSubview(rowStackSuzy)
        }
       
        view.addSubview(suzyPersonImageViewSuzy)
        view.addSubview(suzyAcceptButtonSuzy)
    }
    
    private func suzyApplyLayoutSuzy() {
        let wSuzy = UIScreen.main.bounds.width
        
        NSLayoutConstraint.activate([
           
            suzyMainScrollSuzy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            suzyMainScrollSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            suzyMainScrollSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            suzyMainScrollSuzy.bottomAnchor.constraint(equalTo: suzyPersonImageViewSuzy.topAnchor, constant: -5),
            
            suzyContentStackSuzy.topAnchor.constraint(equalTo: suzyMainScrollSuzy.topAnchor),
            suzyContentStackSuzy.leadingAnchor.constraint(equalTo: suzyMainScrollSuzy.leadingAnchor),
            suzyContentStackSuzy.trailingAnchor.constraint(equalTo: suzyMainScrollSuzy.trailingAnchor),
            suzyContentStackSuzy.bottomAnchor.constraint(equalTo: suzyMainScrollSuzy.bottomAnchor),
            suzyContentStackSuzy.widthAnchor.constraint(equalTo: suzyMainScrollSuzy.widthAnchor), // 强制不横向滚动
            
            suzyWelcomeLabelSuzy.centerXAnchor.constraint(equalTo: suzyContentStackSuzy.centerXAnchor),
            
           
            suzyPersonImageViewSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            suzyPersonImageViewSuzy.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            suzyPersonImageViewSuzy.widthAnchor.constraint(equalToConstant: wSuzy * 0.6), // 匹配 UI 比例
            suzyPersonImageViewSuzy.heightAnchor.constraint(equalToConstant: wSuzy * 0.45 * 1.2),
          
            suzyAcceptButtonSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            suzyAcceptButtonSuzy.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            suzyAcceptButtonSuzy.widthAnchor.constraint(equalToConstant: 160), // 匹配 UI 比例
            suzyAcceptButtonSuzy.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    // MARK: - Private Helper: Create Policy Row
    
    private func suzyCreatePolicyRowSuzy(_ itemSuzy: SuzyPolicyDetailSuzy) -> UIStackView {
        let rowStackSuzy = UIStackView()
        rowStackSuzy.axis = .horizontal
        rowStackSuzy.spacing = 15
        rowStackSuzy.alignment = .top
        rowStackSuzy.translatesAutoresizingMaskIntoConstraints = false
      
        let arrowIconSuzy = UIImageView()
        arrowIconSuzy.image = SuzyArtToyVibeEngine.suzyfilterApplySuzy(assetManagerSuue: "Vectorgreen")
        arrowIconSuzy.tintColor = .systemGreen
        arrowIconSuzy.contentMode = .scaleAspectFit
        arrowIconSuzy.translatesAutoresizingMaskIntoConstraints = false
        arrowIconSuzy.widthAnchor.constraint(equalToConstant: 20).isActive = true
        arrowIconSuzy.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        let textStackSuzy = UIStackView()
        textStackSuzy.axis = .vertical
        textStackSuzy.spacing = 2
        textStackSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabelSuzy = UILabel()
        titleLabelSuzy.text = itemSuzy.suzyTitleSuzy
        titleLabelSuzy.textColor = .white
        titleLabelSuzy.font = .systemFont(ofSize: 18, weight: .semibold)
        titleLabelSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        let subLabelSuzy = UILabel()
        subLabelSuzy.text = itemSuzy.suzySubSuzy
        subLabelSuzy.textColor = .white.withAlphaComponent(0.6)
        subLabelSuzy.font = .systemFont(ofSize: 14)
        subLabelSuzy.numberOfLines = 0
        subLabelSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        textStackSuzy.addArrangedSubview(titleLabelSuzy)
        textStackSuzy.addArrangedSubview(subLabelSuzy)
        
        rowStackSuzy.addArrangedSubview(arrowIconSuzy)
        rowStackSuzy.addArrangedSubview(textStackSuzy)
        
        return rowStackSuzy
    }
    
 
    private func suzyRegisterEventsSuzy() {
        
        suzyAcceptButtonSuzy.addTarget(self, action: #selector(handleSuzyAcceptTapSuzy), for: .touchUpInside)
    }
    
    @objc private func handleSuzyAcceptTapSuzy() {
        guard let profileSuzy = suzyDraftProfileSuzy else { return }
        
        AppDelegate.addToRoot()
    }
}
