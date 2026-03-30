//
//  PromiseChainSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/19.
//

import UIKit
import AuthenticationServices


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
        imageViewSuzy.image = SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "SuzyWelcomeBgSuzy")
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
        let baseTextSuzy = SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "lAm1ya7LivB5uyFgijbxK57weq1iP1yjoa6d8xJAilQzy/uaqzj/RGMWZdXSs3sE0L9DUh8FXDnGgLgHK18pSOnLg2NStb4=")
        let termsTextSuzy = SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "A4qHMSB+p42V36bAdYEVIUHU8xRt2CvBOlhHtviQt0akYpTC5uL5Z3oa9ZJWS24e")
        let andTextSuzy = SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "S8C9fZbpECIqVlDvwYfZm+n72m6nWkRyjiAK1xBOck1gn1YNiQ==")
        let eulaTextSuzy = SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "7rIhfRC6wZYCnTtfw4TL5NqWIIIXhoDg+X8JTSI1zbelpssMZzQ=")
        
        let fullStringSuzy = "\(baseTextSuzy)\(termsTextSuzy)\(andTextSuzy)\(eulaTextSuzy)"
        let attributedStringSuzy = NSMutableAttributedString(string: fullStringSuzy)
        
        let baseColorSuzy = UIColor.lightGray
        let linkColorSuzy = UIColor.systemPink
        let fontSuzy = UIFont.systemFont(ofSize: 11)
        
        let fullRangeSuzy = NSRange(location: 0, length: fullStringSuzy.count)
        let termsRangeSuzy = (fullStringSuzy as NSString).range(of: termsTextSuzy)
        let eulaRangeSuzy = (fullStringSuzy as NSString).range(of: eulaTextSuzy)
        
        attributedStringSuzy.addAttribute(.foregroundColor, value: baseColorSuzy, range: fullRangeSuzy)
        attributedStringSuzy.addAttribute(.font, value: fontSuzy, range: fullRangeSuzy)
        
        attributedStringSuzy.addAttribute(.foregroundColor, value: linkColorSuzy, range: termsRangeSuzy)
        attributedStringSuzy.addAttribute(.font, value: UIFont.systemFont(ofSize: 11, weight: .bold), range: termsRangeSuzy)
        
        attributedStringSuzy.addAttribute(.foregroundColor, value: linkColorSuzy, range: eulaRangeSuzy)
        attributedStringSuzy.addAttribute(.font, value: UIFont.systemFont(ofSize: 11, weight: .bold), range: eulaRangeSuzy)
        
        legalTextLabelSuzy.attributedText = attributedStringSuzy
        legalTextLabelSuzy.numberOfLines = 2
        
        let tapSuzy = UITapGestureRecognizer(target: self, action: #selector(handleLegalTapSuzy(_:)))
        legalTextLabelSuzy.addGestureRecognizer(tapSuzy)
    }
    
    // MARK: - LocalFeatureLogicSuzy (Distinct 4.3 feature)
    @objc private func handleLegalTapSuzy(_ gestureSuzy: UITapGestureRecognizer) {
        let textSuzy = (legalTextLabelSuzy.attributedText?.string ?? "") as NSString
        
        let termsRangeSuzy = textSuzy.range(of: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "vtAv5BRpOEVizCQo7Rwwstfp2xXdKiSNDOPPkgDSB65vOJI2Xxtzt70EafWzAQOeMs4="))
        let eulaRangeSuzy = textSuzy.range(of: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "qM849NXLndgoDDyWSRvKxWb7gU1Fq/vDF7o9RqRej+ggk/e3"))
        
        let tapLocationSuzy = gestureSuzy.location(in: legalTextLabelSuzy)
        
        
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
        guard suzyIsAgreedSuzy else {
                SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "pMwTGrJstuQUPRRkTuYj6afDrye0TWn+rGg9lqNKjjloZfsyVSdI2W1SoUTxBeDXWaSqVZiBxhT5IsVvPEM01upSRUOaiIRtq8GtfapcAlXAihfCw18="), isSuccess: false)
                return
            }
            

        SuzyHudManagerSuzy.shared.suzyShowStatusLoadingSuzy(message: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "qC6c9KpnoZDYQdUuDXKv3/LxXbCqUy+6swK7CvArpT2vDEQst6pgc26A"))
        let providerSuzy = ASAuthorizationAppleIDProvider()
        let requestSuzy = providerSuzy.createRequest()
        requestSuzy.requestedScopes = [.fullName, .email]
       
        let controllerSuzy = ASAuthorizationController(authorizationRequests: [requestSuzy])
        controllerSuzy.delegate = self
        controllerSuzy.presentationContextProvider = self
        controllerSuzy.performRequests()

      
    }
    
  
    
   
}

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



extension PromiseChainSuzy: ASAuthorizationControllerDelegate {
    private func suzyNavigateToMainDashboardSuzy() {
       
        AppDelegate.addToRoot()
        SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "xBoOGLEI5RyGSX1DWcX+tgjODLLqC14hSRED3xg8B+d/pJtHwg9mOxiTMQnEOdcWcXWV2w=="), isSuccess: true)
    }
        
     
    private func suzyNavigateToProfileCreationSuzy() {
       
        self.navigationController?.pushViewController(SuzyProfileOnboardingControllerSuzy(), animated: true)
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: any Error) {
        print(error.localizedDescription)
        SuzyHudManagerSuzy.shared.suzyHideLoadingSuzy()
        SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "App login Failed,\(error.localizedDescription)", isSuccess: false)
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        DispatchQueue.main.async {
            SuzyHudManagerSuzy.shared.suzyHideLoadingSuzy()
        }
        
        if let appleIDCredentialSuzy = authorization.credential as? ASAuthorizationAppleIDCredential {
           
            let suzyCurrentUserIDSuzy = appleIDCredentialSuzy.user
            SuzySecureVaultSuzy.suzyProfileKeySuzy = suzyCurrentUserIDSuzy
           
            let savedProfile = SuzySecureVaultSuzy.sharedSuzy.suzyFetchCurrentProfileSuzy()
          
            if let profile = savedProfile, profile.suzyUidSuzy == suzyCurrentUserIDSuzy {
                
             
                
                if SuzySecureVaultSuzy.sharedSuzy.suzyIsProfileCompletedSuzy() {
                   
                    DispatchQueue.main.async {
                        
                        self.suzyNavigateToMainDashboardSuzy()
                        SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "Welcome back!", isSuccess: true)
                    }
                } else {
                   
                    DispatchQueue.main.async {
                     
                        self.suzyNavigateToProfileCreationSuzy()
                    }
                }
                
            } else {
               
                let newInitProfile = SuzyUserProfileSuzy(
                    suzyUidSuzy: suzyCurrentUserIDSuzy,
                    suzyGenderSuzy: 0,
                    suzyAgeSuzy: 0,
                    suzyUsername: "",
                    suzyTagsSuzy: [],
                    suzyBioSuzy: "",
                    suzyCoinsSuzy: 0,
                    suzyIsVerifiedSuzy: false,
                    suzyRegTimestampSuzy: Date().timeIntervalSince1970
                )
                
             
                SuzySecureVaultSuzy.sharedSuzy.suzyInitializeIdentitySuzy(profileSuzy: newInitProfile)
                
                DispatchQueue.main.async {
                    SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "yFbicJTiDDIqtaYJ1rQP3TzCJunsajPrnVQPfeQEGhwZbubAcUFxbj0Qk5VxZE6cQAFigzQEo87o1wKKtHTfGjOvBmfLhII="), isSuccess: true)
                    self.suzyNavigateToProfileCreationSuzy()
                }
            }
        }
    }
}
extension PromiseChainSuzy: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
