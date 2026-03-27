//
//  JuicoyCallPulseController.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/24.
//

import UIKit
import AVFoundation

enum SuzyCallStatusSuzy {
    case suzyInitializingSuzy
    case suzyConnectingSuzy
    case suzyConnectedSuzy
    case suzyUserLeftSuzy
    case suzyHangupSuzy
}

fileprivate struct SuzyLocalAssetsSuzy {
    static let suzyMaleVidsSuzy = ["suzy_fake_m_1", "suzy_fake_m_2"]
    static let suzyFemaleVidsSuzy = ["femaleZEEEE1", "femaleZEEEE2"]
}

final class SuzyCallSessionVCSuzy: UIViewController {
    private let suzyCaptureQueueSuzy = DispatchQueue(label: "com.suzy.camera.running.queue.suzy")

    deinit {
        print("SuzyCallSessionVCSuzy 销毁了")
        if let observer = suzyPlaybackEndedObserverSuzy {
            NotificationCenter.default.removeObserver(observer)
        }
    }
  
     var protrShow:(()->(Void))?
    private let suzyFallbackBgImageViewSuzy: UIImageView = {
        let iv = UIImageView.init(frame: UIScreen.main.bounds)
        iv.image = UIImage(named: "SuzyWelcomeBgSuzyELUA@")
        iv.contentMode = .scaleAspectFill
        
        return iv
    }()
    // MARK: - Data Source Suzy
    private let suzyCurrentMatchSuzy: SuzyMatchEntitySuzy
    private var suzyCallStateSuzy: SuzyCallStatusSuzy = .suzyInitializingSuzy
    private var suzyPlaybackEndedObserverSuzy: NSObjectProtocol?

    // MARK: - Hardware Layer (Background) Suzy
    private var suzyCapSessionSuzy: AVCaptureSession?
    private var suzySelfPreviewLayerSuzy: AVCaptureVideoPreviewLayer?
    private let suzyUserPlaceholderSuzy = UIView() // Grey background
    
    // MARK: - Remote Fake Layer (Small Corner) Suzy
    private var suzyRemoteVidPlayerSuzy: AVPlayer?
    private var suzyRemotePreviewLayerSuzy: AVPlayerLayer?
    private let suzyRemoteContainerSuzy = UIView()
    
    // MARK: - UI Components Suzy
//    private let suzyStatusAlertSuzy = UILabel()
    private let suzyControlWrapperSuzy = UIStackView()
    private let suzyCameraSwitchBtnSuzy = UIButton(type: .custom)
    private let suzyCameraToggleBtnSuzy = UIButton(type: .custom)
    private let suzyMatchedUserInfoSuzy = UIButton(type: .custom)
    private let suzyCoinIndicatorBtnSuzy = UIButton(type: .custom)
    private let suzyEndCallActionBtnSuzy = UIButton(type: .custom)

    // MARK: - Init Suzy
    init(suzyMatchSuzy: SuzyMatchEntitySuzy) {
        self.suzyCurrentMatchSuzy = suzyMatchSuzy
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }

    // MARK: - Lifecycle Suzy
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(suzyFallbackBgImageViewSuzy)
        
        suzyBuildCallCanvasSuzy()
        
        suzyRequestHardwarePermsSuzy()
        NotificationCenter.default.addObserver(self, selector: #selector(suzyPerformHangupActionSuzy), name: NSNotification.Name("SuzySwitchToReportDetails"), object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        suzyRemoteContainerSuzy.frame = view.bounds
        suzyRemotePreviewLayerSuzy?.frame = suzyRemoteContainerSuzy.bounds
        suzySelfPreviewLayerSuzy?.frame = suzyUserPlaceholderSuzy.bounds
    }

    // MARK: - Hierarchy Suzy
    private func suzyBuildCallCanvasSuzy() {
        
        suzyRemoteContainerSuzy.backgroundColor = .clear
         suzyRemoteContainerSuzy.frame = view.bounds
         
         view.addSubview(suzyRemoteContainerSuzy)
        
       
        suzyUserPlaceholderSuzy.backgroundColor = .darkGray
        view.addSubview(suzyUserPlaceholderSuzy)
    
        suzyUserPlaceholderSuzy.layer.cornerRadius = 15
        suzyUserPlaceholderSuzy.layer.masksToBounds = true
        suzyUserPlaceholderSuzy.translatesAutoresizingMaskIntoConstraints = false
        

        
        // 3. 顶部 UI（权限、镜头、信息）
        suzyControlWrapperSuzy.axis = .horizontal
        suzyControlWrapperSuzy.spacing = 15
        suzyControlWrapperSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyControlWrapperSuzy)
      
        suzyCameraSwitchBtnSuzy.setImage(UIImage(named: "camerarotateSuzi"), for: .normal)
        suzyCameraSwitchBtnSuzy.addTarget(self, action: #selector(suzyPerformCamSwitchSuzy), for: .touchUpInside)
        suzyCameraToggleBtnSuzy.setTitle(" Camera on", for: .normal)
        suzyCameraToggleBtnSuzy.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        suzyCameraToggleBtnSuzy.setTitle(" Camera off", for: .selected)
        suzyCameraToggleBtnSuzy.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2500)
        suzyCameraToggleBtnSuzy.layer.cornerRadius = 10
        suzyCameraToggleBtnSuzy.layer.masksToBounds = true
        
        suzyCameraToggleBtnSuzy.setImage(UIImage(systemName: "video.fill"), for: .normal)
        suzyCameraToggleBtnSuzy.setImage(UIImage(systemName: "video.slash.fill"), for: .selected)
        suzyCameraToggleBtnSuzy.addTarget(self, action: #selector(suzyPerformCamToggleSuzy), for: .touchUpInside)
        
        
        suzyMatchedUserInfoSuzy.addTarget(self, action: #selector(reportdUserInfoSuzy), for: .touchUpInside)
        suzyMatchedUserInfoSuzy.setTitle(suzyCurrentMatchSuzy.suzyUsernameSuzy, for: .normal)
        suzyMatchedUserInfoSuzy.titleLabel?.font = .systemFont(ofSize: 12)
        suzyMatchedUserInfoSuzy.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2500)
        suzyMatchedUserInfoSuzy.layer.cornerRadius = 10
        suzyMatchedUserInfoSuzy.setImage(UIImage(named: "exclamationmark"), for: .normal)
        suzyMatchedUserInfoSuzy.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
      
            
        suzyMatchedUserInfoSuzy.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)

        [suzyCameraSwitchBtnSuzy, suzyCameraToggleBtnSuzy, suzyMatchedUserInfoSuzy].forEach {
            $0.tintColor = .white
            $0.translatesAutoresizingMaskIntoConstraints = false
            suzyControlWrapperSuzy.addArrangedSubview($0)
            
        }
        
        suzyCoinIndicatorBtnSuzy.addTarget(self, action: #selector(suzyHandleIcebreakerTapSuzy), for: .touchUpInside)
        suzyCoinIndicatorBtnSuzy.setBackgroundImage(UIImage.init(named: "suzIndicatorBtnSuzy"), for: .normal)
        suzyCoinIndicatorBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyCoinIndicatorBtnSuzy)
        
        suzyEndCallActionBtnSuzy.setImage(UIImage(systemName: "phone.down.fill"), for: .normal)
        suzyEndCallActionBtnSuzy.tintColor = .white
        suzyEndCallActionBtnSuzy.backgroundColor = .systemRed
        suzyEndCallActionBtnSuzy.layer.cornerRadius = 40
        suzyEndCallActionBtnSuzy.addTarget(self, action: #selector(suzyPerformHangupActionSuzy), for: .touchUpInside)
        suzyEndCallActionBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyEndCallActionBtnSuzy)
        
        // 5. 状态提示框（顶部）
//        suzyStatusAlertSuzy.textColor = .white
//        suzyStatusAlertSuzy.backgroundColor = UIColor(white: 0.1, alpha: 0.8)
//        suzyStatusAlertSuzy.font = .systemFont(ofSize: 18, weight: .semibold)
//        suzyStatusAlertSuzy.textAlignment = .center
//        suzyStatusAlertSuzy.layer.cornerRadius = 15
//        suzyStatusAlertSuzy.layer.masksToBounds = true
//        suzyStatusAlertSuzy.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(suzyStatusAlertSuzy)
        
        NSLayoutConstraint.activate([
            suzyCameraSwitchBtnSuzy.widthAnchor.constraint(equalToConstant: 40),
            suzyCameraToggleBtnSuzy.widthAnchor.constraint(equalToConstant: 114),
            suzyMatchedUserInfoSuzy.widthAnchor.constraint(equalToConstant: 140),
            
            suzyControlWrapperSuzy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            suzyControlWrapperSuzy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            suzyUserPlaceholderSuzy.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            suzyUserPlaceholderSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            suzyUserPlaceholderSuzy.widthAnchor.constraint(equalToConstant: 130),
            suzyUserPlaceholderSuzy.heightAnchor.constraint(equalToConstant: 170),
            
            suzyCoinIndicatorBtnSuzy.bottomAnchor.constraint(equalTo: suzyEndCallActionBtnSuzy.topAnchor, constant: -30),
            suzyCoinIndicatorBtnSuzy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            suzyCoinIndicatorBtnSuzy.heightAnchor.constraint(equalToConstant: 45),
            suzyCoinIndicatorBtnSuzy.widthAnchor.constraint(equalToConstant: 319),
            
            
            suzyEndCallActionBtnSuzy.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            suzyEndCallActionBtnSuzy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            suzyEndCallActionBtnSuzy.widthAnchor.constraint(equalToConstant: 80),
            suzyEndCallActionBtnSuzy.heightAnchor.constraint(equalToConstant: 80),

        ])
        
    }
}

extension SuzyCallSessionVCSuzy {
    
   @objc func reportdUserInfoSuzy()  {
       let actionreport = SuzyActioningSheetVCSuzy()
       actionreport.pathUID = suzyCurrentMatchSuzy.suzyIdentifierSuzy
       actionreport.modalPresentationStyle = .fullScreen
       self.present(actionreport, animated: true)
       
    }
    
    // MARK: - Hardware Perms Suzy
    private func suzyRequestHardwarePermsSuzy() {
        DispatchQueue.main.async {
            SuzyHudManagerSuzy.shared.suzyShowStatusLoadingSuzy(message: " Connecting... ",ifhaveLoading: false)
        }
        
        AVCaptureDevice.requestAccess(for: .video) { suzyVidSuzy in
            
            DispatchQueue.main.async {
            
                if suzyVidSuzy{
                    self.suzySetupSelfCamSessionSuzy()
                   
                } else {
                    SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "Please enable camera permissions",isSuccess: false)
                  
                }
                
                
                self.suzyInitiateCallStateMachineSuzy()
            }
            
            
        }
        
        AVCaptureDevice.requestAccess(for: .audio) { suzyAudSuzy in
            if suzyAudSuzy == false{
                SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "Please enable microphone permission",isSuccess: false)
            }
            
        }
    }
    
    // MARK: - State Machine Suzy
    private func suzyInitiateCallStateMachineSuzy() {
        self.suzyCallStateSuzy = .suzyConnectingSuzy
        
       
        // 1. 检查这个特定用户是否已经拨打过并接通
        let suzyCalledIdsSuzy = UserDefaults.standard.stringArray(forKey: "suzy_called_success_ids") ?? []
        
        // 延迟 2.5 秒模拟拨号过程，增加真实感
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
            guard let self = self else { return }
            SuzyHudManagerSuzy.shared.suzyHideLoadingSuzy()
            if suzyCalledIdsSuzy.contains(self.suzyCurrentMatchSuzy.suzyIdentifierSuzy) {
                // 如果该 ID 之前接通成功过，直接显示离开
                SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "User is busy now", isSuccess: false)
                self.suzyHandleUserUnavailableSuzy(reason: "User is busy now")
            } else {
                // 如果是新用户，尝试分配视频资产
                self.suzyConfigureRemoteFakeFeedSuzy()
            }
        }
    }

    // MARK: - Fake Feed Suzy
    private func suzyConfigureRemoteFakeFeedSuzy() {
        // 2. 检查视频资产消耗情况
        var suzyPlayedVidsSuzy = UserDefaults.standard.stringArray(forKey: "suzy_played_vids") ?? []
        let suzyBasePoolSuzy = (self.suzyCurrentMatchSuzy.suzyGenderSuzy == 0) ?
            SuzyLocalAssetsSuzy.suzyMaleVidsSuzy :
            SuzyLocalAssetsSuzy.suzyFemaleVidsSuzy
        
        // 找出未使用的视频
        let suzyAvailableVidsSuzy = suzyBasePoolSuzy.filter { !suzyPlayedVidsSuzy.contains($0) }
        
        guard let suzyTargetVidSuzy = suzyAvailableVidsSuzy.first else {
            // 如果该性别的 2 个视频都用完了，即便没打过这个 ID 也显示离开
            SuzyHudManagerSuzy.shared.suzyHideLoadingSuzy()
            self.suzyHandleUserUnavailableSuzy(reason: "User left the match")
            SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "User left the match", isSuccess: false)
            return
        }
        
        // --- 执行到这里说明：ID 没打过 且 有可用视频 ---
        
        // 3. 记录 ID 和 视频文件名，防止二次使用
        var suzyCalledIdsSuzy = UserDefaults.standard.stringArray(forKey: "suzy_called_success_ids") ?? []
        suzyCalledIdsSuzy.append(self.suzyCurrentMatchSuzy.suzyIdentifierSuzy)
        UserDefaults.standard.set(suzyCalledIdsSuzy, forKey: "suzy_called_success_ids")
        
        suzyPlayedVidsSuzy.append(suzyTargetVidSuzy)
        UserDefaults.standard.set(suzyPlayedVidsSuzy, forKey: "suzy_played_vids")
        
        // 4. 视频播放逻辑
//        self.suzyStatusAlertSuzy.isHidden = true
        guard let suzyPathSuzy = Bundle.main.path(forResource: suzyTargetVidSuzy, ofType: "mp4") else { return }
        let suzyVidURLSuzy = URL(fileURLWithPath: suzyPathSuzy)
        
        suzyRemoteVidPlayerSuzy = AVPlayer(url: suzyVidURLSuzy)
        suzyRemotePreviewLayerSuzy?.removeFromSuperlayer()
        suzyRemotePreviewLayerSuzy = AVPlayerLayer(player: suzyRemoteVidPlayerSuzy)
        suzyRemotePreviewLayerSuzy?.videoGravity = .resizeAspectFill
        suzyRemotePreviewLayerSuzy?.frame = suzyRemoteContainerSuzy.bounds
        suzyRemoteContainerSuzy.layer.addSublayer(suzyRemotePreviewLayerSuzy!)
        suzyRemoteVidPlayerSuzy?.play()
        
        // 监听正常播放结束
        suzyPlaybackEndedObserverSuzy = NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: suzyRemoteVidPlayerSuzy?.currentItem, queue: nil) { [weak self] _ in
            DispatchQueue.main.async {
                self?.suzyHandleUserUnavailableSuzy(reason: "The user has left")
                SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "The user has left", isSuccess: false)
            }
        }
    }

    // MARK: - Helper Suzy
    private func suzyHandleUserUnavailableSuzy(reason: String) {
//        self.suzyStatusAlertSuzy.text = " \(reason) "
//        self.suzyStatusAlertSuzy.isHidden = false
//
        SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: reason, isSuccess: false)
        // 确保提示框在最前，且停止视频展示
//        view.bringSubviewToFront(suzyStatusAlertSuzy)
        suzyRemoteVidPlayerSuzy?.pause()
        suzyRemotePreviewLayerSuzy?.opacity = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) { [weak self] in
            SuzyHudManagerSuzy.shared.suzyHideLoadingSuzy()
            self?.suzyPerformHangupActionSuzy()
        }
    }

    private func suzyHandleUserUnavailableSuzy() {
        // 确保 UI 提示在最上层
//        view.bringSubviewToFront(suzyStatusAlertSuzy)
//        suzyStatusAlertSuzy.text = " User is no longer online "
//        suzyStatusAlertSuzy.isHidden = false
        SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: " User is no longer online ", isSuccess: false)
        // 停止任何可能正在播放的残余视频
        suzyRemoteVidPlayerSuzy?.pause()
        suzyRemotePreviewLayerSuzy?.opacity = 0
        
        // 延迟 2 秒后挂断返回，模拟真实的“断开”感
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) { [weak self] in
           
            SuzyHudManagerSuzy.shared.suzyHideLoadingSuzy()
            self?.suzyPerformHangupActionSuzy()
        }
    }
}


extension SuzyCallSessionVCSuzy {
   
    func suzyToggleCameraSessionSuzy() {
        // 检查 session 是否已经在运行，避免重复启动
        guard !(self.suzyCapSessionSuzy?.isRunning ?? false) else { return }
        
        // 将耗时的启动操作移出主线程
        suzyCaptureQueueSuzy.async { [weak self] in
            guard let self = self else { return }
            
            // 执行启动逻辑
            self.suzyCapSessionSuzy?.startRunning()
            
            // 如果启动后需要更新 UI（比如隐藏加载菊花），必须回到主线程
//            DispatchQueue.main.async {
//               
//                SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "Camera session is now active.",isSuccess: false)
//            }
        }
    }
    private func suzySetupSelfCamSessionSuzy() {
        let session = AVCaptureSession()
            self.suzyCapSessionSuzy = session
            session.sessionPreset = .high // 改为 high 提高兼容性
        
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
                  let input = try? AVCaptureDeviceInput(device: device) else { return }

            if session.canAddInput(input) {
                session.addInput(input)
            }

            let previewLayer = AVCaptureVideoPreviewLayer(session: session)
            previewLayer.videoGravity = .resizeAspectFill
            self.suzySelfPreviewLayerSuzy = previewLayer
            
            // 必须在主线程添加 Layer
            DispatchQueue.main.async {
                self.suzyUserPlaceholderSuzy.layer.addSublayer(previewLayer)
                previewLayer.frame = self.suzyUserPlaceholderSuzy.bounds
            }

            // 在后台线程启动
        suzyToggleCameraSessionSuzy()
    }
    
    // MARK: - Actions Suzy
    @objc private func suzyPerformCamSwitchSuzy() {
        guard let suzySessionSuzy = suzyCapSessionSuzy else { return }
        suzySessionSuzy.beginConfiguration()
        guard let suzyCurrentInputSuzy = suzySessionSuzy.inputs.first as? AVCaptureDeviceInput else { return }
        
        let suzyCurrentPositionSuzy = suzyCurrentInputSuzy.device.position
        let suzyNewPositionSuzy = suzyCurrentPositionSuzy == .back ? AVCaptureDevice.Position.front : AVCaptureDevice.Position.back
        
        suzySessionSuzy.removeInput(suzyCurrentInputSuzy)
        if let suzyDiscoverySessionSuzy = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position:suzyNewPositionSuzy),
           let suzyNewInputSuzy = try? AVCaptureDeviceInput(device: suzyDiscoverySessionSuzy) {
            suzySessionSuzy.addInput(suzyNewInputSuzy)
        }
        suzySessionSuzy.commitConfiguration()
    }
    
    @objc private func suzyPerformCamToggleSuzy() {
        suzyCameraToggleBtnSuzy.isSelected.toggle()
        if suzyCameraToggleBtnSuzy.isSelected {
            suzyCapSessionSuzy?.stopRunning()
            suzySelfPreviewLayerSuzy?.opacity = 0
            suzyUserPlaceholderSuzy.isHidden = false
        } else {
            suzyToggleCameraSessionSuzy()
            suzySelfPreviewLayerSuzy?.opacity = 1
 
        }
    }
    

    @objc private func suzyPerformHangupActionSuzy() {
        suzyCapSessionSuzy?.stopRunning()
        suzyRemoteVidPlayerSuzy?.pause()
        self.dismiss(animated: true)
    }
}



//MARK: - 破冰问题
extension SuzyCallSessionVCSuzy {
  
    private static let suzyPoolSuzy = [
        "If you could travel anywhere right now, where would it be? ✈️",
        "What’s the most rebellious thing you’ve ever done? 😎",
        "Are you a morning bird or a late-night owl? 🦉",
        "What is your go-to 'comfort food' when you're tired? 🍕",
        "If you won the lottery tomorrow, what’s the first thing you’d buy? 💰",
        "What’s the last movie or show that made you cry? 🎬",
        "What is your hidden talent that most people don't know about? 🎤",
        "Beach vacation or mountain hiking? 🏖️ / 🏔️"
    ]

    // 点击底部紫色按钮触发
    @objc private func suzyHandleIcebreakerTapSuzy() {
        let suzyCurrentCoinsSuzy = SuzySecureVaultSuzy.sharedSuzy.suzyFetchCurrentProfileSuzy()?.suzyCoinsSuzy ?? 0
       
        suzyShowCustomAlertSuzy(isEnough: suzyCurrentCoinsSuzy >= 20)
    }
    
    private func suzyShowCustomAlertSuzy(isEnough: Bool) {
        let suzyOverlaySuzy = UIView(frame: view.bounds)
        suzyOverlaySuzy.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        suzyOverlaySuzy.tag = 999
        
        let suzyAlertViewSuzy = UIImageView(image:  UIImage(named: "suzyCardContainerSuzy"))
        suzyAlertViewSuzy.isUserInteractionEnabled = true
        suzyAlertViewSuzy.contentMode = .scaleToFill
        suzyAlertViewSuzy.translatesAutoresizingMaskIntoConstraints = false
     
        suzyOverlaySuzy.addSubview(suzyAlertViewSuzy)
        
        let suzyMessageIconSuzy = UIImageView()
        suzyMessageIconSuzy.image = UIImage(named: "bubbleacall")
        suzyMessageIconSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyOverlaySuzy.addSubview(suzyMessageIconSuzy)
        
    
     
        
        
        view.addSubview(suzyOverlaySuzy)
        
        // 核心文案逻辑
        let titleLabel = UILabel()
        titleLabel.text = "Reminder"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        suzyAlertViewSuzy.addSubview(titleLabel)
        let msgLabel = UILabel()
        msgLabel.textColor = .lightGray
        msgLabel.numberOfLines = 0
        msgLabel.textAlignment = .center
        msgLabel.text = isEnough ? "Are you sure you want to spend 20 gold coins to unlock 4 icebreaker questions?" : "You don't have enough coins, please recharge now."
        msgLabel.translatesAutoresizingMaskIntoConstraints = false
        suzyAlertViewSuzy.addSubview(msgLabel)
        
        let actionBtn = UIButton(type: .custom)
        actionBtn.layer.cornerRadius = 25
        actionBtn.backgroundColor = .systemPurple
        actionBtn.setTitle(isEnough ? "Continue" : "Recharge", for: .normal)
        actionBtn.translatesAutoresizingMaskIntoConstraints = false
        suzyAlertViewSuzy.addSubview(actionBtn)
        
        let suzyDismissBtnSuzy = UIButton(type: .custom)
       
        // 关闭按钮
        suzyDismissBtnSuzy.setTitle("Cancel", for: .normal)
        suzyDismissBtnSuzy.setTitleColor(.white, for: .normal)
        suzyDismissBtnSuzy.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        suzyDismissBtnSuzy.addTarget(self, action: #selector(suzyHideQuickViewSuzy), for: .touchUpInside)
        suzyDismissBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyAlertViewSuzy.addSubview(suzyDismissBtnSuzy)
        // 约束简略 (根据你的布局习惯调整)
        NSLayoutConstraint.activate([
            suzyAlertViewSuzy.centerXAnchor.constraint(equalTo: suzyOverlaySuzy.centerXAnchor),
            suzyAlertViewSuzy.centerYAnchor.constraint(equalTo: suzyOverlaySuzy.centerYAnchor),
            suzyAlertViewSuzy.widthAnchor.constraint(equalToConstant: 325),
            suzyAlertViewSuzy.heightAnchor.constraint(equalToConstant: 306),
            suzyMessageIconSuzy.widthAnchor.constraint(equalToConstant: 186),
            suzyMessageIconSuzy.heightAnchor.constraint(equalToConstant: 175),
            suzyMessageIconSuzy.centerXAnchor.constraint(equalTo: suzyAlertViewSuzy.centerXAnchor),
            suzyMessageIconSuzy.bottomAnchor.constraint(equalTo: suzyAlertViewSuzy.topAnchor, constant: 60),
            
            titleLabel.topAnchor.constraint(equalTo: suzyAlertViewSuzy.topAnchor, constant: 70),
            titleLabel.centerXAnchor.constraint(equalTo: suzyAlertViewSuzy.centerXAnchor),
            
            msgLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            msgLabel.leadingAnchor.constraint(equalTo: suzyAlertViewSuzy.leadingAnchor, constant: 13),
            msgLabel.trailingAnchor.constraint(equalTo: suzyAlertViewSuzy.trailingAnchor, constant: -13),
            
            actionBtn.heightAnchor.constraint(equalToConstant: 50),
            actionBtn.leadingAnchor.constraint(equalTo: suzyAlertViewSuzy.leadingAnchor, constant: 13),
            actionBtn.trailingAnchor.constraint(equalTo: suzyAlertViewSuzy.trailingAnchor, constant: -13),
            actionBtn.topAnchor.constraint(equalTo: msgLabel.bottomAnchor, constant: 35),
            
            suzyDismissBtnSuzy.centerXAnchor.constraint(equalTo: actionBtn.centerXAnchor),
            suzyDismissBtnSuzy.heightAnchor.constraint(equalToConstant: 40),
            
            suzyDismissBtnSuzy.topAnchor.constraint(equalTo: actionBtn.bottomAnchor,constant: 10)
            
           
        ])
        
        // 按钮点击处理
        actionBtn.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            suzyOverlaySuzy.removeFromSuperview()
            if isEnough {
                self.suzyShowFinalQuestionsSuzy()
            } else {
                let vc = SuzyGoldShopVCSuzy()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
                if self.protrShow != nil {
                    self.protrShow?()
                   
                }
                
            }
        }), for: .touchUpInside)
    }
    @objc private func suzyHideQuickViewSuzy() {
        let suzyOverlaySuzy = view.viewWithTag(999)
        UIView.animate(withDuration: 0.3, animations: {
            
            suzyOverlaySuzy?.alpha = 0 }) { _ in
       
            
            suzyOverlaySuzy?.removeFromSuperview()
        }
    }
    private func suzyShowFinalQuestionsSuzy() {
       
      
       
        SuzySecureVaultSuzy.sharedSuzy.suzyUpdateMutableAttributesSuzy(deltaCoinsSuzy: -20)
        
      
        
        let suzySelectedQuestionsSuzy = SuzyCallSessionVCSuzy.suzyPoolSuzy.shuffled().prefix(4)
        
        let suzyDisplayMsgSuzy = suzySelectedQuestionsSuzy.joined(separator: "\n\n")
        
        let finalAlert = UIAlertController(title: "Icebreakers For You", message: suzyDisplayMsgSuzy, preferredStyle: .alert)
        finalAlert.addAction(UIAlertAction(title: "Cool!", style: .cancel))
        self.present(finalAlert, animated: true)
    }
}
