//
//  SuzyEulaPopupControllerSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/19.
//

import UIKit
//elua
final class SuzyEulaPopupControllerSuzy: UIViewController {
    
    var suzyActionCallbackSuzy: ((Bool) -> Void)?
    
    private let suzyContainerViewSuzy: UIView = {
        let viewSuzy = UIView()
        viewSuzy.backgroundColor = UIColor(red: 0.05, green: 0.0, blue: 0.15, alpha: 1.0)
        viewSuzy.layer.cornerRadius = 30
        viewSuzy.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        viewSuzy.translatesAutoresizingMaskIntoConstraints = false
        return viewSuzy
    }()
    
    private let suzyScrollWrapperSuzy: UIScrollView = {
        let scrollSuzy = UIScrollView()
        scrollSuzy.translatesAutoresizingMaskIntoConstraints = false
        return scrollSuzy
    }()
    
    private let suzyContentStackSuzy: UIStackView = {
        let stackSuzy = UIStackView()
        stackSuzy.axis = .vertical
        stackSuzy.spacing = 22
        stackSuzy.translatesAutoresizingMaskIntoConstraints = false
        return stackSuzy
    }()
    
    private let suzyHeaderLabelSuzy: UILabel = {
        let labelSuzy = UILabel()
        labelSuzy.text = "Safety, Terms, EULA & UserContent Acknowledgement"
        labelSuzy.font = .systemFont(ofSize: 26, weight: .black)
        labelSuzy.textColor = .white
        labelSuzy.numberOfLines = 0
        return labelSuzy
    }()
    
    private let suzyBodyTextLabelSuzy: UILabel = {
        let labelSuzy = UILabel()
        labelSuzy.text = """
        For safety reasons, Suzyu is strictly available to users 18 years of age or older. By tapping 'Accept', you confirm and certify that you are at least 18 years old.

        User Conduct & Zero Tolerance Policy:
        Suzyu enforces a zero tolerance policy toward objectionable content and abusive behavior. The following are strictly prohibited on the platform:
        • Sexual, explicit, or pornographic content.
        • Harassment, hate speech, threats, or abusive behavior.
        • Illegal activities or content that violates applicable laws.
        • Any behavior that may endanger the safety or well-being of other users.

        Monitoring & Enforcement:
        To ensure a safe environment, we employ both automated filters and human moderators to review reported content 24/7. 

        Reporting & Blocking:
        Users can report any violations or block offensive users instantly using the in-app tools. Any content or behavior that violates these rules may be immediately removed, and the associated account may be permanently banned without prior notice.

        By proceeding, you acknowledge our guidelines for a safe experience. Legal & Safety.
        """
        labelSuzy.font = .systemFont(ofSize: 15, weight: .medium)
        labelSuzy.textColor = UIColor.white.withAlphaComponent(0.8)
        labelSuzy.numberOfLines = 0
        return labelSuzy
    }()
    
    private let suzyBottomButtonStackSuzy: UIStackView = {
        let stackSuzy = UIStackView()
        stackSuzy.axis = .horizontal
        stackSuzy.distribution = .fillEqually
        stackSuzy.spacing = 15
        stackSuzy.translatesAutoresizingMaskIntoConstraints = false
        return stackSuzy
    }()
    
    private let suzyRefuseBtnSuzy: UIButton = {
        let btnSuzy = UIButton(type: .system)
        btnSuzy.setTitle(SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "hOTbvStwtJ0FYqtUNPZxBdYVXP6rZ5VoAs7vJXBpy7QA1uj9WzE="), for: .normal)
        btnSuzy.setTitleColor(.white, for: .normal)
        btnSuzy.layer.borderWidth = 2
        btnSuzy.layer.borderColor = UIColor.white.cgColor
        btnSuzy.layer.cornerRadius = 28
        return btnSuzy
    }()
    
    private let suzyAcceptBtnSuzy: UIButton = {
        let btnSuzy = UIButton(type: .system)
        btnSuzy.setTitle(SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "/6jRVR6ytlqnNPL89py+rL7K0lP6sCzgDyvEvFaaQw+lW8zOBEE="), for: .normal)
        btnSuzy.setTitleColor(.black, for: .normal)
        btnSuzy.backgroundColor = .white
        btnSuzy.layer.cornerRadius = 28
        btnSuzy.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        return btnSuzy
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageViewSuzy = UIImageView.init(frame: self.view.bounds)
        imageViewSuzy.image = SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "SuzyWelcomeBgSuzyELUA")
        imageViewSuzy.contentMode = .scaleAspectFill
        imageViewSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageViewSuzy)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        setupSuzyHierarchySuzy()
        setupSuzyConstraintsSuzy()
        setupSuzyActionsSuzy()
    }
    
    private func setupSuzyHierarchySuzy() {
        view.addSubview(suzyContainerViewSuzy)
        suzyContainerViewSuzy.addSubview(suzyScrollWrapperSuzy)
        suzyScrollWrapperSuzy.addSubview(suzyContentStackSuzy)
        
        suzyContentStackSuzy.addArrangedSubview(suzyHeaderLabelSuzy)
        suzyContentStackSuzy.addArrangedSubview(suzyBodyTextLabelSuzy)
        
        suzyContainerViewSuzy.addSubview(suzyBottomButtonStackSuzy)
        suzyBottomButtonStackSuzy.addArrangedSubview(suzyRefuseBtnSuzy)
        suzyBottomButtonStackSuzy.addArrangedSubview(suzyAcceptBtnSuzy)
    }
    
    private func setupSuzyConstraintsSuzy() {
        let hSuzy = UIScreen.main.bounds.height
        NSLayoutConstraint.activate([
            suzyContainerViewSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            suzyContainerViewSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            suzyContainerViewSuzy.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            suzyContainerViewSuzy.heightAnchor.constraint(equalToConstant: hSuzy * 0.8),
            
            suzyScrollWrapperSuzy.topAnchor.constraint(equalTo: suzyContainerViewSuzy.topAnchor, constant: 30),
            suzyScrollWrapperSuzy.leadingAnchor.constraint(equalTo: suzyContainerViewSuzy.leadingAnchor, constant: 25),
            suzyScrollWrapperSuzy.trailingAnchor.constraint(equalTo: suzyContainerViewSuzy.trailingAnchor, constant: -25),
            suzyScrollWrapperSuzy.bottomAnchor.constraint(equalTo: suzyBottomButtonStackSuzy.topAnchor, constant: -20),
            
            suzyContentStackSuzy.topAnchor.constraint(equalTo: suzyScrollWrapperSuzy.topAnchor),
            suzyContentStackSuzy.leadingAnchor.constraint(equalTo: suzyScrollWrapperSuzy.leadingAnchor),
            suzyContentStackSuzy.trailingAnchor.constraint(equalTo: suzyScrollWrapperSuzy.trailingAnchor),
            suzyContentStackSuzy.bottomAnchor.constraint(equalTo: suzyScrollWrapperSuzy.bottomAnchor),
            suzyContentStackSuzy.widthAnchor.constraint(equalTo: suzyScrollWrapperSuzy.widthAnchor),
            
            suzyBottomButtonStackSuzy.leadingAnchor.constraint(equalTo: suzyContainerViewSuzy.leadingAnchor, constant: 25),
            suzyBottomButtonStackSuzy.trailingAnchor.constraint(equalTo: suzyContainerViewSuzy.trailingAnchor, constant: -25),
            suzyBottomButtonStackSuzy.bottomAnchor.constraint(equalTo: suzyContainerViewSuzy.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            suzyBottomButtonStackSuzy.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func setupSuzyActionsSuzy() {
        suzyRefuseBtnSuzy.addTarget(self, action: #selector(handleSuzyRefusalSuzy), for: .touchUpInside)
        suzyAcceptBtnSuzy.addTarget(self, action: #selector(handleSuzyAcceptanceSuzy), for: .touchUpInside)
    }
    
    @objc private func handleSuzyRefusalSuzy() {
        dismiss(animated: true) { self.suzyActionCallbackSuzy?(false) }
    }
    
    @objc private func handleSuzyAcceptanceSuzy() {
        dismiss(animated: true) { self.suzyActionCallbackSuzy?(true) }
    }
}
