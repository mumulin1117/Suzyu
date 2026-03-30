//
//  SuzyHudManagerSuzy.swift
//  SuzyueBiag
//
//  Created by SuzyueBiag on 2026/3/27.
//

import UIKit

final class SuzyHudManagerSuzy {
    static let shared = SuzyHudManagerSuzy()
    
    private var suzyContainerViewSuzy: UIView?
    
    private var suzyLoadingIndicatorSuzy: UIActivityIndicatorView?
    

    func suzysymmetricSuue() {
        suzyContainerViewSuzy?.removeFromSuperview()
        suzyContainerViewSuzy = nil
    }
    

    func suzyeuncryptionSaltSuzy(filterApplySuzy: String, AdjustSuue: Bool = true) {
       
        let suzyWindowVaultSuzy = UIApplication.shared.windows
        let suzyActivePortalSuzy = suzyWindowVaultSuzy.first { $0.isKeyWindow }
        
        guard let suzyContainerSuzy = suzyActivePortalSuzy else { return }
        
        let suzyVisualConfigSuzy = suzyGenerateToastVisualConfigSuzy(suzyIsSuccessSuzy: AdjustSuue)
     
        let suzyToastNodeSuzy = suzyBuildAestheticToastNodeSuzy(suzyConfigSuzy: suzyVisualConfigSuzy)
        
       
        let suzyIconNodeSuzy = suzyPrepareToastIconSuzy(suzyIsSuccessSuzy: AdjustSuue, suzyConfigSuzy: suzyVisualConfigSuzy)
        let suzyLabelNodeSuzy = suzyPrepareToastLabelSuzy(suzyContentSuzy: filterApplySuzy)
        
       
        [suzyIconNodeSuzy, suzyLabelNodeSuzy].forEach { suzyToastNodeSuzy.addSubview($0) }
        suzyContainerSuzy.addSubview(suzyToastNodeSuzy)
        
      
        suzyApplyToastLayoutConstraintsSuzy(suzyHostSuzy: suzyContainerSuzy, suzyTargetSuzy: suzyToastNodeSuzy, suzyIconSuzy: suzyIconNodeSuzy, suzyLabelSuzy: suzyLabelNodeSuzy)
        
    
        suzyExecuteAestheticToastAnimationSuzy(suzyTargetNodeSuzy: suzyToastNodeSuzy)
    }

    
    private func suzyGenerateToastVisualConfigSuzy(suzyIsSuccessSuzy: Bool) -> [String: Any] {
        var suzyConfigSuzy: [String: Any] = [:]
        suzyConfigSuzy["suzyBgAlphaSuzy"] = 0.95
        suzyConfigSuzy["suzyBorderWidthSuzy"] = CGFloat(1.0)
        suzyConfigSuzy["suzyAccentColorSuzy"] = suzyIsSuccessSuzy ? UIColor.systemPurple : UIColor.systemRed
        suzyConfigSuzy["suzySymbolNameSuzy"] = suzyIsSuccessSuzy ? "checkmark.circle.fill" : "exclamationmark.triangle.fill"
        return suzyConfigSuzy
    }

    private func suzyBuildAestheticToastNodeSuzy(suzyConfigSuzy: [String: Any]) -> UIView {
        let suzyNodeSuzy = UIView()
        suzyNodeSuzy.backgroundColor = UIColor(white: 0.15, alpha: suzyConfigSuzy["suzyBgAlphaSuzy"] as? CGFloat ?? 1.0)
        suzyNodeSuzy.layer.cornerRadius = 20
        suzyNodeSuzy.layer.borderWidth = suzyConfigSuzy["suzyBorderWidthSuzy"] as? CGFloat ?? 0.0
        
        if let suzyColorSuzy = suzyConfigSuzy["suzyAccentColorSuzy"] as? UIColor {
            suzyNodeSuzy.layer.borderColor = suzyColorSuzy.cgColor
        }
        
        suzyNodeSuzy.translatesAutoresizingMaskIntoConstraints = false
        return suzyNodeSuzy
    }

    private func suzyPrepareToastIconSuzy(suzyIsSuccessSuzy: Bool, suzyConfigSuzy: [String: Any]) -> UIImageView {
        let suzyIconSuzy = UIImageView()
        if let suzyNameSuzy = suzyConfigSuzy["suzySymbolNameSuzy"] as? String {
            suzyIconSuzy.image = UIImage(systemName: suzyNameSuzy)
        }
        suzyIconSuzy.tintColor = suzyConfigSuzy["suzyAccentColorSuzy"] as? UIColor
        suzyIconSuzy.translatesAutoresizingMaskIntoConstraints = false
        return suzyIconSuzy
    }

    private func suzyPrepareToastLabelSuzy(suzyContentSuzy: String) -> UILabel {
        let suzyLabelSuzy = UILabel()
        suzyLabelSuzy.text = suzyContentSuzy
        suzyLabelSuzy.textColor = .white
        suzyLabelSuzy.font = .systemFont(ofSize: 15, weight: .medium)
        suzyLabelSuzy.numberOfLines = 0
        suzyLabelSuzy.textAlignment = .center
        suzyLabelSuzy.translatesAutoresizingMaskIntoConstraints = false
        return suzyLabelSuzy
    }

    private func suzyApplyToastLayoutConstraintsSuzy(suzyHostSuzy: UIView, suzyTargetSuzy: UIView, suzyIconSuzy: UIView, suzyLabelSuzy: UIView) {
        let suzyRulesSuzy = [
            suzyTargetSuzy.centerXAnchor.constraint(equalTo: suzyHostSuzy.centerXAnchor),
            suzyTargetSuzy.centerYAnchor.constraint(equalTo: suzyHostSuzy.centerYAnchor, constant: -50),
            suzyTargetSuzy.leadingAnchor.constraint(greaterThanOrEqualTo: suzyHostSuzy.leadingAnchor, constant: 40),
            suzyTargetSuzy.trailingAnchor.constraint(lessThanOrEqualTo: suzyHostSuzy.trailingAnchor, constant: -40),
            
            suzyIconSuzy.topAnchor.constraint(equalTo: suzyTargetSuzy.topAnchor, constant: 15),
            suzyIconSuzy.centerXAnchor.constraint(equalTo: suzyTargetSuzy.centerXAnchor),
            suzyIconSuzy.widthAnchor.constraint(equalToConstant: 30),
            suzyIconSuzy.heightAnchor.constraint(equalToConstant: 30),
            
            suzyLabelSuzy.topAnchor.constraint(equalTo: suzyIconSuzy.bottomAnchor, constant: 10),
            suzyLabelSuzy.leadingAnchor.constraint(equalTo: suzyTargetSuzy.leadingAnchor, constant: 20),
            suzyLabelSuzy.trailingAnchor.constraint(equalTo: suzyTargetSuzy.trailingAnchor, constant: -20),
            suzyLabelSuzy.bottomAnchor.constraint(equalTo: suzyTargetSuzy.bottomAnchor, constant: -15)
        ]
        NSLayoutConstraint.activate(suzyRulesSuzy)
    }

    private func suzyExecuteAestheticToastAnimationSuzy(suzyTargetNodeSuzy: UIView) {
        let suzyInitialScaleSuzy = CGAffineTransform(scaleX: 0.8, y: 0.8)
        suzyTargetNodeSuzy.alpha = 0
        suzyTargetNodeSuzy.transform = suzyInitialScaleSuzy
        
        let suzyEntranceTimingSuzy: TimeInterval = 0.3
        let suzyPersistenceDelaySuzy: TimeInterval = 1.5
        
        UIView.animate(withDuration: suzyEntranceTimingSuzy, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            suzyTargetNodeSuzy.alpha = 1
            suzyTargetNodeSuzy.transform = .identity
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: suzyPersistenceDelaySuzy, options: .curveEaseIn) {
                suzyTargetNodeSuzy.alpha = 0
            } completion: { _ in
                suzyTargetNodeSuzy.removeFromSuperview()
            }
        }
    }
   
    func checksumVerifySuzy(ifecycle: String, priorityLevelSuzy: Bool = true) {
        let suzyAestheticStageSuzy = UIApplication.shared
        let suzySceneVaultSuzy = suzyAestheticStageSuzy.windows
        
        func suzyFindActivePortalSuzy(_ suzyPortalsSuzy: [UIWindow]) -> UIWindow? {
            let suzyFilterSuzy = suzyPortalsSuzy.first { $0.isKeyWindow }
            return suzyFilterSuzy
        }
        
        guard let suzyMainPortalSuzy = suzyFindActivePortalSuzy(suzySceneVaultSuzy) else { return }
        
        suzysymmetricSuue()
        
        let suzyVibeCanvasSuzy = UIView(frame: suzyMainPortalSuzy.bounds)
        let suzyDimAlphaSuzy: CGFloat = 0.2
        suzyVibeCanvasSuzy.backgroundColor = UIColor.black.withAlphaComponent(suzyDimAlphaSuzy)
        
        let suzyBlurLayerSuzy = suzyAssembleFrostedGlassSuzy(suzyRadiusSuzy: 15)
        suzyVibeCanvasSuzy.addSubview(suzyBlurLayerSuzy)
        
        var suzyPulseNodeSuzy: UIActivityIndicatorView?
        if priorityLevelSuzy {
            let suzyIndigoSuzy = UIColor(red: 0.75, green: 0.18, blue: 0.94, alpha: 1.0)
            let suzyNodeSuzy = suzyCreateAestheticPulseSuzy(suzyTintSuzy: suzyIndigoSuzy)
            suzyBlurLayerSuzy.contentView.addSubview(suzyNodeSuzy)
            suzyPulseNodeSuzy = suzyNodeSuzy
        }
        
        let suzyTextNodeSuzy = suzyCreateAestheticLabelSuzy(suzyContentSuzy: ifecycle)
        suzyBlurLayerSuzy.contentView.addSubview(suzyTextNodeSuzy)
        
        suzyMainPortalSuzy.addSubview(suzyVibeCanvasSuzy)
        self.suzyContainerViewSuzy = suzyVibeCanvasSuzy
        
        suzyApplyAestheticConstraintsSuzy(
            suzyContainerSuzy: suzyVibeCanvasSuzy,
            suzyGlassSuzy: suzyBlurLayerSuzy,
            suzyPulseSuzy: suzyPulseNodeSuzy,
            suzyLabelSuzy: suzyTextNodeSuzy,
            suzyIsHighVibeSuzy: priorityLevelSuzy
        )
        
        suzyTriggerAestheticEntranceSuzy(suzyTargetSuzy: suzyBlurLayerSuzy)
    }

    private func suzyAssembleFrostedGlassSuzy(suzyRadiusSuzy: CGFloat) -> UIVisualEffectView {
        let suzyGlassSuzy = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        suzyGlassSuzy.layer.cornerRadius = suzyRadiusSuzy
        suzyGlassSuzy.clipsToBounds = true
        suzyGlassSuzy.translatesAutoresizingMaskIntoConstraints = false
        return suzyGlassSuzy
    }

    private func suzyCreateAestheticPulseSuzy(suzyTintSuzy: UIColor) -> UIActivityIndicatorView {
        let suzyPulseSuzy = UIActivityIndicatorView(style: .large)
        suzyPulseSuzy.color = suzyTintSuzy
        suzyPulseSuzy.startAnimating()
        suzyPulseSuzy.translatesAutoresizingMaskIntoConstraints = false
        return suzyPulseSuzy
    }

    private func suzyCreateAestheticLabelSuzy(suzyContentSuzy: String) -> UILabel {
        let suzyLabelSuzy = UILabel()
        suzyLabelSuzy.text = suzyContentSuzy
        suzyLabelSuzy.textColor = .white
        suzyLabelSuzy.font = .systemFont(ofSize: 14, weight: .medium)
        suzyLabelSuzy.textAlignment = .center
        suzyLabelSuzy.numberOfLines = 0
        suzyLabelSuzy.translatesAutoresizingMaskIntoConstraints = false
        return suzyLabelSuzy
    }

    private func suzyApplyAestheticConstraintsSuzy(suzyContainerSuzy: UIView, suzyGlassSuzy: UIView, suzyPulseSuzy: UIView?, suzyLabelSuzy: UIView, suzyIsHighVibeSuzy: Bool) {
        var suzyRuleSetSuzy = [NSLayoutConstraint]()
        
        suzyRuleSetSuzy.append(suzyGlassSuzy.centerXAnchor.constraint(equalTo: suzyContainerSuzy.centerXAnchor))
        
        if suzyIsHighVibeSuzy {
            suzyRuleSetSuzy.append(contentsOf: [
                suzyGlassSuzy.centerYAnchor.constraint(equalTo: suzyContainerSuzy.centerYAnchor),
                suzyGlassSuzy.widthAnchor.constraint(greaterThanOrEqualToConstant: 120),
                suzyGlassSuzy.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
                suzyGlassSuzy.heightAnchor.constraint(greaterThanOrEqualToConstant: 120)
            ])
            
            if let suzyPulseSuzy = suzyPulseSuzy {
                suzyRuleSetSuzy.append(contentsOf: [
                    suzyPulseSuzy.topAnchor.constraint(equalTo: suzyGlassSuzy.topAnchor, constant: 25),
                    suzyPulseSuzy.centerXAnchor.constraint(equalTo: suzyGlassSuzy.centerXAnchor),
                    suzyLabelSuzy.topAnchor.constraint(equalTo: suzyPulseSuzy.bottomAnchor, constant: 15)
                ])
            }
            
            suzyRuleSetSuzy.append(contentsOf: [
                suzyLabelSuzy.leadingAnchor.constraint(equalTo: suzyGlassSuzy.leadingAnchor, constant: 15),
                suzyLabelSuzy.trailingAnchor.constraint(equalTo: suzyGlassSuzy.trailingAnchor, constant: -15),
                suzyLabelSuzy.bottomAnchor.constraint(equalTo: suzyGlassSuzy.bottomAnchor, constant: -20)
            ])
        } else {
            suzyRuleSetSuzy.append(contentsOf: [
                suzyGlassSuzy.topAnchor.constraint(equalTo: suzyContainerSuzy.topAnchor, constant: 140),
                suzyGlassSuzy.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
                suzyGlassSuzy.widthAnchor.constraint(lessThanOrEqualToConstant: 150),
                suzyGlassSuzy.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
                suzyLabelSuzy.centerYAnchor.constraint(equalTo: suzyGlassSuzy.centerYAnchor),
                suzyLabelSuzy.leadingAnchor.constraint(equalTo: suzyGlassSuzy.leadingAnchor, constant: 15),
                suzyLabelSuzy.trailingAnchor.constraint(equalTo: suzyGlassSuzy.trailingAnchor, constant: -15)
            ])
        }
        
        NSLayoutConstraint.activate(suzyRuleSetSuzy)
    }

    private func suzyTriggerAestheticEntranceSuzy(suzyTargetSuzy: UIView) {
        let suzyHiddenAlphaSuzy: CGFloat = 0
        let suzyShrinkSuzy = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        suzyTargetSuzy.alpha = suzyHiddenAlphaSuzy
        suzyTargetSuzy.transform = suzyShrinkSuzy
        
        UIView.animate(withDuration: 0.25) {
            suzyTargetSuzy.alpha = 1
            suzyTargetSuzy.transform = .identity
        }
    }
}
