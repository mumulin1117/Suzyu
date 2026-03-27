//
//  SuzyLegalContentVaultSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/20.
//

import Foundation
import UIKit

// terms
enum SuzyComplianceTypeSuzy {
    case suzyTermsOfServiceSuzy
    case suzyPrivacyPolicySuzy
    case suzyLegal
    var suzyPageTitleSuzy: String {
        switch self {
        case .suzyTermsOfServiceSuzy: return "User Agreement"
        case .suzyPrivacyPolicySuzy: return "Privacy Agreement"
        case .suzyLegal: return "Legal & Safety"
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
        
        // Custom distinct styling: Effective Date respectfully
        if let dateRangeSuzy = fullStringSuzy.range(of: SuzyLegalContentVaultSuzy.suzyEffectiveDateSuzy) {
            let nsRangeSuzy = NSRange(dateRangeSuzy, in: fullStringSuzy)
            attributedStringSuzy.addAttribute(.foregroundColor, value: dateColorSuzy, range: nsRangeSuzy)
            attributedStringSuzy.addAttribute(.font, value: UIFont.systemFont(ofSize: 14, weight: .semibold), range: nsRangeSuzy)
        }
        
        // Custom distinct styling: All Numbered Headers respectfully
        // This regex pattern finds '\n\n  [number]  ' which is the marker for our distinct red circle headers
        let suzyRegexPatternSuzy = #"\n\n  (\d+)  "#
        if let suzyRegexSuzy = try? NSRegularExpression(pattern: suzyRegexPatternSuzy, options: []) {
            let suzyMatchesSuzy = suzyRegexSuzy.matches(in: fullStringSuzy, options: [], range: fullRangeSuzy)
            
            for suzyMatchSuzy in suzyMatchesSuzy {
                // Style the distinct red circle respectful of design
                attributedStringSuzy.addAttribute(.foregroundColor, value: markerColorSuzy, range: suzyMatchSuzy.range)
                attributedStringSuzy.addAttribute(.font, value: UIFont.systemFont(ofSize: 18, weight: .black), range: suzyMatchSuzy.range)
                
                // Style the following text on the same line boldly respectfully
                if suzyMatchSuzy.range.location + suzyMatchSuzy.range.length < fullStringSuzy.count {
                    let suzyTextStartSuzy = suzyMatchSuzy.range.location + suzyMatchSuzy.range.length
                    // Assuming the header text is short, style up to the next newline
                    let suzyRemainingStringSuzy = (fullStringSuzy as NSString).substring(from: suzyTextStartSuzy)
                    if let suzyNextNewlineSuzy = suzyRemainingStringSuzy.range(of: "\n") {
                        let nsNewlineRangeSuzy = NSRange(suzyNextNewlineSuzy, in: suzyRemainingStringSuzy)
                        let nsRangeSuzy = NSRange(location: suzyTextStartSuzy, length: nsNewlineRangeSuzy.location)
                        attributedStringSuzy.addAttribute(.font, value: UIFont.systemFont(ofSize: 16, weight: .semibold), range: nsRangeSuzy)
                    }
                }
            }
        }
        
        // Define line spacing respectful of nature's spacing
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
    static let suzyTermsHeaderSuzy = "Suzyu Service Agreement"
    static let suzyTermsBaseTextSuzy = "At Suzyu, your interaction matters. This Service Agreement explains your rights, responsibilities, and protect your participation when you use our app, website, and services (\"Platform\"). By accessing or using Suzyu, you agree to the practices described in this agreement."
    
    static let suzyTermsBodySuzy = """
    \(suzyHeaderMarkerSuzy(1)) Eligibility
    
    • You must be at least 18 years old to use Suzyu. By using the Platform, you represent and warrant that you are of legal age and have the authority to enter into this Agreement.
    
    \(suzyHeaderMarkerSuzy(2)) Account Registration
    
    • You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree to provide accurate and complete information and to keep it up to date.
    
    \(suzyHeaderMarkerSuzy(3)) Use of the Platform
    
    Suzyu is a social commerce platform where users can:
    • Suzyu and participate in live shows
    • Interact with hosts and other users
    • Purchase featured products
    • Share personal content and fashion moments
    
    You agree to use the Platform only for lawful and respectful purposes, and in accordance with this Agreement.
    """
    
    // MARK: - Privacy Policy ContentSuzy
    static let suzyPrivacyHeaderSuzy = "Suzyu Privacy Policy"
    static let suzyPrivacyBaseTextSuzy = "At Suzyu, your privacy matters. This Privacy Policy explains how we collect, use, disclose, and protect your personal information when you use our app, website, and services (\"Platform\"). By accessing or using Suzyu, you agree to the practices described in this policy."
    
    static let suzyPrivacyBodySuzy = """
    \(suzyHeaderMarkerSuzy(1)) Information We Collect
    
    1.1 Information You Provide Directly:
    • Name, email address, phone number
    • Date of birth (to verify age)
    • Profile photos, posts, comments, and messages
    • Payment information (for purchases or tips)
    • Shipping and billing address (for product delivery)
    
    1.2 Information You Provide Directly:
    • Name, email address, phone number
    • Date of birth (to verify age)
    • Profile photos, posts, comments, and messages
    • Payment information (for purchases or tips)
    • Shipping and billing address (for product delivery)
    
    1.3 Information You Provide Directly:
    • We may receive information from third-party platforms if you link or sign in using services like Google, Apple, or social media accounts.
    
    \(suzyHeaderMarkerSuzy(2)) How We Use Your Information
    
    1.1 Information You Provide Directly:
    • Name, email address, phone number
    • Date of birth (to verify age)
    • Profile photos, posts, comments, and messages
    • Payment information (for purchases or tips)
    • Shipping and billing address (for product delivery)
    
    1.2 Information You Provide Directly:
    • Name, email address, phone number
    • Date of birth (to verify age)
    • Profile photos, posts, comments, and messages
    • Payment information (for purchases or tips)
    • Shipping and billing address (for product delivery)
    
    1.3 Information You Provide Directly:
    • We may receive information from third-party platforms if you link or sign in using services like Google, Apple, or social media accounts.
    """
    
    // Helper function to create the distinct red circle number layout
    private static func suzyHeaderMarkerSuzy(_ number: Int) -> String {
        return "\n\n  \(number)  " // Spaces act as padding around the number
    }
    
    // MARK: - legal ContentSuzy
    static let suzylegalHeaderSuzy = "Suzyu Legal & Safety"
    static let suzylegalBaseTextSuzy = "Please be respectful during conversations. By using Suzyu, youagree to our community guidelines. Legal & Safety - Content ismonitored 24/7 to keep everyone safe."
    
    static let suzylegalBodySuzy = """
    Welcome to the Suzy community. To maintain a secure and positive environment for all members, please adhere to our safety standards:

    1. Real-Time Interaction Integrity
    All digital interactions within the platform are facilitated through secure channels. Users are expected to maintain authenticity and respect during any interactive sessions.

    2. Automated Content Inspection
    Our system utilizes 24/7 advanced identification protocols to detect and prevent inappropriate behavior. Any content that violates our community standards will be removed immediately.

    3. Identity Protection
    Your privacy is our priority. Never share sensitive personal information (such as financial details or home addresses) with other members. 

    4. Reporting & Governance
    If you encounter any behavior that makes you feel uncomfortable, use the "Report" feature instantly. Our safety team reviews all flags within 24 hours to ensure a protected discovery experience.

    5. Zero Tolerance Policy
    Suzy maintains a zero-tolerance policy towards harassment, hate speech, or fraudulent activities. Violation of these terms will lead to permanent account suspension.

    By continuing your journey on Suzy, you agree to these guidelines and our full Terms of Service.
    """
    
}
