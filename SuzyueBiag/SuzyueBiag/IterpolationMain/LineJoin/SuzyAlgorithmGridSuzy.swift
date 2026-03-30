//
//  SuzyAlgorithmGridSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/23.
//

import UIKit
enum SuzyAertionLogicTypeSuzy {
    case suzyAllSuzy
    case suzyFilteredSuzy
}
struct UseAertionEntitySuzy {
    let suzyIdentifierSuzy: String
    let suzyUsernameSuzy: String
    let suzyGenderSuzy: Int
    let suzyInterestsSuzy: [String]
    let suzyIsActiveSuzy: Bool
    let suzyBioSuzy: String
}

final class SuzyAlgorithmGridSuzy: UICollectionViewCell {
    private var suzyTagStackHeightConstraintSuzy: NSLayoutConstraint!
    
    
    private let suzyAvatarContainerSuzy = UIView()
    private let suzyAvatarImageViewSuzy = UIImageView()
    private let suzyStatusDotSuzy = UIView()
    private let suzyNameLabelSuzy = UILabel()
    private let suzyTagStackSuzy = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        suzyConfigureHierarchySuzy()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func suzyConfigureHierarchySuzy() {
        contentView.backgroundColor = UIColor(white: 0.15, alpha: 1.0)
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        suzyTagStackHeightConstraintSuzy = suzyTagStackSuzy.heightAnchor.constraint(equalToConstant: 20)
        
        suzyAvatarContainerSuzy.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(suzyAvatarContainerSuzy)
        
        suzyAvatarImageViewSuzy.contentMode = .scaleAspectFill
        suzyAvatarImageViewSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyAvatarContainerSuzy.addSubview(suzyAvatarImageViewSuzy)
        
        suzyStatusDotSuzy.layer.cornerRadius = 4
        suzyStatusDotSuzy.backgroundColor = .green
        suzyStatusDotSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyAvatarContainerSuzy.addSubview(suzyStatusDotSuzy)
        
        suzyNameLabelSuzy.textColor = .white
        suzyNameLabelSuzy.font = .systemFont(ofSize: 14, weight: .semibold)
        suzyNameLabelSuzy.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(suzyNameLabelSuzy)
        
        suzyTagStackSuzy.axis = .horizontal
        suzyTagStackSuzy.spacing = 4
        suzyTagStackSuzy.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(suzyTagStackSuzy)
        
        let suzyWSuzy = UIScreen.main.bounds.width
        
        NSLayoutConstraint.activate([
            suzyAvatarContainerSuzy.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            suzyAvatarContainerSuzy.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            suzyAvatarContainerSuzy.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.85),
            suzyAvatarContainerSuzy.heightAnchor.constraint(equalTo: suzyAvatarContainerSuzy.widthAnchor),
            
            suzyAvatarImageViewSuzy.topAnchor.constraint(equalTo: suzyAvatarContainerSuzy.topAnchor),
            suzyAvatarImageViewSuzy.leadingAnchor.constraint(equalTo: suzyAvatarContainerSuzy.leadingAnchor),
            suzyAvatarImageViewSuzy.trailingAnchor.constraint(equalTo: suzyAvatarContainerSuzy.trailingAnchor),
            suzyAvatarImageViewSuzy.bottomAnchor.constraint(equalTo: suzyAvatarContainerSuzy.bottomAnchor),
            
            suzyStatusDotSuzy.topAnchor.constraint(equalTo: suzyAvatarContainerSuzy.topAnchor, constant: 5),
            suzyStatusDotSuzy.trailingAnchor.constraint(equalTo: suzyAvatarContainerSuzy.trailingAnchor, constant: -5),
            suzyStatusDotSuzy.widthAnchor.constraint(equalToConstant: 8),
            suzyStatusDotSuzy.heightAnchor.constraint(equalToConstant: 8),
            
            suzyNameLabelSuzy.topAnchor.constraint(equalTo: suzyAvatarContainerSuzy.bottomAnchor, constant: 8),
            suzyNameLabelSuzy.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            suzyTagStackSuzy.topAnchor.constraint(equalTo: suzyNameLabelSuzy.bottomAnchor, constant: 6),
            suzyTagStackSuzy.leadingAnchor.constraint(equalTo: suzyNameLabelSuzy.leadingAnchor),
            suzyTagStackSuzy.heightAnchor.constraint(equalToConstant: 20),
            suzyTagStackHeightConstraintSuzy,
                        
            suzyTagStackSuzy.topAnchor.constraint(equalTo: suzyNameLabelSuzy.bottomAnchor, constant: 6)
        ])
    }
    

    
    func suzyUpdateLayoutModeSuzy(suzyItemSuzy: UseAertionEntitySuzy, suzyModeSuzy: SuzyAertionLogicTypeSuzy) {
            suzyNameLabelSuzy.text = suzyItemSuzy.suzyUsernameSuzy
            suzyAvatarImageViewSuzy.image = suzyItemSuzy.suzyGenderSuzy == 0 ? SuzyArtToyVibeEngine.suzyfilterApplySuzy(assetManagerSuue: "respectfulSpaceSuzy") : SuzyArtToyVibeEngine.suzyfilterApplySuzy(assetManagerSuue: "confidentUserSuue")
            
            if suzyModeSuzy == .suzyAllSuzy  {
                suzyTagStackSuzy.isHidden = true
                suzyTagStackHeightConstraintSuzy.constant = 0
            } else {
                suzyTagStackSuzy.isHidden = false
                suzyTagStackHeightConstraintSuzy.constant = 20
                suzyTagStackSuzy.arrangedSubviews.forEach { $0.removeFromSuperview() }
                suzyItemSuzy.suzyInterestsSuzy.prefix(2).forEach { suzyTextSuzy in
                    let suzyTagSuzy = suzyBuildTagLabelSuzy(suzyTextSuzy)
                    suzyTagStackSuzy.addArrangedSubview(suzyTagSuzy)
                }
            }
            self.layoutIfNeeded()
        }
        
        private func suzyBuildTagLabelSuzy(_ suzyTextSuzy: String) -> UILabel {
            let suzyLSuzy = UILabel()
            suzyLSuzy.text = " \(suzyTextSuzy) "
            suzyLSuzy.textColor = .lightGray
            suzyLSuzy.font = .systemFont(ofSize: 10)
            suzyLSuzy.backgroundColor = UIColor(white: 0.25, alpha: 1.0)
            suzyLSuzy.layer.cornerRadius = 4
            suzyLSuzy.clipsToBounds = true
            return suzyLSuzy
        }
}
