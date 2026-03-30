//
//  SuzyActioningSheetVCSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/25.
//

import UIKit

final class SuzyActioningSheetVCSuzy: UIViewController {
    
    var pathUID:String?
  
    private let suzyDimmingBackdropSuzy = UIView()
    private let suzyContainerStackSuzy = UIStackView()
    
    private let suzyBlockActionBtnSuzy = UIButton(type: .custom)
    private let suzyReportActionBtnSuzy = UIButton(type: .custom)
    private let suzyCancelActionBtnSuzy = UIButton(type: .custom)
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        suzyInitializeReportingInterfaceSuzy()
    }
    
    private func suzyInitializeReportingInterfaceSuzy() {
        view.backgroundColor = .clear
        
        suzyDimmingBackdropSuzy.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        suzyDimmingBackdropSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyDimmingBackdropSuzy)
       
        suzyContainerStackSuzy.axis = .vertical
        suzyContainerStackSuzy.spacing = 12
        suzyContainerStackSuzy.distribution = .fillEqually
        suzyContainerStackSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyContainerStackSuzy)
        
        // 3. Button Configuration
        suzyConfigureStandardButtonSuzy(suzyBlockActionBtnSuzy,
                                      titleSuzy:SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "JUNLcdXr5PDwTxX7mAkgHwBkekqIIpm2565aMpyHHmOhTVAXtCmywxGfUpr/uNI=") ,
                                      iconNameSuzy: "minus.circle",
                                      isPurpleSuzy: false)
        
        suzyConfigureStandardButtonSuzy(suzyReportActionBtnSuzy,
                                      titleSuzy: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "TU5e48uAj+YtAjF5huzgcx/vNz6VAjab0kPlGIaR6joYNeFYfHw="),
                                      iconNameSuzy: "exclamationmark.circle",
                                      isPurpleSuzy: false)
        
        suzyConfigureStandardButtonSuzy(suzyCancelActionBtnSuzy,
                                      titleSuzy: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "l9VN+th6xh3V0U/Sxsi25uFS469zBmHIuRXwGy5tBqK8rL0C7es="),
                                      iconNameSuzy: nil,
                                      isPurpleSuzy: true)
        
   
        suzyContainerStackSuzy.addArrangedSubview(suzyBlockActionBtnSuzy)
        suzyContainerStackSuzy.addArrangedSubview(suzyReportActionBtnSuzy)
        suzyContainerStackSuzy.addArrangedSubview(suzyCancelActionBtnSuzy)
     
        suzyBlockActionBtnSuzy.addTarget(self, action: #selector(suzyHandleBlockConfirmedSuzy), for: .touchUpInside)
        suzyReportActionBtnSuzy.addTarget(self, action: #selector(suzyHandleReportTransitionSuzy), for: .touchUpInside)
        NSLayoutConstraint.activate([
            suzyDimmingBackdropSuzy.topAnchor.constraint(equalTo: view.topAnchor),
            suzyDimmingBackdropSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            suzyDimmingBackdropSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            suzyDimmingBackdropSuzy.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            suzyContainerStackSuzy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            suzyContainerStackSuzy.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            suzyContainerStackSuzy.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            suzyBlockActionBtnSuzy.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        // Setup Actions
        suzyCancelActionBtnSuzy.addTarget(self, action: #selector(suzyDismissReportingViewSuzy), for: .touchUpInside)
    }
    
    private func suzyConfigureStandardButtonSuzy(_ suzyBtn: UIButton, titleSuzy: String, iconNameSuzy: String?, isPurpleSuzy: Bool) {
        suzyBtn.layer.cornerRadius = 16
        suzyBtn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        
        if isPurpleSuzy {
            suzyBtn.backgroundColor = UIColor(red: 0.47, green: 0.09, blue: 1, alpha: 1)
            suzyBtn.setTitleColor(.white, for: .normal)
        } else {
            suzyBtn.backgroundColor = .white
            suzyBtn.setTitleColor(.black, for: .normal)
            
            if let icon = iconNameSuzy {
                let suzyConfig = UIImage.SymbolConfiguration(pointSize: 18, weight: .bold)
                let suzyImg = UIImage(systemName: icon, withConfiguration: suzyConfig)?.withTintColor(.red, renderingMode: .alwaysOriginal)
                suzyBtn.setImage(suzyImg, for: .normal)
                suzyBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
            }
        }
        
        suzyBtn.setTitle(titleSuzy, for: .normal)
    }
    
    @objc private func suzyDismissReportingViewSuzy() {
        self.dismiss(animated: true)
    }
    
    // MARK: - Interactive Actions Suzy

    @objc private func suzyHandleBlockConfirmedSuzy() {
        
        guard let uidd = self.pathUID  else{
            return
        }
        SuzyStaticDataCenterSuzy.suzyMockUserLibrarySuzy.removeAll { $0.suzyIdentifierSuzy == uidd }
        SuzyMessageCacheManager.shared.conversations.removeAll { $0.userInfo.suzyIdentifierSuzy == uidd }
        let suzyDataPackageSuzy: [String: Any] = ["suzyTargetID": uidd]
        self.dismiss(animated: false)
        NotificationCenter.default.post(name: NSNotification.Name("SuzySwitchToReportDetails"), object: suzyDataPackageSuzy)
        
       
        
    }

    @objc private func suzyHandleReportTransitionSuzy() {
       
        let suzyDetailVCSuzy = SuzyReportDetailVCSuzy()
       
        suzyDetailVCSuzy.modalPresentationStyle = .fullScreen
     
        self.present(suzyDetailVCSuzy, animated: true)
    }
}
