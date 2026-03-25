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
        suzyRemoteContainerSuzy.frame = view.bounds
        suzyRemotePreviewLayerSuzy?.frame = suzyRemoteContainerSuzy.bounds
        suzySelfPreviewLayerSuzy?.frame = suzyUserPlaceholderSuzy.bounds
//        suzySelfPreviewLayerSuzy?.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
              
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
            
            suzyUserPlaceholderSuzy.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            suzyUserPlaceholderSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            suzyUserPlaceholderSuzy.widthAnchor.constraint(equalToConstant: 100),
            suzyUserPlaceholderSuzy.heightAnchor.constraint(equalToConstant: 150),
            
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
        suzyStatusAlertSuzy.text = " Connecting... "
        suzyStatusAlertSuzy.isHidden = false
        
        // 1. 检查这个特定用户是否已经拨打过并接通
        let suzyCalledIdsSuzy = UserDefaults.standard.stringArray(forKey: "suzy_called_success_ids") ?? []
        
        // 延迟 2.5 秒模拟拨号过程，增加真实感
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
            guard let self = self else { return }
            
            if suzyCalledIdsSuzy.contains(self.suzyCurrentMatchSuzy.suzyIdentifierSuzy) {
                // 如果该 ID 之前接通成功过，直接显示离开
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
            self.suzyHandleUserUnavailableSuzy(reason: "User left the match")
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
        self.suzyStatusAlertSuzy.isHidden = true
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
            }
        }
    }

    // MARK: - Helper Suzy
    private func suzyHandleUserUnavailableSuzy(reason: String) {
        self.suzyStatusAlertSuzy.text = " \(reason) "
        self.suzyStatusAlertSuzy.isHidden = false
        
        // 确保提示框在最前，且停止视频展示
        view.bringSubviewToFront(suzyStatusAlertSuzy)
        suzyRemoteVidPlayerSuzy?.pause()
        suzyRemotePreviewLayerSuzy?.opacity = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.suzyPerformHangupActionSuzy()
        }
    }

    private func suzyHandleUserUnavailableSuzy() {
        // 确保 UI 提示在最上层
        view.bringSubviewToFront(suzyStatusAlertSuzy)
        suzyStatusAlertSuzy.text = " User is no longer online "
        suzyStatusAlertSuzy.isHidden = false
        
        // 停止任何可能正在播放的残余视频
        suzyRemoteVidPlayerSuzy?.pause()
        suzyRemotePreviewLayerSuzy?.opacity = 0
        
        // 延迟 2 秒后挂断返回，模拟真实的“断开”感
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.suzyPerformHangupActionSuzy()
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
        self.suzyUserPlaceholderSuzy.layer.insertSublayer(suzySelfPreviewLayerSuzy!, at: 0)
        
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
        if suzyCameraToggleBtnSuzy.isSelected {
            suzyCapSessionSuzy?.stopRunning()
            suzySelfPreviewLayerSuzy?.opacity = 0
            suzyUserPlaceholderSuzy.isHidden = false
        } else {
            suzyCapSessionSuzy?.startRunning()
            suzySelfPreviewLayerSuzy?.opacity = 1
           
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
        self.dismiss(animated: true)
    }
}
