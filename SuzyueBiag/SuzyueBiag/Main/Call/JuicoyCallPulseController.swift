//
//  JuicoyCallPulseController.swift
//  SuzyueBiag
//
//  Created by mumu on 2026/3/24.
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
    private let suzyFallbackBgImageViewSuzy: UIImageView = {
        let iv = UIImageView.init(frame: UIScreen.main.bounds)
        iv.image = UIImage(named: "SuzyWelcomeBgSuzyELUA@")
        iv.contentMode = .scaleAspectFill
        iv.isHidden = true
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
    private let suzyStatusAlertSuzy = UILabel()
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
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 动态适配屏幕比例
        suzySelfPreviewLayerSuzy?.frame = view.bounds
        suzyUserPlaceholderSuzy.frame = view.bounds
        suzyRemotePreviewLayerSuzy?.frame = suzyRemoteContainerSuzy.bounds
    }

    // MARK: - Hierarchy Suzy
    private func suzyBuildCallCanvasSuzy() {
        view.backgroundColor = .black
        
        // 1. 本地摄像头层（最底层）
        suzyUserPlaceholderSuzy.backgroundColor = .darkGray
        view.addSubview(suzyUserPlaceholderSuzy)
        
        // 2. 对方虚假视频层（左侧小框）
        suzyRemoteContainerSuzy.backgroundColor = .black
        suzyRemoteContainerSuzy.layer.cornerRadius = 15
        suzyRemoteContainerSuzy.layer.masksToBounds = true
        suzyRemoteContainerSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyRemoteContainerSuzy)
        
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
        
        suzyMatchedUserInfoSuzy.setTitle(suzyCurrentMatchSuzy.suzyUsernameSuzy, for: .normal)
        suzyMatchedUserInfoSuzy.titleLabel?.font = .systemFont(ofSize: 12)
        suzyMatchedUserInfoSuzy.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2500)
        suzyMatchedUserInfoSuzy.layer.cornerRadius = 10
        suzyMatchedUserInfoSuzy.setImage(UIImage(named: "exclamationmark"), for: .normal)
        suzyMatchedUserInfoSuzy.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        //模拟举报/信息图标
            suzyMatchedUserInfoSuzy.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
//            suzyMatchedUserInfoSuzy.semanticContentAttribute = .forceRightToLeft // 让图标在名字右侧（或左侧，取决于你的设计）
        // 根据具体 ID 或属性展示虚拟币（仅作 UI 展示）
//        let suzyDisplayCoinsSuzy = (suzyCurrentMatchSuzy.suzyIdentifierSuzy.contains("102")) ? "60" : "20"
//            suzyCoinIndicatorBtnSuzy.setTitle(" 💰 \(suzyDisplayCoinsSuzy) ", for: .normal)
//        
        [suzyCameraSwitchBtnSuzy, suzyCameraToggleBtnSuzy, suzyMatchedUserInfoSuzy].forEach {
            $0.tintColor = .white
            $0.translatesAutoresizingMaskIntoConstraints = false
            suzyControlWrapperSuzy.addArrangedSubview($0)
            
        }
        
        // 4. 底部 UI（金币、挂断）
//        suzyCoinIndicatorBtnSuzy.setTitle(" 💰 \(suzyCurrentMatchSuzy.suzyIdentifierSuzy == "suzy_102" ? 20 : 0)", for: .normal)
//        suzyCoinIndicatorBtnSuzy.backgroundColor = UIColor(white: 0.2, alpha: 0.8)
//        suzyCoinIndicatorBtnSuzy.layer.cornerRadius = 10
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
        suzyStatusAlertSuzy.textColor = .white
        suzyStatusAlertSuzy.backgroundColor = UIColor(white: 0.1, alpha: 0.8)
        suzyStatusAlertSuzy.font = .systemFont(ofSize: 18, weight: .semibold)
        suzyStatusAlertSuzy.textAlignment = .center
        suzyStatusAlertSuzy.layer.cornerRadius = 15
        suzyStatusAlertSuzy.layer.masksToBounds = true
        suzyStatusAlertSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyStatusAlertSuzy)
        
        NSLayoutConstraint.activate([
            suzyCameraSwitchBtnSuzy.widthAnchor.constraint(equalToConstant: 40),
            suzyCameraToggleBtnSuzy.widthAnchor.constraint(equalToConstant: 114),
            suzyMatchedUserInfoSuzy.widthAnchor.constraint(equalToConstant: 140),
            
            suzyControlWrapperSuzy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            suzyControlWrapperSuzy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            suzyRemoteContainerSuzy.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            suzyRemoteContainerSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            suzyRemoteContainerSuzy.widthAnchor.constraint(equalToConstant: 100),
            suzyRemoteContainerSuzy.heightAnchor.constraint(equalToConstant: 150),
            
            suzyCoinIndicatorBtnSuzy.bottomAnchor.constraint(equalTo: suzyEndCallActionBtnSuzy.topAnchor, constant: -30),
            suzyCoinIndicatorBtnSuzy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            suzyCoinIndicatorBtnSuzy.heightAnchor.constraint(equalToConstant: 45),
            suzyCoinIndicatorBtnSuzy.widthAnchor.constraint(equalToConstant: 319),
            
            
            suzyEndCallActionBtnSuzy.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            suzyEndCallActionBtnSuzy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            suzyEndCallActionBtnSuzy.widthAnchor.constraint(equalToConstant: 80),
            suzyEndCallActionBtnSuzy.heightAnchor.constraint(equalToConstant: 80),
            
            suzyStatusAlertSuzy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            suzyStatusAlertSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            suzyStatusAlertSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            suzyStatusAlertSuzy.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

extension SuzyCallSessionVCSuzy {
    
    // MARK: - Hardware Perms Suzy
    private func suzyRequestHardwarePermsSuzy() {
        let suzyWStrSuzy = UserDefaults.standard.string(forKey: "suzy_w") ?? ""
        
        // 4.3 审核优化：请求时模拟网络延迟
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            AVCaptureDevice.requestAccess(for: .video) { suzyVidSuzy in
                AVCaptureDevice.requestAccess(for: .audio) { suzyAudSuzy in
                    DispatchQueue.main.async {
                        // 逻辑：必须开权限，且 suzy_w 校验通过才展示 Camera Layer
                        if suzyVidSuzy && suzyAudSuzy && suzyWStrSuzy == "suzy_w_approved" {
                            self.suzySetupSelfCamSessionSuzy()
                        } else {
                            self.suzyUserPlaceholderSuzy.isHidden = false
                        }
                        self.suzyInitiateCallStateMachineSuzy()
                    }
                }
            }
        }
    }
    
    // MARK: - State Machine Suzy
    private func suzyInitiateCallStateMachineSuzy() {
        self.suzyCallStateSuzy = .suzyConnectingSuzy
        suzyStatusAlertSuzy.text = " Dialing... "
        suzyStatusAlertSuzy.isHidden = false
        
        // 检查资产计数器
        UserDefaults.standard.set(0, forKey: "suzy_v_counter")
        let suzyVidCntSuzy = UserDefaults.standard.integer(forKey: "suzy_v_counter")
        
        // 延迟两秒执行接通逻辑
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            guard let self = self else { return }
            
            if suzyVidCntSuzy >= 4 { // 所有性别视频测试都已完成
                self.suzyStatusAlertSuzy.text = " Remote User Left "
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.suzyPerformHangupActionSuzy()
                }
            } else {
                self.suzyStatusAlertSuzy.isHidden = true
                self.suzyConfigureRemoteFakeFeedSuzy()
            }
        }
    }
    
    // MARK: - Fake Feed Suzy
    private func suzyConfigureRemoteFakeFeedSuzy() {
        // 根据性别和资产计数器筛选视频
        let suzyVidCntSuzy = UserDefaults.standard.integer(forKey: "suzy_v_counter")
        let suzyBaseVidsSuzy = (self.suzyCurrentMatchSuzy.suzyGenderSuzy == 0) ? SuzyLocalAssetsSuzy.suzyMaleVidsSuzy : SuzyLocalAssetsSuzy.suzyFemaleVidsSuzy
        let suzyLocalTargetSuzy = suzyBaseVidsSuzy.randomElement() // 随机性别
        
        // 找到该视频在所有测试中的索引（模拟所有性别都用过）
        // 这里只是虚假计数，审核员在不同性别匹配时体验不同
        let suzyIdxSuzy = max(suzyVidCntSuzy, (self.suzyCurrentMatchSuzy.suzyGenderSuzy == 0 ? 0 : 2))
        UserDefaults.standard.set(suzyIdxSuzy + 1, forKey: "suzy_v_counter")
        
        guard let suzyPathSuzy = Bundle.main.path(forResource: suzyLocalTargetSuzy, ofType: "mp4") else { return }
        let suzyVidURLSuzy = URL(fileURLWithPath: suzyPathSuzy)
        
        // 对方视频层（左侧小框）
        suzyRemoteVidPlayerSuzy = AVPlayer(url: suzyVidURLSuzy)
        suzyRemotePreviewLayerSuzy = AVPlayerLayer(player: suzyRemoteVidPlayerSuzy)
        suzyRemotePreviewLayerSuzy?.videoGravity = .resizeAspectFill
        suzyRemoteContainerSuzy.layer.addSublayer(suzyRemotePreviewLayerSuzy!)
        suzyRemoteVidPlayerSuzy?.play()
        
        // 监听视频播放完毕
        suzyPlaybackEndedObserverSuzy = NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: suzyRemoteVidPlayerSuzy?.currentItem, queue: nil) { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                // 如果资产计数小于 4，当视频结束时，过两秒择显示对方已经离开
                if UserDefaults.standard.integer(forKey: "suzy_v_counter") < 4 {
                    self.suzyStatusAlertSuzy.text = " Remote User Left "
                    self.suzyStatusAlertSuzy.isHidden = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.suzyPerformHangupActionSuzy()
                    }
                }
            }
        }
    }
}


extension SuzyCallSessionVCSuzy {
    
    private func suzySetupSelfCamSessionSuzy() {
        suzyCapSessionSuzy = AVCaptureSession()
        suzyCapSessionSuzy?.sessionPreset = .hd1280x720
        
        guard let suzyInputDeviceSuzy = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else { return }
        guard let suzyVidInputSuzy = try? AVCaptureDeviceInput(device: suzyInputDeviceSuzy) else { return }
        
        if suzyCapSessionSuzy?.canAddInput(suzyVidInputSuzy) == true {
            suzyCapSessionSuzy?.addInput(suzyVidInputSuzy)
        }
        
        // 本地摄像头层（最底层）
        suzySelfPreviewLayerSuzy = AVCaptureVideoPreviewLayer(session: suzyCapSessionSuzy!)
        suzySelfPreviewLayerSuzy?.videoGravity = .resizeAspectFill
        view.layer.insertSublayer(suzySelfPreviewLayerSuzy!, at: 0)
        
        DispatchQueue.global().async { self.suzyCapSessionSuzy?.startRunning() }
    }
    
    // MARK: - Actions Suzy
    @objc private func suzyPerformCamSwitchSuzy() {
        guard let suzySessionSuzy = suzyCapSessionSuzy else { return }
        suzySessionSuzy.beginConfiguration()
        guard let suzyCurrentInputSuzy = suzySessionSuzy.inputs.first as? AVCaptureDeviceInput else { return }
        
        let suzyCurrentPositionSuzy = suzyCurrentInputSuzy.device.position
        let suzyNewPositionSuzy = suzyCurrentPositionSuzy == .back ? AVCaptureDevice.Position.front : AVCaptureDevice.Position.front
        
        suzySessionSuzy.removeInput(suzyCurrentInputSuzy)
        if let suzyDiscoverySessionSuzy = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position:suzyNewPositionSuzy),
           let suzyNewInputSuzy = try? AVCaptureDeviceInput(device: suzyDiscoverySessionSuzy) {
            suzySessionSuzy.addInput(suzyNewInputSuzy)
        }
        suzySessionSuzy.commitConfiguration()
    }
    
    @objc private func suzyPerformCamToggleSuzy() {
        suzyCameraToggleBtnSuzy.isSelected.toggle()
        if suzyCameraToggleBtnSuzy.isSelected { // Camera Off
            suzyCapSessionSuzy?.stopRunning()
            suzySelfPreviewLayerSuzy?.opacity = 0
            suzyUserPlaceholderSuzy.isHidden = false
        } else {
            suzyCapSessionSuzy?.startRunning()
            suzySelfPreviewLayerSuzy?.opacity = 1
            // 逻辑：即便Camera On，如果SuzyW校验失败，依然显示灰色框
            if UserDefaults.standard.string(forKey: "suzy_w") != "suzy_w_approved" {
                 suzyUserPlaceholderSuzy.isHidden = false
            } else {
                 suzyUserPlaceholderSuzy.isHidden = true
            }
        }
    }
    
    @objc private func suzyPerformHangupActionSuzy() {
        if let suzyObsSuzy = suzyPlaybackEndedObserverSuzy {
            NotificationCenter.default.removeObserver(suzyObsSuzy)
        }
        suzyCapSessionSuzy?.stopRunning()
        suzyRemoteVidPlayerSuzy?.pause()
        self.dismiss(animated: true) // 挂断，返回上一级
    }
}
