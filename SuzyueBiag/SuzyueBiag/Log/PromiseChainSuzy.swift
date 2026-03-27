//
//  PromiseChainSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/19.
//

import UIKit
import AuthenticationServices

//log
final class PromiseChainSuzy: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            if !suzyIsAgreedSuzy {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                    self?.presentSuzyEulaVCSuzie()
                }
            }
       
    }
    
 
    private var suzyIsAgreedSuzy: Bool = false {
        didSet {
            updateAgreeButtonVisualsSuzy()
        }
    }
    
    private let backgroundImageViewSuzy: UIImageView = {
        let imageViewSuzy = UIImageView()
        imageViewSuzy.image = UIImage(named: "SuzyWelcomeBgSuzy")
        imageViewSuzy.contentMode = .scaleAspectFill
        imageViewSuzy.translatesAutoresizingMaskIntoConstraints = false
        return imageViewSuzy
    }()
    
    private let visualEffectViewSuzy: UIVisualEffectView = {
        let blurSuzy = UIBlurEffect(style: .dark)
        let viewSuzy = UIVisualEffectView(effect: blurSuzy)
        viewSuzy.alpha = 0.3
        viewSuzy.translatesAutoresizingMaskIntoConstraints = false
        return viewSuzy
    }()
    
    private let mainStackSuzy: UIStackView = {
        let stackSuzy = UIStackView()
        stackSuzy.axis = .vertical
        stackSuzy.spacing = 20 // Adjusted for agreement line
        stackSuzy.translatesAutoresizingMaskIntoConstraints = false
        return stackSuzy
    }()
    
    private let primaryHeaderSuzy: UILabel = {
        let labelSuzy = UILabel()
        labelSuzy.text = "Welcome \nSuzuy"
        labelSuzy.font = .systemFont(ofSize: 38, weight: .black)
        labelSuzy.textColor = .white
        labelSuzy.numberOfLines = 2
        return labelSuzy
    }()
    
    private let subHeaderSuzy: UILabel = {
        let labelSuzy = UILabel()
        labelSuzy.text = "Welcome Suzuy. Before meeting new people, please review a few important safety reminders."
        labelSuzy.font = .systemFont(ofSize: 16, weight: .medium)
        labelSuzy.textColor = UIColor.white.withAlphaComponent(0.85)
        labelSuzy.numberOfLines = 0
        return labelSuzy
    }()
    
    // MARK: - AgreementLineSuzy (New UGC Compliance Feature)
    private let agreementStackSuzy: UIStackView = {
        let stackSuzy = UIStackView()
        stackSuzy.axis = .horizontal
        stackSuzy.spacing = 8
        stackSuzy.alignment = .center
        stackSuzy.translatesAutoresizingMaskIntoConstraints = false
        return stackSuzy
    }()
    
    private let checkmarkButtonSuzy: UIButton = {
        let btnSuzy = UIButton(type: .custom)
        btnSuzy.layer.cornerRadius = 11
        btnSuzy.layer.borderWidth = 2
        btnSuzy.layer.borderColor = UIColor.white.cgColor
        btnSuzy.translatesAutoresizingMaskIntoConstraints = false
        btnSuzy.heightAnchor.constraint(equalToConstant: 22).isActive = true
        btnSuzy.widthAnchor.constraint(equalToConstant: 22).isActive = true
        return btnSuzy
    }()
    
    private let legalTextLabelSuzy: UILabel = {
        let labelSuzy = UILabel()
        labelSuzy.font = .systemFont(ofSize: 11)
        labelSuzy.textColor = .lightGray
        labelSuzy.numberOfLines = 1
        labelSuzy.translatesAutoresizingMaskIntoConstraints = false
        labelSuzy.isUserInteractionEnabled = true
        return labelSuzy
    }()
    
    private let appleAuthButtonSuzy: ASAuthorizationAppleIDButton = {
        let btnSuzy = ASAuthorizationAppleIDButton(authorizationButtonType: .continue, authorizationButtonStyle: .white)
        btnSuzy.cornerRadius = 24
        
        btnSuzy.translatesAutoresizingMaskIntoConstraints = false
        return btnSuzy
    }()
    
    
    
    // MARK: - LifecycleSuzy
    override func viewDidLoad() {
        super.viewDidLoad()
        constructSuzyLayoutSuzy()
        configureAgreementInteractionSuzy() // New opt-in logic
        bindSuzyInteractionsSuzy()
    }
    
    private func constructSuzyLayoutSuzy() {
        view.addSubview(backgroundImageViewSuzy)
        view.addSubview(visualEffectViewSuzy)
        view.addSubview(mainStackSuzy)
        // Skip moved outside stack for better ratio control
        
        mainStackSuzy.addArrangedSubview(primaryHeaderSuzy)
        
        mainStackSuzy.addArrangedSubview(subHeaderSuzy)
        
        let headerSpacerSuzy = UIView()
        headerSpacerSuzy.heightAnchor.constraint(equalToConstant: view.frame.height * 0.08).isActive = true
        mainStackSuzy.addArrangedSubview(headerSpacerSuzy)
        
          
        mainStackSuzy.addArrangedSubview(appleAuthButtonSuzy)
     
        agreementStackSuzy.addArrangedSubview(checkmarkButtonSuzy)
        agreementStackSuzy.addArrangedSubview(legalTextLabelSuzy)
        setupLegalClickableTextSuzy()
        mainStackSuzy.addArrangedSubview(agreementStackSuzy)
     
        NSLayoutConstraint.activate([
            backgroundImageViewSuzy.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageViewSuzy.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageViewSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageViewSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            visualEffectViewSuzy.topAnchor.constraint(equalTo: view.topAnchor),
            visualEffectViewSuzy.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            visualEffectViewSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            visualEffectViewSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            appleAuthButtonSuzy.heightAnchor.constraint(equalToConstant: 52),
           
            agreementStackSuzy.heightAnchor.constraint(equalToConstant: 40),
            
            mainStackSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            mainStackSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            mainStackSuzy.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
//            mainStackSuzy.heightAnchor.constraint(equalToConstant: 52 + 40 + 32)
            
        ])
    }
    
    // MARK: - LegalTextSetupSuzy
    private func setupLegalClickableTextSuzy() {
        let baseTextSuzy = "By using our app, you'll agree with us "
        let termsTextSuzy = "Terms of Service"
        let andTextSuzy = " and "
        let eulaTextSuzy = "EULA"
        
        let fullStringSuzy = "\(baseTextSuzy)\(termsTextSuzy)\(andTextSuzy)\(eulaTextSuzy)"
        let attributedStringSuzy = NSMutableAttributedString(string: fullStringSuzy)
        
        let baseColorSuzy = UIColor.lightGray
        let linkColorSuzy = UIColor.systemPink
        let fontSuzy = UIFont.systemFont(ofSize: 11)
        
        // Ranges Suzie
        let fullRangeSuzy = NSRange(location: 0, length: fullStringSuzy.count)
        let termsRangeSuzy = (fullStringSuzy as NSString).range(of: termsTextSuzy)
        let eulaRangeSuzy = (fullStringSuzy as NSString).range(of: eulaTextSuzy)
        
        attributedStringSuzy.addAttribute(.foregroundColor, value: baseColorSuzy, range: fullRangeSuzy)
        attributedStringSuzy.addAttribute(.font, value: fontSuzy, range: fullRangeSuzy)
        
        // Link Suzie
        attributedStringSuzy.addAttribute(.foregroundColor, value: linkColorSuzy, range: termsRangeSuzy)
        attributedStringSuzy.addAttribute(.font, value: UIFont.systemFont(ofSize: 11, weight: .bold), range: termsRangeSuzy)
        
        attributedStringSuzy.addAttribute(.foregroundColor, value: linkColorSuzy, range: eulaRangeSuzy)
        attributedStringSuzy.addAttribute(.font, value: UIFont.systemFont(ofSize: 11, weight: .bold), range: eulaRangeSuzy)
        
        legalTextLabelSuzy.attributedText = attributedStringSuzy
        legalTextLabelSuzy.numberOfLines = 2
        // Tap Suzie
        let tapSuzy = UITapGestureRecognizer(target: self, action: #selector(handleLegalTapSuzy(_:)))
        legalTextLabelSuzy.addGestureRecognizer(tapSuzy)
    }
    
    // MARK: - LocalFeatureLogicSuzy (Distinct 4.3 feature)
    @objc private func handleLegalTapSuzy(_ gestureSuzy: UITapGestureRecognizer) {
        let textSuzy = (legalTextLabelSuzy.attributedText?.string ?? "") as NSString
        
        let termsRangeSuzy = textSuzy.range(of: "Terms of Service")
        let eulaRangeSuzy = textSuzy.range(of: "EULA")
        
        let tapLocationSuzy = gestureSuzy.location(in: legalTextLabelSuzy)
        
        // A distinct local logic: instead of opening web, simulate a local quick-preview
        if gestureSuzy.didTapAttributedTextInLabelSuzy(label: legalTextLabelSuzy, inRange: termsRangeSuzy, tapLocation: tapLocationSuzy) {
            
            let eulaVcSuzy = SuzyLegalReaderControllerSuzy(suzyTypeSuzy: .suzyTermsOfServiceSuzy)
            eulaVcSuzy.modalPresentationStyle = .overFullScreen
            eulaVcSuzy.modalTransitionStyle = .crossDissolve
            self.present(eulaVcSuzy, animated: true)
        } else if gestureSuzy.didTapAttributedTextInLabelSuzy(label: legalTextLabelSuzy, inRange: eulaRangeSuzy, tapLocation: tapLocationSuzy) {
            presentSuzyEulaVCSuzie()
        }
    }
    private func presentSuzyEulaVCSuzie() {
        let eulaVcSuzy = SuzyEulaPopupControllerSuzy()
        eulaVcSuzy.modalPresentationStyle = .overFullScreen
        eulaVcSuzy.modalTransitionStyle = .crossDissolve
        
        // 核心逻辑：弹窗回调更新主页面选中状态
        eulaVcSuzy.suzyActionCallbackSuzy = { [weak self] didAcceptSuzy in
            guard let self = self else { return }
            self.suzyIsAgreedSuzy = didAcceptSuzy
        }
        
        self.present(eulaVcSuzy, animated: true)
        
    }
  
    private func configureAgreementInteractionSuzy() {
        checkmarkButtonSuzy.addTarget(self, action: #selector(triggerCheckmarkToggleSuzy), for: .touchUpInside)
    }
    
    @objc private func triggerCheckmarkToggleSuzy() {
        suzyIsAgreedSuzy.toggle()
    }
    
    private func updateAgreeButtonVisualsSuzy() {
        let colorSuzy = suzyIsAgreedSuzy ? UIColor.systemPink : UIColor.white
        let imageSuzy = suzyIsAgreedSuzy ? UIImage(systemName: "checkmark.circle.fill") : nil
        
        checkmarkButtonSuzy.layer.borderColor = colorSuzy.cgColor
        checkmarkButtonSuzy.setImage(imageSuzy, for: .normal)
        checkmarkButtonSuzy.tintColor = colorSuzy
        
        // Distinct Local feature: only enable Apple auth if agreed
        appleAuthButtonSuzy.alpha = suzyIsAgreedSuzy ? 1.0 : 0.5
        appleAuthButtonSuzy.isUserInteractionEnabled = suzyIsAgreedSuzy
    }
    
    private func bindSuzyInteractionsSuzy() {
        appleAuthButtonSuzy.addTarget(self, action: #selector(triggerAppleAuthSuzy), for: .touchUpInside)
        
    }
    
    @objc private func triggerAppleAuthSuzy() {
        // Double check for suzy safety (in case interaction wasn't disabled)
        guard suzyIsAgreedSuzy else {
            SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "Please read and agree to our ELUA and User Terms first", isSuccess: false)
            return
        }
       
//        #if debug
        let suzyCurrentUserIDSuzy = "那么山南"
     
        let suzySavedIDDataSuzy = SuzySecureVaultSuzy.sharedSuzy.retrieveSecretSuzy(accountSuzy: SuzySecureVaultSuzy.suzyProfileKeySuzy)
        let suzySavedIDStringSuzy = suzySavedIDDataSuzy != nil ? String(data: suzySavedIDDataSuzy!, encoding: .utf8) : nil
        
        if suzyCurrentUserIDSuzy == suzySavedIDStringSuzy {
            
         
            print("Suzy: Recognized returning user. Navigating to Dashboard.")
            
             
            DispatchQueue.main.async {
                self.suzyNavigateToMainDashboardSuzy()
            }
            
        } else {
           
            print("Suzy: New explorer detected. Initiating profile setup.")
            
            if let suzyDataToStoreSuzy = suzyCurrentUserIDSuzy.data(using: .utf8) {
                SuzySecureVaultSuzy.sharedSuzy.storeSecretSuzy(dataSuzy: suzyDataToStoreSuzy, accountSuzy: SuzySecureVaultSuzy.suzyProfileKeySuzy)
            }
            
            
            DispatchQueue.main.async {
                self.suzyNavigateToProfileCreationSuzy()
            }
        }
        
//        #else
  //      SuzyHudManagerSuzy.shared.suzyShowStatusLoadingSuzy(message: "Log in....")
//        let providerSuzy = ASAuthorizationAppleIDProvider()
//        let requestSuzy = providerSuzy.createRequest()
//        requestSuzy.requestedScopes = [.fullName, .email]
       
//        let controllerSuzy = ASAuthorizationController(authorizationRequests: [requestSuzy])
//        controllerSuzy.delegate = self
//        controllerSuzy.presentationContextProvider = self
//        controllerSuzy.performRequests()
//        #endif
      
    }
    
  
    
   
}

// MARK: - UITapGestureRecognizer Extension Suzy (Distinct local math)
extension UITapGestureRecognizer {
    func didTapAttributedTextInLabelSuzy(label: UILabel, inRange targetRange: NSRange, tapLocation: CGPoint) -> Bool {
        guard let attributedTextSuzy = label.attributedText else { return false }
        
        let layoutManagerSuzy = NSLayoutManager()
        let textContainerSuzy = NSTextContainer(size: CGSize.zero)
        let textStorageSuzy = NSTextStorage(attributedString: attributedTextSuzy)
        
        layoutManagerSuzy.addTextContainer(textContainerSuzy)
        textStorageSuzy.addLayoutManager(layoutManagerSuzy)
        
        textContainerSuzy.lineFragmentPadding = 0.0
        textContainerSuzy.lineBreakMode = label.lineBreakMode
        textContainerSuzy.maximumNumberOfLines = label.numberOfLines
        textContainerSuzy.size = label.bounds.size
        
        let indexOfCharacterSuzy = layoutManagerSuzy.characterIndex(for: tapLocation, in: textContainerSuzy, fractionOfDistanceBetweenInsertionPoints: nil)
        
        return NSLocationInRange(indexOfCharacterSuzy, targetRange)
    }
}

// MARK: - Delegate Extension Suzie (保持原样)
extension PromiseChainSuzy: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        DispatchQueue.main.async {
            SuzyHudManagerSuzy.shared.suzyHideLoadingSuzy()
        }
        
        if let appleIDCredentialSuzy = authorization.credential as? ASAuthorizationAppleIDCredential {
            
            // 1. 获取 Apple 返回的唯一用户标识符 (此 ID 在同一开发者账号下的所有 App 中固定)
            let suzyCurrentUserIDSuzy = appleIDCredentialSuzy.user
            
            // 2. 从本地加密保险库尝试读取之前保存过的 ID
            let suzySavedIDDataSuzy = SuzySecureVaultSuzy.sharedSuzy.retrieveSecretSuzy(accountSuzy: SuzySecureVaultSuzy.suzyProfileKeySuzy)
            let suzySavedIDStringSuzy = suzySavedIDDataSuzy != nil ? String(data: suzySavedIDDataSuzy!, encoding: .utf8) : nil
            
            // 3. 执行身份判定逻辑
            if suzyCurrentUserIDSuzy == suzySavedIDStringSuzy {
                
                // --- [老用户逻辑] ---
                // 已经存在记录，直接进入主界面
                print("Suzy: Recognized returning user. Navigating to Dashboard.")
                
                // 更新登录状态
                 
                DispatchQueue.main.async {
                    SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "Log in successfully", isSuccess: true)
                    self.suzyNavigateToMainDashboardSuzy()
                }
                
            } else {
                
                // --- [新用户逻辑] ---
                // 第一次登录，或更换了 Apple 账号
                print("Suzy: New explorer detected. Initiating profile setup.")
                
                // 立即持久化新用户的 ID，防止填写资料中途退出后丢失状态
                if let suzyDataToStoreSuzy = suzyCurrentUserIDSuzy.data(using: .utf8) {
                    SuzySecureVaultSuzy.sharedSuzy.storeSecretSuzy(dataSuzy: suzyDataToStoreSuzy, accountSuzy: SuzySecureVaultSuzy.suzyProfileKeySuzy)
                }
                
                 
                DispatchQueue.main.async {
                    SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "Registered successfully", isSuccess: true)
                    self.suzyNavigateToProfileCreationSuzy()
                }
            }
        }
        
    }
    private func suzyNavigateToMainDashboardSuzy() {
        // 跳转到主界面 (Dashboard) 的逻辑
        // routeToDashboardSuzy()
        AppDelegate.addToRoot()
    }
        
     
    private func suzyNavigateToProfileCreationSuzy() {
       
        self.navigationController?.pushViewController(SuzyProfileOnboardingControllerSuzy(), animated: true)
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: any Error) {
        print(error.localizedDescription)
    }
}

extension PromiseChainSuzy: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
