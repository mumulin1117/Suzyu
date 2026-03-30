//
//  SuzyChatBubbleCell.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/26.
//

import UIKit

class SuzyChatBubbleCell: UITableViewCell {
    private let bubbleView = UIView()
    private let contentLabel = UILabel()
    private let avatarImg = UIImageView()
    private let callIcon = UIImageView() 
    private var leadingConstraint: NSLayoutConstraint!
    private var trailingConstraint: NSLayoutConstraint!
    
    private var trailingAboutcallIconConstraint: NSLayoutConstraint!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError() }

    private func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        callIcon.image = SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "phone.circle")
   
        callIcon.isHidden = true
        avatarImg.layer.cornerRadius = 15
        avatarImg.clipsToBounds = true
        
        bubbleView.layer.cornerRadius = 15
        contentLabel.numberOfLines = 0
        contentLabel.font = .systemFont(ofSize: 16)
        
        [callIcon,avatarImg, bubbleView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        bubbleView.addSubview(contentLabel)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        leadingConstraint = avatarImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        trailingConstraint = bubbleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        trailingAboutcallIconConstraint = callIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40)
        NSLayoutConstraint.activate([
            
            avatarImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            avatarImg.widthAnchor.constraint(equalToConstant: 30),
            avatarImg.heightAnchor.constraint(equalToConstant: 30),
            
            callIcon.leadingAnchor.constraint(equalTo: bubbleView.trailingAnchor),
            callIcon.centerYAnchor.constraint(equalTo: bubbleView.centerYAnchor),
            callIcon.widthAnchor.constraint(equalToConstant: 24),
            callIcon.heightAnchor.constraint(equalToConstant: 24),
           
            
            bubbleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            bubbleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            bubbleView.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            contentLabel.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 10),
            contentLabel.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -10),
            contentLabel.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 12),
            contentLabel.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -12)
        ])
    }

    func configure(msg: SuzyChatDetailRecord, genderImg: String?) {
        contentLabel.text = ""
        
        if msg.isMine {
          
            avatarImg.isHidden = true
            bubbleView.backgroundColor = UIColor.white.withAlphaComponent(0.1)
            contentLabel.textColor = .white
            leadingConstraint.isActive = false
            trailingConstraint.isActive = true
            trailingAboutcallIconConstraint.isActive = true
           
            bubbleView.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 80).isActive = true
            
            
        } else {
         
            trailingAboutcallIconConstraint.isActive = false
            avatarImg.isHidden = false
            avatarImg.image = SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: genderImg ?? "")
            bubbleView.backgroundColor = UIColor(red: 0.3, green: 0.2, blue: 0.5, alpha: 1)
            contentLabel.textColor = .white
            leadingConstraint.isActive = true
            trailingConstraint.isActive = false
            bubbleView.leadingAnchor.constraint(equalTo: avatarImg.trailingAnchor, constant: 10).isActive = true
        }
        
        if case .text(let t) = msg.content {
            callIcon.isHidden = true
            contentLabel.text = t
            contentLabel.isHidden = false
            bubbleView.isHidden = false
        
        }
        else {
            contentLabel.isHidden = true
            callIcon.isHidden = false
            bubbleView.isHidden = true
        }
    }
}
