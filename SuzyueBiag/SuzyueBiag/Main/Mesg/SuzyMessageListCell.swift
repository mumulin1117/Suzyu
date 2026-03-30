//
//  SuzyMessageListCell.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/25.
//

import UIKit

class SuzyMessageListCell: UITableViewCell {
    
    private let avatarImageView = UIImageView()
    private let nameLabel = UILabel()
    private let lastMsgLabel = UILabel()
    private let timeLabel = UILabel()
    private let unreadBadge = UILabel()
    private let callIcon = UIImageView() 

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError() }

    private func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        
        avatarImageView.layer.cornerRadius = 32
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill
        
        nameLabel.textColor = .white
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        
        lastMsgLabel.textColor = .systemPink
        lastMsgLabel.font = .systemFont(ofSize: 15)
        
        timeLabel.textColor = .darkGray
        timeLabel.font = .systemFont(ofSize: 12)
        
        unreadBadge.backgroundColor = .systemPink
        unreadBadge.textColor = .white
        unreadBadge.font = .systemFont(ofSize: 10, weight: .bold)
        unreadBadge.textAlignment = .center
        unreadBadge.layer.cornerRadius = 10
        unreadBadge.clipsToBounds = true
        
        callIcon.image = SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "phone.circle")
   
        callIcon.isHidden = true

        [avatarImageView, nameLabel, lastMsgLabel, timeLabel, unreadBadge, callIcon].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 64),
            avatarImageView.heightAnchor.constraint(equalToConstant: 64),
            
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            timeLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            
            lastMsgLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -5),
            lastMsgLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            callIcon.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            callIcon.centerYAnchor.constraint(equalTo: lastMsgLabel.centerYAnchor),
            callIcon.widthAnchor.constraint(equalToConstant: 24),
            callIcon.heightAnchor.constraint(equalToConstant: 24),
            
            unreadBadge.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            unreadBadge.centerYAnchor.constraint(equalTo: lastMsgLabel.centerYAnchor),
            unreadBadge.widthAnchor.constraint(equalToConstant: 20),
            unreadBadge.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    func configure(with model: SuzyConversationModel) {
        avatarImageView.image = SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: (model.userInfo.suzyGenderSuzy == 0 ? "respectfulSpaceSuzy" : "confidentUserSuue"))
        nameLabel.text = model.userInfo.suzyUsernameSuzy
        timeLabel.text = model.lastTime
        
        if case .call = model.messages.last?.content {
            callIcon.isHidden = false
            lastMsgLabel.isHidden = true
        } else {
            callIcon.isHidden = true
            lastMsgLabel.isHidden = false
            if case .text(let t) = model.messages.last?.content{ lastMsgLabel.text = t }
            
            
            
            
            lastMsgLabel.textColor = model.unreadCount > 0 ? .systemPink : .gray
        }
        
        unreadBadge.isHidden = model.unreadCount == 0
        unreadBadge.text = "\(model.unreadCount)"
        
    }
}
