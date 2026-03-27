//
//  SuzyAlgorithmyControllerSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/23.
//

import UIKit
import AVFoundation

final class SuzyAlgorithmyControllerSuzy: UIViewController {
    var suzyCurrentMatchTypeSuzy: SuzyMatchLogicTypeSuzy = .suzyAllSuzy
    init(suzyCurrentMatchTypeSuzy: SuzyMatchLogicTypeSuzy ) {
        self.suzyCurrentMatchTypeSuzy = suzyCurrentMatchTypeSuzy
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    private let suzyNavWrapperSuzy = UIView()
        private let suzyBackActionBtnSuzy = UIButton(type: .custom)
        private let suzyNotifyIconBtnSuzy = UIButton(type: .custom)
        private let suzySettingsIconBtnSuzy = UIButton(type: .custom)
    private var suzyCollectionSuzy: UICollectionView!
    private let suzySafetyFooterSuzy = UITextView()
    private var suzyDataSourceSuzy: [SuzyMatchEntitySuzy] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(suzyFallbackBgImageViewSuzy)
        suzyAddKeyboardObserversSuzy()
        suzySetupNavigationBarSuzy()
        suzyInitializeCanvasSuzy()
        suzyFetchRemoteRecordsSuzy()
        suzyNotifyIconBtnSuzy.addTarget(self, action: #selector(packetLossSuue), for: .touchUpInside)
        suzySettingsIconBtnSuzy.addTarget(self, action: #selector(memoryLeakSuue), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(SuzyBlockToReportDetails), name: NSNotification.Name("SuzySwitchToReportDetails"), object: nil)
    }
    
   @objc func packetLossSuue() {
       self.navigationController?.pushViewController(SuzyInformationViewController(), animated: true)
    }
    
    
    @objc func memoryLeakSuue() {
        self.navigationController?.pushViewController(LandmarkSUZYTrackSuue(), animated: true)
     }
    @objc  func SuzyBlockToReportDetails(_ notification: Notification) {
        guard let suzyInfoSuzy = notification.object as? Dictionary<String,String>,
              let suzyTargetIDSuzy = suzyInfoSuzy["suzyTargetID"] else { return }
        
        
        suzyDataSourceSuzy.removeAll { $0.suzyIdentifierSuzy == suzyTargetIDSuzy }
        self.suzyCollectionSuzy.reloadData()
    }
    private let suzyFallbackBgImageViewSuzy: UIImageView = {
        let iv = UIImageView.init(frame: UIScreen.main.bounds)
        iv.image = UIImage(named: "SuzyWelcomeBgSuzyELUA@")
        iv.contentMode = .scaleAspectFill
       
        return iv
    }()
    private func suzyInitializeCanvasSuzy() {
       
        let suzyLayoutSuzy = UICollectionViewFlowLayout()
        let suzySpacingSuzy: CGFloat = 15
        let suzyItemWSuzy = (UIScreen.main.bounds.width - (suzySpacingSuzy * 3)) / 2
        suzyLayoutSuzy.itemSize = CGSize(width: suzyItemWSuzy, height: suzyItemWSuzy * 1.35)
        suzyLayoutSuzy.sectionInset = UIEdgeInsets(top: 20, left: suzySpacingSuzy, bottom: 100, right: suzySpacingSuzy)
        
        suzyCollectionSuzy = UICollectionView(frame: .zero, collectionViewLayout: suzyLayoutSuzy)
        suzyCollectionSuzy.backgroundColor = .clear
        suzyCollectionSuzy.delegate = self
        suzyCollectionSuzy.dataSource = self
        suzyCollectionSuzy.register(SuzyAlgorithmGridSuzy.self, forCellWithReuseIdentifier: "SuzyAlgorithmGridSuzy")
        suzyCollectionSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyCollectionSuzy)
        
        suzySafetyFooterSuzy.isEditable = false
        suzySafetyFooterSuzy.isScrollEnabled = false
        suzySafetyFooterSuzy.backgroundColor = .black
        suzySafetyFooterSuzy.textAlignment = .center
        suzySafetyFooterSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzySafetyFooterSuzy)
        
        let suzyParagraphSuzy = NSMutableParagraphStyle()
        suzyParagraphSuzy.alignment = .center
        
        let suzyBaseAttrSuzy: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray,
            .font: UIFont.systemFont(ofSize: 12),
            .paragraphStyle: suzyParagraphSuzy
        ]
        
        let suzyFullTextSuzy = NSMutableAttributedString(string: "Please be respectful during conversations. By using Suzyu, youagree to our community guidelines. Legal & Safety - Content ismonitored 24/7 to keep everyone safe.", attributes: suzyBaseAttrSuzy)
        
        let suzyLinkRangeSuzy = (suzyFullTextSuzy.string as NSString).range(of: "Legal & Safety")
        suzyFullTextSuzy.addAttribute(.link, value: "suzy://safety", range: suzyLinkRangeSuzy)
        suzyFullTextSuzy.addAttribute(.foregroundColor, value: UIColor.white, range: suzyLinkRangeSuzy)
        suzyFullTextSuzy.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: suzyLinkRangeSuzy)
        
        suzySafetyFooterSuzy.attributedText = suzyFullTextSuzy
        suzySafetyFooterSuzy.delegate = self
        
        NSLayoutConstraint.activate([
            suzyCollectionSuzy.topAnchor.constraint(equalTo: suzyNavWrapperSuzy.bottomAnchor),
            suzyCollectionSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            suzyCollectionSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            suzyCollectionSuzy.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            suzySafetyFooterSuzy.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            suzySafetyFooterSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            suzySafetyFooterSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    private func suzyFetchRemoteRecordsSuzy() {
        // 模拟网络请求
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let self = self else { return }
            
            // 这里的 suzyMockUsersSuzy 是你之前生成的 随机数据
            let suzyRawDataSuzy = SuzyStaticDataCenterSuzy.suzyMockUserLibrarySuzy
            
            // 执行匹配过滤逻辑
            self.suzyDataSourceSuzy = self.suzyPerformTagMatchingSuzy(suzyRemoteUsersSuzy: suzyRawDataSuzy)
            
            // 刷新列表
            self.suzyCollectionSuzy.reloadData()
         
        }
    }
    private func suzyPerformTagMatchingSuzy(suzyRemoteUsersSuzy: [SuzyMatchEntitySuzy]) -> [SuzyMatchEntitySuzy] {
        // 1. 获取本地标签（此处省略原有获取逻辑...）
        guard let suzyMyProfileSuzy = SuzySecureVaultSuzy.sharedSuzy.suzyFetchCurrentProfileSuzy() else {
            // 即便没有标签，也只返回前6条，保持页面整洁
            return Array(suzyRemoteUsersSuzy.shuffled().prefix(6))
        }
        
        let suzySelectedTagsSuzy = suzyMyProfileSuzy.suzyTagsSuzy
        
        // 2. 模式判断
        var suzyResultSetSuzy: [SuzyMatchEntitySuzy] = []
        
        if suzyCurrentMatchTypeSuzy == .suzyAllSuzy || suzySelectedTagsSuzy.isEmpty {
            suzyResultSetSuzy = suzyRemoteUsersSuzy
        } else {
            // 执行交集匹配算法
            suzyResultSetSuzy = suzyRemoteUsersSuzy.filter { suzyUserSuzy in
                let suzyRemoteTagSetSuzy = Set(suzyUserSuzy.suzyInterestsSuzy)
                let suzyMyTagSetSuzy = Set(suzySelectedTagsSuzy)
                return !suzyRemoteTagSetSuzy.isDisjoint(with: suzyMyTagSetSuzy)
            }
        }
        
        // 3. 核心限制逻辑：先乱序，再取前6条
        // shuffled() 保证了用户每次点击匹配看到的 6 个人是不一样的
        let suzyFinalLimitedResultSuzy = Array(suzyResultSetSuzy.shuffled().prefix(6))
        
        return suzyFinalLimitedResultSuzy
    }
    private func suzySetupNavigationBarSuzy() {
            suzyNavWrapperSuzy.backgroundColor = .clear
            suzyNavWrapperSuzy.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(suzyNavWrapperSuzy)
            
            // 返回按钮
            suzyBackActionBtnSuzy.setImage(UIImage(named: "shaderCodeSuzy"), for: .normal)
            suzyBackActionBtnSuzy.addTarget(self, action: #selector(suzyHandleBackEventSuzy), for: .touchUpInside)
            suzyBackActionBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
            suzyNavWrapperSuzy.addSubview(suzyBackActionBtnSuzy)
            
            // 通知与设置按钮
            suzyNotifyIconBtnSuzy.setImage(UIImage(named: "hardwareAccelSuzy"), for: .normal)
            suzySettingsIconBtnSuzy.setImage(UIImage(named: "textureMappingSuue"), for: .normal)
            
            let suzyRightStackSuzy = UIStackView(arrangedSubviews: [suzyNotifyIconBtnSuzy, suzySettingsIconBtnSuzy])
            suzyRightStackSuzy.axis = .horizontal
            suzyRightStackSuzy.spacing = 15
            suzyRightStackSuzy.translatesAutoresizingMaskIntoConstraints = false
            suzyNavWrapperSuzy.addSubview(suzyRightStackSuzy)
            
            NSLayoutConstraint.activate([
                suzyNavWrapperSuzy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                suzyNavWrapperSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                suzyNavWrapperSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                suzyNavWrapperSuzy.heightAnchor.constraint(equalToConstant: 44),
                
                suzyBackActionBtnSuzy.leadingAnchor.constraint(equalTo: suzyNavWrapperSuzy.leadingAnchor, constant: 15),
                suzyBackActionBtnSuzy.centerYAnchor.constraint(equalTo: suzyNavWrapperSuzy.centerYAnchor),
                suzyBackActionBtnSuzy.widthAnchor.constraint(equalToConstant: 30),
                suzyBackActionBtnSuzy.heightAnchor.constraint(equalToConstant: 30),
                
                suzyRightStackSuzy.trailingAnchor.constraint(equalTo: suzyNavWrapperSuzy.trailingAnchor, constant: -15),
                suzyRightStackSuzy.centerYAnchor.constraint(equalTo: suzyNavWrapperSuzy.centerYAnchor)
            ])
        }
        
        @objc private func suzyHandleBackEventSuzy() {
            if let suzyNavSuzy = self.navigationController {
                suzyNavSuzy.popViewController(animated: true)
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }
}

extension SuzyAlgorithmyControllerSuzy: UICollectionViewDelegate, UICollectionViewDataSource, UITextViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suzyDataSourceSuzy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let suzyCellSuzy = collectionView.dequeueReusableCell(withReuseIdentifier: "SuzyAlgorithmGridSuzy", for: indexPath) as! SuzyAlgorithmGridSuzy
        suzyCellSuzy.suzyUpdateLayoutModeSuzy(suzyItemSuzy: suzyDataSourceSuzy[indexPath.item], suzyModeSuzy: suzyCurrentMatchTypeSuzy)
        return suzyCellSuzy
    }
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let suzyTargetUserSuzy = suzyDataSourceSuzy[indexPath.item]
        
        let suzyPopupSuzy = SuzyUserQuickViewSuzy(frame: self.view.bounds)
        suzyPopupSuzy.alpha = 0
        suzyPopupSuzy.suzyShowWithEntitySuzy(suzyItemSuzy: suzyTargetUserSuzy)
        suzyPopupSuzy.suzyOnMessagesendRequestedSuzy = {[weak self] in
            
             if let firstcv =   SuzyMessageCacheManager.shared.conversations.filter { SuzyConversationModel in
                 SuzyConversationModel.userInfo.suzyIdentifierSuzy == suzyTargetUserSuzy.suzyIdentifierSuzy
             }.first{
                 
                 let detailVC = SuzyChatDetailViewController()
                 detailVC.targetUser = suzyTargetUserSuzy
                 detailVC.chatHistory = firstcv.messages
                 self?.navigationController?.pushViewController(detailVC, animated: true)
             }else{
                 let detailVC = SuzyChatDetailViewController()
                 detailVC.targetUser = suzyTargetUserSuzy
                 detailVC.chatHistory = [SuzyChatDetailRecord]()
                 self?.navigationController?.pushViewController(detailVC, animated: true)
             }
             
          
             
        }
        // 交互逻辑：点击视频通话跳转
        suzyPopupSuzy.suzyOnVideoCallRequestedSuzy = { [weak self] in
            print("Suzy: Connecting video call to \(suzyTargetUserSuzy.suzyUsernameSuzy)")
            // 这里可以跳转到视频通话虚假页面
            // 权限检查
            guard AVCaptureDevice.authorizationStatus(for: .video) == .authorized else {
                SuzyPermissionManagerSuzy.shared.suzyShowCameraDeniedAlertSuzy(on: self!)
                return
            }
            
            let calddvc = SuzyCallSessionVCSuzy.init(suzyMatchSuzy: suzyTargetUserSuzy)

            calddvc.modalPresentationStyle = .fullScreen
            self?.present(calddvc, animated: true)
           
        }
        
        self.view.addSubview(suzyPopupSuzy)
        UIView.animate(withDuration: 0.3) {
            suzyPopupSuzy.alpha = 1
        }
    }
    

    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if URL.absoluteString == "suzy://safety" {
            let eulaVcSuzy = SuzyLegalReaderControllerSuzy(suzyTypeSuzy: .suzyLegal)
            eulaVcSuzy.modalPresentationStyle = .overFullScreen
            eulaVcSuzy.modalTransitionStyle = .crossDissolve
            self.present(eulaVcSuzy, animated: true)
            return false
        }
        return true
    }
}
extension SuzyAlgorithmyControllerSuzy: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let suzySpacingSuzy: CGFloat = 15
        let suzyWSuzy = (UIScreen.main.bounds.width - (suzySpacingSuzy * 3)) / 2
        
        // 根据模式动态计算高度：All 模式不计入标签高度
        let suzyBaseHSuzy = suzyWSuzy * 1.15 // 基础头像 + 名字高度
        let suzyFinalHSuzy = (suzyCurrentMatchTypeSuzy == .suzyAllSuzy) ? suzyBaseHSuzy : (suzyBaseHSuzy + 30)
        
        return CGSize(width: suzyWSuzy, height: suzyFinalHSuzy)
    }

    
}
