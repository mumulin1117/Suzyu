//
//  SuzyUserQuickViewSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/23.
//

import UIKit

final class SuzyUserQuickViewSuzy: UIView {
    
    // MARK: - UI Components Suzy
    private let suzyBlurEffectSuzy = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    private let suzyCardContainerSuzy = UIImageView()
    private let suzyAvatarOutlineSuzy = UIView()
    private let suzyUserAvatarSuzy = UIImageView()
    private let suzyDisplayNameSuzy = UILabel()
    private let suzyMessageIconSuzy = UIImageView()
    private let suzyBioLabelSuzy = UILabel()
    private let suzyTagFlowStackSuzy = UIStackView()
    private let suzyCallActionBtnSuzy = UIButton(type: .custom)
    private let suzyDismissBtnSuzy = UIButton(type: .custom)
    
    // MARK: - Data Source Suzy
    private var suzyEntitySuzy: SuzyMatchEntitySuzy?
    var suzyOnVideoCallRequestedSuzy: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        suzyBuildInterfaceSuzy()
        NotificationCenter.default.addObserver(self, selector: #selector(SuzyBlockToReportDetails), name: NSNotification.Name("SuzySwitchToReportDetails"), object: nil)
    }
    @objc  func SuzyBlockToReportDetails(_ notification: Notification) {
       
        self.removeFromSuperview()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func suzyBuildInterfaceSuzy() {
        suzyCardContainerSuzy.isUserInteractionEnabled = true
        suzyBlurEffectSuzy.frame = self.bounds
        suzyBlurEffectSuzy.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(suzyBlurEffectSuzy)
        
        // 卡片主体
        suzyCardContainerSuzy.image = UIImage(named: "suzyCardContainerSuzy")
        suzyCardContainerSuzy.contentMode = .scaleToFill
        suzyCardContainerSuzy.translatesAutoresizingMaskIntoConstraints = false
        addSubview(suzyCardContainerSuzy)
        
        // 头像边框与图片
        suzyAvatarOutlineSuzy.backgroundColor = .white
        suzyAvatarOutlineSuzy.layer.cornerRadius = 55
        suzyAvatarOutlineSuzy.translatesAutoresizingMaskIntoConstraints = false
        addSubview(suzyAvatarOutlineSuzy)
        
        suzyUserAvatarSuzy.layer.cornerRadius = 50
        suzyUserAvatarSuzy.contentMode = .scaleAspectFill
        suzyUserAvatarSuzy.clipsToBounds = true
        suzyUserAvatarSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyAvatarOutlineSuzy.addSubview(suzyUserAvatarSuzy)
        
        // 名字与消息图标
        suzyDisplayNameSuzy.textColor = .white
        suzyDisplayNameSuzy.font = .systemFont(ofSize: 22, weight: .bold)
        suzyDisplayNameSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyCardContainerSuzy.addSubview(suzyDisplayNameSuzy)
        
        suzyMessageIconSuzy.image = UIImage(systemName: "bubble.left.fill")
        suzyMessageIconSuzy.tintColor = .white
        suzyMessageIconSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyCardContainerSuzy.addSubview(suzyMessageIconSuzy)
        
        // 简介
        suzyBioLabelSuzy.textColor = .lightGray
        suzyBioLabelSuzy.font = .systemFont(ofSize: 16)
        suzyBioLabelSuzy.textAlignment = .center
        suzyBioLabelSuzy.numberOfLines = 2
        suzyBioLabelSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyCardContainerSuzy.addSubview(suzyBioLabelSuzy)
        
        // 标签容器
        suzyTagFlowStackSuzy.axis = .vertical
        suzyTagFlowStackSuzy.spacing = 10
        suzyTagFlowStackSuzy.alignment = .center
        suzyTagFlowStackSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyCardContainerSuzy.addSubview(suzyTagFlowStackSuzy)
        
        // 视频通话按钮
        suzyCallActionBtnSuzy.setTitle("Video Call", for: .normal)
        suzyCallActionBtnSuzy.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
//        suzyCallActionBtnSuzy.backgroundColor = UIColor(red: 0.5, green: 0.2, blue: 1.0, alpha: 1.0)
        suzyCallActionBtnSuzy.layer.cornerRadius = 20
        suzyCallActionBtnSuzy.layer.masksToBounds = true
        suzyCallActionBtnSuzy.addTarget(self, action: #selector(suzyInitiateCallSuzy), for: .touchUpInside)
        suzyCallActionBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyCardContainerSuzy.addSubview(suzyCallActionBtnSuzy)
        suzyApplyGradientToButtonSuzy(suzyTargetButtonSuzy: suzyCallActionBtnSuzy)
        // 关闭按钮
        suzyDismissBtnSuzy.setImage(UIImage(named: "huntinniuclose"), for: .normal)
        suzyDismissBtnSuzy.tintColor = UIColor(white: 1.0, alpha: 0.5)
        suzyDismissBtnSuzy.addTarget(self, action: #selector(suzyHideQuickViewSuzy), for: .touchUpInside)
        suzyDismissBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        addSubview(suzyDismissBtnSuzy)
        
        // 约束布局 (按比例)
        NSLayoutConstraint.activate([
            suzyCardContainerSuzy.centerXAnchor.constraint(equalTo: centerXAnchor),
            suzyCardContainerSuzy.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 40),
            suzyCardContainerSuzy.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85),
            suzyCardContainerSuzy.heightAnchor.constraint(equalToConstant: 275),
            
            suzyAvatarOutlineSuzy.centerXAnchor.constraint(equalTo: suzyCardContainerSuzy.centerXAnchor),
            suzyAvatarOutlineSuzy.bottomAnchor.constraint(equalTo: suzyCardContainerSuzy.topAnchor, constant: 40),
            suzyAvatarOutlineSuzy.widthAnchor.constraint(equalToConstant: 110),
            suzyAvatarOutlineSuzy.heightAnchor.constraint(equalToConstant: 110),
            
            suzyUserAvatarSuzy.centerXAnchor.constraint(equalTo: suzyAvatarOutlineSuzy.centerXAnchor),
            suzyUserAvatarSuzy.centerYAnchor.constraint(equalTo: suzyAvatarOutlineSuzy.centerYAnchor),
            suzyUserAvatarSuzy.widthAnchor.constraint(equalToConstant: 100),
            suzyUserAvatarSuzy.heightAnchor.constraint(equalToConstant: 100),
            
            suzyDisplayNameSuzy.topAnchor.constraint(equalTo: suzyAvatarOutlineSuzy.bottomAnchor, constant: 15),
            suzyDisplayNameSuzy.centerXAnchor.constraint(equalTo: suzyCardContainerSuzy.centerXAnchor, constant: -15),
            
            suzyMessageIconSuzy.centerYAnchor.constraint(equalTo: suzyDisplayNameSuzy.centerYAnchor),
            suzyMessageIconSuzy.leadingAnchor.constraint(equalTo: suzyDisplayNameSuzy.trailingAnchor, constant: 8),
            suzyMessageIconSuzy.widthAnchor.constraint(equalToConstant: 30),
            suzyMessageIconSuzy.heightAnchor.constraint(equalToConstant: 30),
            
            suzyBioLabelSuzy.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            suzyBioLabelSuzy.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            suzyBioLabelSuzy.topAnchor.constraint(equalTo: suzyDisplayNameSuzy.bottomAnchor, constant: 10),
            suzyBioLabelSuzy.centerXAnchor.constraint(equalTo: suzyCardContainerSuzy.centerXAnchor),
            
            suzyTagFlowStackSuzy.topAnchor.constraint(equalTo: suzyBioLabelSuzy.bottomAnchor, constant: 20),
            suzyTagFlowStackSuzy.centerXAnchor.constraint(equalTo: suzyCardContainerSuzy.centerXAnchor),
            
            suzyCallActionBtnSuzy.bottomAnchor.constraint(equalTo: suzyCardContainerSuzy.bottomAnchor, constant: -30),
            suzyCallActionBtnSuzy.centerXAnchor.constraint(equalTo: suzyCardContainerSuzy.centerXAnchor),
            suzyCallActionBtnSuzy.widthAnchor.constraint(equalTo: suzyCardContainerSuzy.widthAnchor, multiplier: 0.8),
            suzyCallActionBtnSuzy.heightAnchor.constraint(equalToConstant: 50),
            
            suzyDismissBtnSuzy.topAnchor.constraint(equalTo: suzyCardContainerSuzy.bottomAnchor, constant: 20),
            suzyDismissBtnSuzy.centerXAnchor.constraint(equalTo: centerXAnchor),
            suzyDismissBtnSuzy.widthAnchor.constraint(equalToConstant: 40),
            suzyDismissBtnSuzy.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // MARK: - API Suzy
    func suzyShowWithEntitySuzy(suzyItemSuzy: SuzyMatchEntitySuzy) {
        self.suzyEntitySuzy = suzyItemSuzy
        suzyDisplayNameSuzy.text = suzyItemSuzy.suzyUsernameSuzy
        suzyBioLabelSuzy.text = suzyItemSuzy.suzyBioSuzy
        suzyUserAvatarSuzy.image = suzyItemSuzy.suzyGenderSuzy == 0 ? UIImage(named: "respectfulSpaceSuzy") : UIImage(named: "confidentUserSuue")
        
        // 动态生成标签行
        suzyTagFlowStackSuzy.arrangedSubviews.forEach { $0.removeFromSuperview() }
        let suzyTopRowSuzy = UIStackView()
        let suzyBottomRowSuzy = UIStackView()
        [suzyTopRowSuzy, suzyBottomRowSuzy].forEach {
            $0.axis = .horizontal
            $0.spacing = 8
            suzyTagFlowStackSuzy.addArrangedSubview($0)
        }
        
        for (index, tag) in suzyItemSuzy.suzyInterestsSuzy.enumerated() {
            let suzyLabelSuzy = suzyBuildTagSuzy(tag)
            if index < 3 { suzyTopRowSuzy.addArrangedSubview(suzyLabelSuzy) }
            else { suzyBottomRowSuzy.addArrangedSubview(suzyLabelSuzy) }
        }
    }
    
    private func suzyBuildTagSuzy(_ suzyTextSuzy: String) -> UILabel {
        let suzyLSuzy = UILabel()
        suzyLSuzy.text = " \(suzyTextSuzy) "
        suzyLSuzy.textColor = .white
        suzyLSuzy.font = .systemFont(ofSize: 12)
        suzyLSuzy.backgroundColor = UIColor(white: 1.0, alpha: 0.15)
        suzyLSuzy.layer.cornerRadius = 6
        suzyLSuzy.clipsToBounds = true
        return suzyLSuzy
    }
    
    @objc private func suzyInitiateCallSuzy() {
        suzyOnVideoCallRequestedSuzy?()
        sendCallmessageAction()
    }
    
    private func sendCallmessageAction() {
      
        // 存储消息逻辑
        
        let newMessage = SuzyChatDetailRecord(isMine: true, content: .call(duration: "00:00"), time: "Now")
        
        if let index = SuzyMessageCacheManager.shared.conversations.firstIndex(where: {
                $0.userInfo.suzyIdentifierSuzy == suzyEntitySuzy?.suzyIdentifierSuzy
            }) {
                
                // 3. 直接修改原数组中的数据
                SuzyMessageCacheManager.shared.conversations[index].messages.append(newMessage)
            let updatedConversation = SuzyMessageCacheManager.shared.conversations.remove(at: index)
                    SuzyMessageCacheManager.shared.conversations.insert(updatedConversation, at: 0)
            } else {
                guard let entity = suzyEntitySuzy else { return }
                let newConversation = SuzyConversationModel(
                            userInfo: entity,
                            unreadCount: 0,
                            messages: [newMessage]
                        
                )
                        
                SuzyMessageCacheManager.shared.conversations.insert(newConversation, at: 0)
            }
       
       
    }
    
    @objc private func suzyHideQuickViewSuzy() {
        UIView.animate(withDuration: 0.3, animations: { self.alpha = 0 }) { _ in
            self.removeFromSuperview()
        }
    }
}
