//
//  JuicoyCallPulseController.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/24.
//

import UIKit
import AVFoundation

enum SuzyclipboardStatusSuzy {
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

final class SuzyClipboardSessionVCSuzy: UIViewController {
    private let suzyCaptureQueueSuzy = DispatchQueue(label: "com.suzy.camera.running.queue.suzy")

    deinit {
   
        if let observer = suzyPlaybackEndedObserverSuzy {
            NotificationCenter.default.removeObserver(observer)
        }
    }
  
     var protrShow:(()->(Void))?
    private let suzyFallbackBgImageViewSuzy: UIImageView = {
        let iv = UIImageView.init(frame: UIScreen.main.bounds)
        iv.image = SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "SuzyWelcomeBgSuzyELUA")
        iv.contentMode = .scaleAspectFill
        
        return iv
    }()
   
    private let suzyCurrentAertionSuzy: UseAertionEntitySuzy
    private var clipboardStateSuzy: SuzyclipboardStatusSuzy = .suzyInitializingSuzy
    private var suzyPlaybackEndedObserverSuzy: NSObjectProtocol?

    private var suzyCapSessionSuzy: AVCaptureSession?
    private var suzySelfPreviewLayerSuzy: AVCaptureVideoPreviewLayer?
    private let suzyUserPlaceholderSuzy = UIView()
 
    private var suzyRemoteVidPlayerSuzy: AVPlayer?
    private var suzyRemotePreviewLayerSuzy: AVPlayerLayer?
    private let suzyRemoteContainerSuzy = UIView()
    
 
    private let suzyControlWrapperSuzy = UIStackView()
    private let suzyCameraSwitchBtnSuzy = UIButton(type: .custom)
    private let suzyCameraToggleBtnSuzy = UIButton(type: .custom)
    private let suzyAertionUserInfoSuzy = UIButton(type: .custom)
    private let DeserialiIndicatorBtnSuzy = UIButton(type: .custom)
    private let suzyEndclipboardActionBtnSuzy = UIButton(type: .custom)

    // MARK: - Init Suzy
    init(suzyAertiony: UseAertionEntitySuzy) {
        self.suzyCurrentAertionSuzy = suzyAertiony
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }

    // MARK: - Lifecycle Suzy
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(suzyFallbackBgImageViewSuzy)
        
        suzyBuildclipboardCanvasSuzy()
        
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
    private func suzyBuildclipboardCanvasSuzy() {
        
        suzyRemoteContainerSuzy.backgroundColor = .clear
         suzyRemoteContainerSuzy.frame = view.bounds
         
         view.addSubview(suzyRemoteContainerSuzy)
        
       
        suzyUserPlaceholderSuzy.backgroundColor = .darkGray
        view.addSubview(suzyUserPlaceholderSuzy)
    
        suzyUserPlaceholderSuzy.layer.cornerRadius = 15
        suzyUserPlaceholderSuzy.layer.masksToBounds = true
        suzyUserPlaceholderSuzy.translatesAutoresizingMaskIntoConstraints = false
        

        suzyControlWrapperSuzy.axis = .horizontal
        suzyControlWrapperSuzy.spacing = 15
        suzyControlWrapperSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyControlWrapperSuzy)
      
        suzyCameraSwitchBtnSuzy.setImage(SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "camerarotateSuzi"), for: .normal)
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
        
        
        suzyAertionUserInfoSuzy.addTarget(self, action: #selector(reportdUserInfoSuzy), for: .touchUpInside)
        suzyAertionUserInfoSuzy.setTitle(suzyCurrentAertionSuzy.suzyUsernameSuzy, for: .normal)
        suzyAertionUserInfoSuzy.titleLabel?.font = .systemFont(ofSize: 12)
        suzyAertionUserInfoSuzy.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2500)
        suzyAertionUserInfoSuzy.layer.cornerRadius = 10
        suzyAertionUserInfoSuzy.setImage(SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "exclamationmark"), for: .normal)
        suzyAertionUserInfoSuzy.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
      
            
        suzyAertionUserInfoSuzy.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)

        [suzyCameraSwitchBtnSuzy, suzyCameraToggleBtnSuzy, suzyAertionUserInfoSuzy].forEach {
            $0.tintColor = .white
            $0.translatesAutoresizingMaskIntoConstraints = false
            suzyControlWrapperSuzy.addArrangedSubview($0)
            
        }
        
        DeserialiIndicatorBtnSuzy.addTarget(self, action: #selector(suzyHandleIcebreakerTapSuzy), for: .touchUpInside)
        DeserialiIndicatorBtnSuzy.setBackgroundImage(SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "suzIndicatorBtnSuzy"), for: .normal)
        DeserialiIndicatorBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(DeserialiIndicatorBtnSuzy)
        
        suzyEndclipboardActionBtnSuzy.setImage(UIImage(systemName: "phone.down.fill"), for: .normal)
        suzyEndclipboardActionBtnSuzy.tintColor = .white
        suzyEndclipboardActionBtnSuzy.backgroundColor = .systemRed
        suzyEndclipboardActionBtnSuzy.layer.cornerRadius = 40
        suzyEndclipboardActionBtnSuzy.addTarget(self, action: #selector(suzyPerformHangupActionSuzy), for: .touchUpInside)
        suzyEndclipboardActionBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyEndclipboardActionBtnSuzy)
 
        NSLayoutConstraint.activate([
            suzyCameraSwitchBtnSuzy.widthAnchor.constraint(equalToConstant: 40),
            suzyCameraToggleBtnSuzy.widthAnchor.constraint(equalToConstant: 114),
            suzyAertionUserInfoSuzy.widthAnchor.constraint(equalToConstant: 140),
            
            suzyControlWrapperSuzy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            suzyControlWrapperSuzy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            suzyUserPlaceholderSuzy.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            suzyUserPlaceholderSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            suzyUserPlaceholderSuzy.widthAnchor.constraint(equalToConstant: 130),
            suzyUserPlaceholderSuzy.heightAnchor.constraint(equalToConstant: 170),
            
            DeserialiIndicatorBtnSuzy.bottomAnchor.constraint(equalTo: suzyEndclipboardActionBtnSuzy.topAnchor, constant: -30),
            DeserialiIndicatorBtnSuzy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            DeserialiIndicatorBtnSuzy.heightAnchor.constraint(equalToConstant: 45),
            DeserialiIndicatorBtnSuzy.widthAnchor.constraint(equalToConstant: 319),
            
            
            suzyEndclipboardActionBtnSuzy.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            suzyEndclipboardActionBtnSuzy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            suzyEndclipboardActionBtnSuzy.widthAnchor.constraint(equalToConstant: 80),
            suzyEndclipboardActionBtnSuzy.heightAnchor.constraint(equalToConstant: 80),

        ])
        
    }
}

extension SuzyClipboardSessionVCSuzy {
    
   @objc func reportdUserInfoSuzy()  {
       let actionreport = SuzyActioningSheetVCSuzy()
       actionreport.pathUID = suzyCurrentAertionSuzy.suzyIdentifierSuzy
       actionreport.modalPresentationStyle = .fullScreen
       self.present(actionreport, animated: true)
       
    }
    
    // MARK: - Hardware Perms Suzy
    private func suzyRequestHardwarePermsSuzy() {
        DispatchQueue.main.async {
            SuzyHudManagerSuzy.shared.suzyShowStatusLoadingSuzy(message: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "1geGCI4B5jXsID2CuCfjSw/OCAeGNMnFpVvGVlZDwksvqJjNdf4QCL1iJatVLPY="),ifhaveLoading: false)
        }
        
        AVCaptureDevice.requestAccess(for: .video) { suzyVidSuzy in
            
            DispatchQueue.main.async {
            
                if suzyVidSuzy{
                    self.suzySetupSelfCamSessionSuzy()
                   
                } else {
                    SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "nFlm4YA0lRWklxlGB947+wHbu4yOs4wScOhBDTVZ4hDCKDuSqKX5nG1JFh8tjFF7QGIUOQLzdIAge9ZV37ZeqA=="),isSuccess: false)
                  
                }
                
                
                self.suzyInitiateclipboardStateMachineSuzy()
            }
            
            
        }
        
        AVCaptureDevice.requestAccess(for: .audio) { suzyAudSuzy in
            if suzyAudSuzy == false{
                SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "oikllC9bKC/KeG2Ggk2ahh5BB1xCTO/v0UOVkrLOnW7L4D+3y0er8BZLVoj/8z1gu287xuy1qdlOb+nScdbjnU4Tuw=="),isSuccess: false)
            }
            
        }
    }
    
    
    private func suzyInitiateclipboardStateMachineSuzy() {
        self.clipboardStateSuzy = .suzyConnectingSuzy
        
       
        let suzyclipboardIdsSuzy = UserDefaults.standard.stringArray(forKey: "suzy_called_success_ids") ?? []
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
            guard let self = self else { return }
            SuzyHudManagerSuzy.shared.suzyHideLoadingSuzy()
            if suzyclipboardIdsSuzy.contains(self.suzyCurrentAertionSuzy.suzyIdentifierSuzy) {
                
                SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "8uQY094c3G8l2hX3J2izCOGXEQj/rd0sJYXaglKHg2hGD2hEhkDyBubVK9XLBC+3"), isSuccess: false)
                self.suzyHandleUserUnavailableSuzy(reason: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "KQQQ19Kfz6rwVOUHNSYL2L6DyRfCVXSr5eg/ACXUCFypZZ2W3jKPmOVqRiV/VET+"))
            } else {
                
                self.suzyConfigureRemoteFakeFeedSuzy()
            }
        }
    }

    private func suzyConfigureRemoteFakeFeedSuzy() {
    
        var suzyPlayedVidsSuzy = UserDefaults.standard.stringArray(forKey: "suzy_played_vids") ?? []
        let suzyBasePoolSuzy = (self.suzyCurrentAertionSuzy.suzyGenderSuzy == 0) ?
            SuzyLocalAssetsSuzy.suzyMaleVidsSuzy :
            SuzyLocalAssetsSuzy.suzyFemaleVidsSuzy
        
        let suzyAvailableVidsSuzy = suzyBasePoolSuzy.filter { !suzyPlayedVidsSuzy.contains($0) }
        
        guard let suzyTargetVidSuzy = suzyAvailableVidsSuzy.first else {
           
            SuzyHudManagerSuzy.shared.suzyHideLoadingSuzy()
            self.suzyHandleUserUnavailableSuzy(reason:SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "iBAyq2ntNRDq3HQxZPde24DprO11TtEndxPHn8NuhC8ka57g8CcNJKR9q4WFCToVpB+F") )
            SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "aIddlLzcfiw7FkxxINQCUJKnAl8Fed1WpQyK/41RO73QX7aQvYaXi4I9/tlRR1mon/6F"), isSuccess: false)
            return
        }
      
        var suzyCalledIdsSuzy = UserDefaults.standard.stringArray(forKey: "suzy_called_success_ids") ?? []
        suzyCalledIdsSuzy.append(self.suzyCurrentAertionSuzy.suzyIdentifierSuzy)
        UserDefaults.standard.set(suzyCalledIdsSuzy, forKey: "suzy_called_success_ids")
        
        suzyPlayedVidsSuzy.append(suzyTargetVidSuzy)
        UserDefaults.standard.set(suzyPlayedVidsSuzy, forKey: "suzy_played_vids")
        

        guard let suzyPathSuzy = Bundle.main.path(forResource: suzyTargetVidSuzy, ofType: "mp4") else { return }
        let suzyVidURLSuzy = URL(fileURLWithPath: suzyPathSuzy)
        
        suzyRemoteVidPlayerSuzy = AVPlayer(url: suzyVidURLSuzy)
        suzyRemotePreviewLayerSuzy?.removeFromSuperlayer()
        suzyRemotePreviewLayerSuzy = AVPlayerLayer(player: suzyRemoteVidPlayerSuzy)
        suzyRemotePreviewLayerSuzy?.videoGravity = .resizeAspectFill
        suzyRemotePreviewLayerSuzy?.frame = suzyRemoteContainerSuzy.bounds
        suzyRemoteContainerSuzy.layer.addSublayer(suzyRemotePreviewLayerSuzy!)
        suzyRemoteVidPlayerSuzy?.play()
        
        suzyPlaybackEndedObserverSuzy = NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: suzyRemoteVidPlayerSuzy?.currentItem, queue: nil) { [weak self] _ in
            DispatchQueue.main.async {
                self?.suzyHandleUserUnavailableSuzy(reason: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "IWgZskdezZOnvPkNc+8YqQg6wMLEgFoFKPhhmoK/BH5vpAkIzGYRuNaHJpTBiEkDMw=="))
                SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "IWgZskdezZOnvPkNc+8YqQg6wMLEgFoFKPhhmoK/BH5vpAkIzGYRuNaHJpTBiEkDMw=="), isSuccess: false)
            }
        }
    }

    // MARK: - Helper Suzy
    private func suzyHandleUserUnavailableSuzy(reason: String) {

        SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: reason, isSuccess: false)
      
        suzyRemoteVidPlayerSuzy?.pause()
        suzyRemotePreviewLayerSuzy?.opacity = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) { [weak self] in
            SuzyHudManagerSuzy.shared.suzyHideLoadingSuzy()
            self?.suzyPerformHangupActionSuzy()
        }
    }

    private func suzyHandleUserUnavailableSuzy() {

        SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "xsJt/e46NTPhYZYBR8A/tgHpDc/5xGyS25ufvmXHdIzjCzW1mbbkt5eMypOPAg+jsSTCUshiPoWvVA=="), isSuccess: false)
     
        suzyRemoteVidPlayerSuzy?.pause()
        suzyRemotePreviewLayerSuzy?.opacity = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) { [weak self] in
           
            SuzyHudManagerSuzy.shared.suzyHideLoadingSuzy()
            self?.suzyPerformHangupActionSuzy()
        }
    }
}


extension SuzyClipboardSessionVCSuzy {
   
    func suzyToggleCameraSessionSuzy() {
       
        guard !(self.suzyCapSessionSuzy?.isRunning ?? false) else { return }
       
        suzyCaptureQueueSuzy.async { [weak self] in
            guard let self = self else { return }
            
           
            self.suzyCapSessionSuzy?.startRunning()
       
        }
    }
    private func suzySetupSelfCamSessionSuzy() {
        let session = AVCaptureSession()
            self.suzyCapSessionSuzy = session
            session.sessionPreset = .high
        
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
                  let input = try? AVCaptureDeviceInput(device: device) else { return }

            if session.canAddInput(input) {
                session.addInput(input)
            }

            let previewLayer = AVCaptureVideoPreviewLayer(session: session)
            previewLayer.videoGravity = .resizeAspectFill
            self.suzySelfPreviewLayerSuzy = previewLayer
        
            DispatchQueue.main.async {
                self.suzyUserPlaceholderSuzy.layer.addSublayer(previewLayer)
                previewLayer.frame = self.suzyUserPlaceholderSuzy.bounds
            }

           
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



extension SuzyClipboardSessionVCSuzy {
  
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

   
    @objc private func suzyHandleIcebreakerTapSuzy() {
        let DeserialSuzy = SuzySecureVaultSuzy.sharedSuzy.suzyFetchCurrentProfileSuzy()?.deseriali ?? 0
       
        suzyShowCustomAlertSuzy(isEnough: DeserialSuzy >= 20)
    }
    
    private func suzyShowCustomAlertSuzy(isEnough: Bool) {
        let suzyOverlaySuzy = UIView(frame: view.bounds)
        suzyOverlaySuzy.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        suzyOverlaySuzy.tag = 999
        
        let suzyAlertViewSuzy = UIImageView(image:  SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "suzyCardContainerSuzy"))
        suzyAlertViewSuzy.isUserInteractionEnabled = true
        suzyAlertViewSuzy.contentMode = .scaleToFill
        suzyAlertViewSuzy.translatesAutoresizingMaskIntoConstraints = false
     
        suzyOverlaySuzy.addSubview(suzyAlertViewSuzy)
        
        let suzyMessageIconSuzy = UIImageView()
        suzyMessageIconSuzy.image = SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "bubbleacall")
        suzyMessageIconSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyOverlaySuzy.addSubview(suzyMessageIconSuzy)
        
    
     
        
        
        view.addSubview(suzyOverlaySuzy)
        
        // 核心文案逻辑
        let titleLabel = UILabel()
        titleLabel.text = SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "7+jPfRO8OtBYw38KPoZpil5dMh6XbnSNoravfq7n+Ix8RGqhUKQzng==")
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        suzyAlertViewSuzy.addSubview(titleLabel)
        let msgLabel = UILabel()
        msgLabel.textColor = .lightGray
        msgLabel.numberOfLines = 0
        msgLabel.textAlignment = .center
        msgLabel.text = isEnough ? SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "cxRh5D0NJIODXirRIe99+JOs3hjDyF2+KoMW1J8Aoy/LyjxuP3ssSjFAI6DD3h47xqwFG3sCpG8VU4NdYR+En8Po5dubslo5vTJmGUOuKOVSvD5jaCgL9OZPMHifajGNYsYaiQUp8joLy+LKozg=") : SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "VnE4V9/H6565rkLoVnpXr8x75kLRGG2UhBx/lqPnF8h3HidGP4X5jRdN9Zzx73+xXtMGV9FR1Dx68FjDXLnN8fPyZwr2qirOP+/BLBI1E+vF")
        msgLabel.translatesAutoresizingMaskIntoConstraints = false
        suzyAlertViewSuzy.addSubview(msgLabel)
        
        let actionBtn = UIButton(type: .custom)
        actionBtn.layer.cornerRadius = 25
        actionBtn.backgroundColor = .systemPurple
        actionBtn.setTitle(isEnough ? SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "Hbet0hzasFe1LrrVsJultU5NQO/yuQtc27v50uyYSLOmbRF3nFToZw==") : SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "4dqYiGl6sUDzoXUNz84EWtkC1u++xSt9o+0jYNPMTZLpUKVWu0uYIg=="), for: .normal)
        actionBtn.translatesAutoresizingMaskIntoConstraints = false
        suzyAlertViewSuzy.addSubview(actionBtn)
        
        let suzyDismissBtnSuzy = UIButton(type: .custom)
       
        suzyDismissBtnSuzy.setTitle(SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "unii58CwJS8DzkaqLebGEiBXyHnOYT7660euwF+fasgEAIrxya8="), for: .normal)
        suzyDismissBtnSuzy.setTitleColor(.white, for: .normal)
        suzyDismissBtnSuzy.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        suzyDismissBtnSuzy.addTarget(self, action: #selector(suzyHideQuickViewSuzy), for: .touchUpInside)
        suzyDismissBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyAlertViewSuzy.addSubview(suzyDismissBtnSuzy)
        
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
       
      
       
        SuzySecureVaultSuzy.sharedSuzy.suzyUpdateMutableAttributesSuzy(DeserialSuzy: -20)
        
      
        
        let suzySelectedQuestionsSuzy = SuzyClipboardSessionVCSuzy.suzyPoolSuzy.shuffled().prefix(4)
        
        let suzyDisplayMsgSuzy = suzySelectedQuestionsSuzy.joined(separator: "\n\n")
        
        let finalAlert = UIAlertController(title: "Icebreakers For You", message: suzyDisplayMsgSuzy, preferredStyle: .alert)
        finalAlert.addAction(UIAlertAction(title: "Cool!", style: .cancel))
        self.present(finalAlert, animated: true)
    }
}
