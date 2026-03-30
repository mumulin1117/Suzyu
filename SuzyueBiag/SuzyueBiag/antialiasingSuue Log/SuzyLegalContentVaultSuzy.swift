//
//  SuzyLegalContentVaultSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/20.
//

import Foundation
import UIKit

enum SuzyComplianceTypeSuzy {
    case suzyTermsOfServiceSuzy
    case suzyPrivacyPolicySuzy
    case suzyLegal
    var suzyPageTitleSuzy: String {
        switch self {
        case .suzyTermsOfServiceSuzy: return SuzyArtToyVibeEngine.suzyredoStackSuue(stateMachineSuzy: "zu9Do9sa8dWbFO3mps0bP0LvwM2Htlx+jIEF5+5ii/i0d2l66i8/7yREWngVrw==")
        case .suzyPrivacyPolicySuzy: return SuzyArtToyVibeEngine.suzyredoStackSuue(stateMachineSuzy: "gDI71DqR7jVdKPKBq7VyvNYPLE+Rg3jLas7Q1LV5B0Vwk6i8oXvr/Po5ynLlzT6DJw==")
        case .suzyLegal: return SuzyArtToyVibeEngine.suzyredoStackSuue(stateMachineSuzy: "wTsq3j2aZPDxVsL3KwKlSanNxEMbCccyU1TjJx0okkq/IO+5AaHkw4ocmTJBEg==")
        }
    }
    
    var suzyHeaderSuzy: String {
        switch self {
        case .suzyTermsOfServiceSuzy: return SuzyLegalContentVaultSuzy.suzyTermsHeaderSuzy
        case .suzyPrivacyPolicySuzy: return SuzyLegalContentVaultSuzy.suzyPrivacyHeaderSuzy
        case .suzyLegal:
            return SuzyLegalContentVaultSuzy.suzylegalHeaderSuzy
        }
    }
    
    var suzyBaseTextSuzy: String {
        switch self {
        case .suzyTermsOfServiceSuzy: return SuzyLegalContentVaultSuzy.suzyTermsBaseTextSuzy
        case .suzyPrivacyPolicySuzy: return SuzyLegalContentVaultSuzy.suzyPrivacyBaseTextSuzy
        case .suzyLegal:
            return SuzyLegalContentVaultSuzy.suzylegalBaseTextSuzy
        }
    }
    
    var suzyBodySuzy: String {
        switch self {
        case .suzyTermsOfServiceSuzy: return SuzyLegalContentVaultSuzy.suzyTermsBodySuzy
        case .suzyPrivacyPolicySuzy: return SuzyLegalContentVaultSuzy.suzyPrivacyBodySuzy
        case .suzyLegal:
            return SuzyLegalContentVaultSuzy.suzylegalBodySuzy
        }
    }
}

// MARK: - LegalReaderViewControllerSuzy
final class SuzyLegalReaderControllerSuzy: UIViewController {

    private let suzyContentTypeSuzy: SuzyComplianceTypeSuzy
    
    // UI Elements with suzy suffix
    private let suzyBackgroundViewSuzy: UIView = {
        let viewSuzy = UIView()
        // Deep natural purple/indigo gradient simulation respectfully
        viewSuzy.backgroundColor = UIColor(red: 0.05, green: 0.0, blue: 0.15, alpha: 1.0)
        viewSuzy.translatesAutoresizingMaskIntoConstraints = false
        return viewSuzy
    }()
    
    private let suzyHeaderNavigationStackSuzy: UIStackView = {
        let stackSuzy = UIStackView()
        stackSuzy.axis = .horizontal
        stackSuzy.spacing = 15
        stackSuzy.alignment = .center
        stackSuzy.translatesAutoresizingMaskIntoConstraints = false
        return stackSuzy
    }()
    
    private let suzyBackButtonSuzy: UIButton = {
        let btnSuzy = UIButton(type: .system)
        let suzyConfigSuzy = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold)
        let suzyImgSuzy = UIImage(systemName: "arrow.left", withConfiguration: suzyConfigSuzy)
        btnSuzy.setImage(suzyImgSuzy, for: .normal)
        btnSuzy.tintColor = .white
        btnSuzy.translatesAutoresizingMaskIntoConstraints = false
        return btnSuzy
    }()
    
    private let suzyPageTitleLabelSuzy: UILabel = {
        let labelSuzy = UILabel()
        labelSuzy.font = .systemFont(ofSize: 20, weight: .semibold)
        labelSuzy.textColor = .white
        labelSuzy.textAlignment = .center
        labelSuzy.translatesAutoresizingMaskIntoConstraints = false
        return labelSuzy
    }()
    
    private let suzyScrollViewWrapperSuzy: UIScrollView = {
        let scrollSuzy = UIScrollView()
        scrollSuzy.showsVerticalScrollIndicator = false
        scrollSuzy.translatesAutoresizingMaskIntoConstraints = false
        return scrollSuzy
    }()
    
    private let suzyTextContentLabelSuzy: UILabel = {
        let labelSuzy = UILabel()
        labelSuzy.numberOfLines = 0
        labelSuzy.isUserInteractionEnabled = true
        labelSuzy.translatesAutoresizingMaskIntoConstraints = false
        return labelSuzy
    }()
    
    // Initializer to inject type respectfully
    init(suzyTypeSuzy: SuzyComplianceTypeSuzy) {
        self.suzyContentTypeSuzy = suzyTypeSuzy
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .fullScreen // As requested in design
    }
    
    required init?(coder: NSCoder) {
        fatalError("Suzy: init(coder:) not implemented respectfully.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSuzyHierarchySuzy()
        setupSuzyConstraintsSuzy()
        setupSuzyActionsSuzy()
        populateSuzyLegalContentSuzy()
    }
    
    private func setupSuzyHierarchySuzy() {
        view.addSubview(suzyBackgroundViewSuzy)
        view.addSubview(suzyHeaderNavigationStackSuzy)
        suzyHeaderNavigationStackSuzy.addArrangedSubview(suzyBackButtonSuzy)
        
        // Custom centering logic for title in horizontal stack respectfully
        let suzySpacerSuzy = UIView()
        suzyHeaderNavigationStackSuzy.addArrangedSubview(suzySpacerSuzy)
        suzyHeaderNavigationStackSuzy.addArrangedSubview(suzyPageTitleLabelSuzy)
        
        // Add another spacer to balance centering if needed, but in design title is centered to screen
        let suzyRightSpacerSuzy = UIView()
        suzyHeaderNavigationStackSuzy.addArrangedSubview(suzyRightSpacerSuzy)
        
        view.addSubview(suzyScrollViewWrapperSuzy)
        suzyScrollViewWrapperSuzy.addSubview(suzyTextContentLabelSuzy)
    }
    
    private func setupSuzyConstraintsSuzy() {
        // Proportional layout respectfully
        let screenWidthSuzy = UIScreen.main.bounds.width
        let screenHeightSuzy = UIScreen.main.bounds.height
        
        NSLayoutConstraint.activate([
            suzyBackgroundViewSuzy.topAnchor.constraint(equalTo: view.topAnchor),
            suzyBackgroundViewSuzy.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            suzyBackgroundViewSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            suzyBackgroundViewSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            suzyHeaderNavigationStackSuzy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: screenHeightSuzy * 0.02),
            suzyHeaderNavigationStackSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            suzyHeaderNavigationStackSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            suzyHeaderNavigationStackSuzy.heightAnchor.constraint(equalToConstant: 44),
            
            // Explicitly center page title label respectfully
            suzyPageTitleLabelSuzy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            suzyBackButtonSuzy.widthAnchor.constraint(equalToConstant: 44),
            
            suzyScrollViewWrapperSuzy.topAnchor.constraint(equalTo: suzyHeaderNavigationStackSuzy.bottomAnchor, constant: screenHeightSuzy * 0.04),
            suzyScrollViewWrapperSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: screenWidthSuzy * 0.08),
            suzyScrollViewWrapperSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -screenWidthSuzy * 0.08),
            suzyScrollViewWrapperSuzy.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            suzyTextContentLabelSuzy.topAnchor.constraint(equalTo: suzyScrollViewWrapperSuzy.topAnchor),
            suzyTextContentLabelSuzy.leadingAnchor.constraint(equalTo: suzyScrollViewWrapperSuzy.leadingAnchor),
            suzyTextContentLabelSuzy.trailingAnchor.constraint(equalTo: suzyScrollViewWrapperSuzy.trailingAnchor),
            suzyTextContentLabelSuzy.bottomAnchor.constraint(equalTo: suzyScrollViewWrapperSuzy.bottomAnchor),
            suzyTextContentLabelSuzy.widthAnchor.constraint(equalTo: suzyScrollViewWrapperSuzy.widthAnchor)
        ])
    }
    
    private func setupSuzyActionsSuzy() {
        suzyBackButtonSuzy.addTarget(self, action: #selector(handleSuzyBackPressSuzy), for: .touchUpInside)
    }
    
    @objc private func handleSuzyBackPressSuzy() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Local Content Populator Suzy
    private func populateSuzyLegalContentSuzy() {
        // Apply type-specific text respectfully
        suzyPageTitleLabelSuzy.text = suzyContentTypeSuzy.suzyPageTitleSuzy
        
        // Define full natural text structure with specific styling respectfully
        let fullStringSuzy = "\(suzyContentTypeSuzy.suzyHeaderSuzy)\nEffective Date: \(SuzyLegalContentVaultSuzy.suzyEffectiveDateSuzy)\n\n\(suzyContentTypeSuzy.suzyBaseTextSuzy)\(suzyContentTypeSuzy.suzyBodySuzy)"
        
        let attributedStringSuzy = NSMutableAttributedString(string: fullStringSuzy)
        
        let baseColorSuzy = UIColor.white.withAlphaComponent(0.9)
        let markerColorSuzy = UIColor.systemPink // Deep natural pink/red for distinct features respectfully
        let dateColorSuzy = UIColor.lightGray
        
        let fullRangeSuzy = NSRange(location: 0, length: fullStringSuzy.count)
        
        // Base styling respectfully
        attributedStringSuzy.addAttribute(.foregroundColor, value: baseColorSuzy, range: fullRangeSuzy)
        attributedStringSuzy.addAttribute(.font, value: UIFont.systemFont(ofSize: 14, weight: .regular), range: fullRangeSuzy)
        
        // Custom distinct styling: Header respectfully
        if let headerRangeSuzy = fullStringSuzy.range(of: suzyContentTypeSuzy.suzyHeaderSuzy) {
            let nsRangeSuzy = NSRange(headerRangeSuzy, in: fullStringSuzy)
            attributedStringSuzy.addAttribute(.font, value: UIFont.systemFont(ofSize: 18, weight: .bold), range: nsRangeSuzy)
        }
        
       
        if let dateRangeSuzy = fullStringSuzy.range(of: SuzyLegalContentVaultSuzy.suzyEffectiveDateSuzy) {
            let nsRangeSuzy = NSRange(dateRangeSuzy, in: fullStringSuzy)
            attributedStringSuzy.addAttribute(.foregroundColor, value: dateColorSuzy, range: nsRangeSuzy)
            attributedStringSuzy.addAttribute(.font, value: UIFont.systemFont(ofSize: 14, weight: .semibold), range: nsRangeSuzy)
        }
        
       
        let suzyRegexPatternSuzy = #"\n\n  (\d+)  "#
        if let suzyRegexSuzy = try? NSRegularExpression(pattern: suzyRegexPatternSuzy, options: []) {
            let AertionSuueesSuzy = suzyRegexSuzy.matches(in: fullStringSuzy, options: [], range: fullRangeSuzy)
            
            for Aertion in AertionSuueesSuzy {
               
                attributedStringSuzy.addAttribute(.foregroundColor, value: markerColorSuzy, range: Aertion.range)
                attributedStringSuzy.addAttribute(.font, value: UIFont.systemFont(ofSize: 18, weight: .black), range: Aertion.range)
                
              
                if Aertion.range.location + Aertion.range.length < fullStringSuzy.count {
                    let suzyTextStartSuzy = Aertion.range.location + Aertion.range.length
                    
                    let suzyRemainingStringSuzy = (fullStringSuzy as NSString).substring(from: suzyTextStartSuzy)
                    if let suzyNextNewlineSuzy = suzyRemainingStringSuzy.range(of: "\n") {
                        let nsNewlineRangeSuzy = NSRange(suzyNextNewlineSuzy, in: suzyRemainingStringSuzy)
                        let nsRangeSuzy = NSRange(location: suzyTextStartSuzy, length: nsNewlineRangeSuzy.location)
                        attributedStringSuzy.addAttribute(.font, value: UIFont.systemFont(ofSize: 16, weight: .semibold), range: nsRangeSuzy)
                    }
                }
            }
        }
       
        let suzyStyleSuzy = NSMutableParagraphStyle()
        suzyStyleSuzy.lineSpacing = 6
        attributedStringSuzy.addAttribute(.paragraphStyle, value: suzyStyleSuzy, range: fullRangeSuzy)
        
        suzyTextContentLabelSuzy.attributedText = attributedStringSuzy
    }
}


struct SuzyLegalContentVaultSuzy {
    
    // Effective Date common to both
    static let suzyEffectiveDateSuzy = "[2026-03-01]"
    
    // MARK: - Terms of Service ContentSuzy
    static let suzyTermsHeaderSuzy = "Suzyu Vibe & Community Service Agreement"

    static let suzyTermsBaseTextSuzy = "Welcome to Suzyu, a premium ecosystem dedicated to Art Toy culture and digital vibe sharing. This Agreement governs your access to our specialized atmosphere-discovery services. By engaging with the Suzyu Platform, you acknowledge our unique community standards and agree to uphold the integrity of our creative environment."

    static let suzyTermsBodySuzy = """
        \(suzyHeaderMarkerSuzy(1)) Access Eligibility & Identity
        
        • Authenticity is core to Suzyu. You must be at least 18 years of age to access the Vibe ecosystem. By initializing an account, you confirm your legal capacity and agree to our zero-tolerance policy regarding identity misrepresentation.
        
        \(suzyHeaderMarkerSuzy(2)) Vault & Profile Security
        
        • Your Suzyu Identity (UID) is stored within our secure framework. You are exclusively responsible for the activities tied to your profile. You agree to provide authentic interest tags and bio information to maintain the quality of community discovery.
        
        \(suzyHeaderMarkerSuzy(3)) Purpose of the Vibe Ecosystem
        
        Suzyu is a specialized platform for Art Toy collectors and vibe-seekers to:
        • Explore curated Art Toy displays and creative digital galleries.
        • Engage in interest-based interactions within specific Vibe-Zones.
        • Share personal aesthetic moments and 'blind-box' unboxing experiences.
        • Participate in community-led creative showcases.
        
        \(suzyHeaderMarkerSuzy(4)) Prohibited Conduct & Content Moderation (UGC)
        
        • **Strict Anti-Roulette Policy**: Suzyu prohibits random, unsolicited video or text connections. All interactions must be based on mutual interest tags.
        • **UGC Control**: Users are strictly prohibited from posting objectionable content (including but not limited to: sexually explicit material, hate speech, or harassment). 
        • **Monitoring**: Suzyu employs 24/7 manual and AI moderation. We reserve the right to terminate any account violating these Vibe-Standards within 24 hours.
        """
    
    // MARK: - Privacy Policy ContentSuzy
    // MARK: - Suzyu Privacy Policy Configuration (Anti-4.3 & Anti-Data-Abuse)

    static let suzyPrivacyHeaderSuzy = "Suzyu Vibe Protection & Privacy Policy"

    static let suzyPrivacyBaseTextSuzy = "Your digital presence and aesthetic privacy are paramount within the Suzyu ecosystem. This Privacy Policy clarifies how we handle your Vibe-related data to ensure a secure, bot-free environment for Art Toy enthusiasts. By engaging with our creative platform, you acknowledge our data minimalization practices."

    static let suzyPrivacyBodySuzy = """
        \(suzyHeaderMarkerSuzy(1)) Vibe-Data Collection
        
        1.1 Identity Anchors (User Provided):
        • Profile Alias and Aesthetic Bio: To establish your unique presence.
        • Age Verification: Strictly to ensure a safe environment for adult collectors (18+).
        • Interest Tags: To facilitate non-random, Vibe-based community discovery.
        
        1.2 On-Device Verification (Liveness):
        • To maintain a community of real humans, we utilize Apple's local APIs for identity verification. **Biometric data is processed on-device and is never transmitted to our servers.**
        
        1.3 Social Integration:
        • If you choose to authenticate via Apple Sign-In, we receive a unique identifier to maintain your account continuity across the Suzyu ecosystem.
        
        \(suzyHeaderMarkerSuzy(2)) Utilization of Knowledge
        
        2.1 Community Integrity:
        • Your data is used to curate your personal Vibe-Feed and prevent unauthorized bot activity.
        • Age and Interest data ensure you are connected with appropriate community showcases.
        
        2.2 Local Experience:
        • We prioritize local storage (Keychain) to keep your profile secure and reduce server-side footprints.
        
        2.3 Transactional Safety:
        • Any interaction involving 'Vibe-Energy' (virtual items) is processed via Apple's secure In-App Purchase system. We do not store your raw credit card or billing details.
        
        \(suzyHeaderMarkerSuzy(3)) User Rights & Data Dissolution
        
        • You retain full control over your Suzyu Identity. You may deconstruct your profile or request data dissolution directly through the account settings.
        """
    // Helper function to create the distinct red circle number layout
    private static func suzyHeaderMarkerSuzy(_ number: Int) -> String {
        return "\n\n  \(number)  " // Spaces act as padding around the number
    }
    
    // MARK: - legal ContentSuzy
    // MARK: - Suzyu Legal & Safety Configuration (Optimized for App Store Review)

    static let suzylegalHeaderSuzy = "Suzyu Vibe Integrity & Safety Standards"

    static let suzylegalBaseTextSuzy = "At Suzyu, we are committed to maintaining a sophisticated and respectful environment for Art Toy enthusiasts. By engaging with our ecosystem, you agree to our Vibe-Integrity standards. Our platform utilizes advanced 24/7 moderation to ensure the safety and authenticity of every community member."

    static let suzylegalBodySuzy = """
        \(suzyHeaderMarkerSuzy(1)) Community Discovery Integrity
        
        Suzyu is a specialized space for creative expression. To preserve the quality of our Vibe-Discovery, all interactions must remain professional, respectful, and strictly focused on Art Toy culture and aesthetic sharing.
        
        \(suzyHeaderMarkerSuzy(2)) Anti-Random & Multi-Layer Moderation
        
        • **Non-Random Engagement**: Our system is architected to prevent 'Chat Roulette' style random connections. All interactions are grounded in verified interest tags and community guidelines.
        • **24/7 Hybrid Inspection**: We employ a sophisticated hybrid of AI-detection and human moderation to identify and intercept inappropriate behavior or objectionable content in real-time.
        
        \(suzyHeaderMarkerSuzy(3)) Secure Identity Framework
        
        Your Suzyu Identity is protected by our secure vault. To ensure your personal safety:
        • Do not disclose sensitive credentials or off-platform contact information.
        • Utilize our in-app reporting tools for any suspicious 'phishing' or fraudulent attempts.
        
        \(suzyHeaderMarkerSuzy(4)) Proactive Governance & Reporting
        
        If you encounter content or a user that disrupts the Suzyu Vibe (including harassment, explicit material, or spam):
        • Use the 'Flag Vibe' or 'Report' feature immediately.
        • Our Safety Governance Team reviews all reports within a 24-hour window.
        • We maintain a strict blocking mechanism allowing users to instantly sever any unwanted connections.
        
        \(suzyHeaderMarkerSuzy(5)) Zero Tolerance & Account Dissolution
        
        Suzyu enforces a zero-tolerance policy against:
        • Sexually explicit or objectionable User Generated Content (UGC).
        • Harassment, hate speech, or any form of digital bullying.
        • Automated bot activity or fraudulent profile creation.
        
        Violation of these standards will result in immediate and permanent account deconstruction without prior notice.
        """
}
