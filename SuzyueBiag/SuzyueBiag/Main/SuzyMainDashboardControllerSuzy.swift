//
//  SuzyAOpticControoerSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/20.
//

import UIKit
import AVFoundation

final class SuzyMainDashboardControllerSuzy: UIViewController {
    
   
    private let suzyCameraPreviewLayerSuzy = AVCaptureVideoPreviewLayer()
    private let suzyCaptureSessionSuzy = AVCaptureSession()
    
  
    private let suzyFallbackBgImageViewSuzy: UIImageView = {
        let iv = UIImageView()
        iv.image = SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "SuzyWelcomeBgSuzyELUA")
        iv.contentMode = .scaleAspectFill
        iv.isHidden = true
        return iv
    }()
    
    private let suzyFFullCoverImageViewSuzy: UIImageView = {
        let iv = UIImageView()
        iv.image = SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "SuzyDefaultDashboardBgSuzy@")
        iv.contentMode = .scaleAspectFill
       
        return iv
    }()
    
    private let suzyStartMeetButtonSuzy = UIButton(type: .custom)
   
    private let suzyAllFilterBtnSuzy = UIButton()
    private let suzyInterestFilterBtnSuzy = UIButton()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if UserDefaults.standard.bool(forKey: "showeingsafety") == false ||  UserDefaults.standard.bool(forKey: "showeingsafety") == nil{
            showeingsafety()
            UserDefaults.standard.set(true, forKey: "showeingsafety")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        suzyAllFilterBtnSuzy.setImage(SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "suzyAllFilterBtnSuzy"), for: .normal)
        suzyAllFilterBtnSuzy.setImage(SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "suzyAllFilterBtnSuzysel@"), for: .selected)
        
        suzyInterestFilterBtnSuzy.setImage(SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "suzyInterestFilterBtnSuzy"), for: .normal)
        suzyInterestFilterBtnSuzy.setImage(SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "suzyInterestFilterBtnSuzysel"), for: .selected)
        
        suzyAllFilterBtnSuzy.isSelected = true
        
        suzySetupBaseUISuzy()
        suzyCheckCameraPermissionSuzy()
    }
    @objc func memoryLeakSuue() {
        self.navigationController?.pushViewController(LandmarkSUZYTrackSuue(), animated: true)
     }
    private func suzySetupBaseUISuzy() {
        view.backgroundColor = .black
       
        suzyFallbackBgImageViewSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyFallbackBgImageViewSuzy)
        view.addSubview(suzyFFullCoverImageViewSuzy)
    
        let suzyTopGradientSuzy = UIView()
        suzyTopGradientSuzy.backgroundColor = .clear
        suzyTopGradientSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyTopGradientSuzy)
        
        let suzySettingBtnSuzy = UIButton(type: .custom)
        suzySettingBtnSuzy.setImage(SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "suzy_ic_settings"), for: .normal)
        suzySettingBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzySettingBtnSuzy)
        suzySettingBtnSuzy.addTarget(self, action: #selector(memoryLeakSuue), for: .touchUpInside)
        
        let suzyHintLabelSuzy = UILabel()
        suzyHintLabelSuzy.text = "I want to chat with this 😋"
        suzyHintLabelSuzy.textColor = .white
        suzyHintLabelSuzy.font = .systemFont(ofSize: 18, weight: .medium)
        suzyHintLabelSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyHintLabelSuzy)

        suzyAllFilterBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyInterestFilterBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyAllFilterBtnSuzy)
        view.addSubview(suzyInterestFilterBtnSuzy)
        
        suzyStartMeetButtonSuzy.backgroundColor = .white
        suzyStartMeetButtonSuzy.setTitle(SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "CkOcapmabz/X0d0U06RhtnKiDngkT8TFH4TD5VXATyhfA5LfOCfNJw14"), for: .normal)
        suzyStartMeetButtonSuzy.setTitleColor(.black, for: .normal)
        suzyStartMeetButtonSuzy.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        suzyStartMeetButtonSuzy.layer.cornerRadius = 28
        suzyStartMeetButtonSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyStartMeetButtonSuzy)
        
        // MARK: - Auto Layout
        NSLayoutConstraint.activate([
         
            suzyFallbackBgImageViewSuzy.topAnchor.constraint(equalTo: view.topAnchor),
            suzyFallbackBgImageViewSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            suzyFallbackBgImageViewSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            suzyFallbackBgImageViewSuzy.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            suzySettingBtnSuzy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            suzySettingBtnSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            suzySettingBtnSuzy.widthAnchor.constraint(equalToConstant: 40),
            suzySettingBtnSuzy.heightAnchor.constraint(equalToConstant: 40),
            
            suzyStartMeetButtonSuzy.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            suzyStartMeetButtonSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            suzyStartMeetButtonSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            suzyStartMeetButtonSuzy.heightAnchor.constraint(equalToConstant: 56),
            


            suzyAllFilterBtnSuzy.heightAnchor.constraint(equalToConstant: 66),
            suzyAllFilterBtnSuzy.widthAnchor.constraint(equalToConstant: 109),
            suzyAllFilterBtnSuzy.leadingAnchor.constraint(equalTo: suzyStartMeetButtonSuzy.leadingAnchor),
            suzyAllFilterBtnSuzy.bottomAnchor.constraint(equalTo: suzyStartMeetButtonSuzy.topAnchor,constant: -20),
            
            suzyInterestFilterBtnSuzy.heightAnchor.constraint(equalToConstant: 66),
            suzyInterestFilterBtnSuzy.leadingAnchor.constraint(equalTo: suzyAllFilterBtnSuzy.trailingAnchor, constant: 15),
            suzyInterestFilterBtnSuzy.trailingAnchor.constraint(equalTo: suzyStartMeetButtonSuzy.trailingAnchor),
            suzyInterestFilterBtnSuzy.centerYAnchor.constraint(equalTo: suzyAllFilterBtnSuzy.centerYAnchor),
            
          
            suzyHintLabelSuzy.bottomAnchor.constraint(equalTo: suzyAllFilterBtnSuzy.topAnchor, constant: -20),
            suzyHintLabelSuzy.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        suzyAllFilterBtnSuzy.addTarget(self, action: #selector(suzyHandleFilterTapSuzy(_:)), for: .touchUpInside)
        suzyInterestFilterBtnSuzy.addTarget(self, action: #selector(suzyHandleFilterTapSuzy(_:)), for: .touchUpInside)
        suzyStartMeetButtonSuzy.addTarget(self, action: #selector(suzyOnStartMeetClickedSuzy), for: .touchUpInside)
    }
    
    
    private func suzyCheckCameraPermissionSuzy() {
        SuzyPermissionManagerSuzy.shared.suzyRequestCameraAccessSuzy { ifauto in
            if ifauto{
                self.suzyInitializeCameraSuzy()
            }else{
                self.suzyShowPermissionDeniedStateSuzy()
            }
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        suzyToggleCameraSessionSuzy()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        suzyCaptureSessionSuzy.stopRunning()
    }
    private func suzyInitializeCameraSuzy() {
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
              let input = try? AVCaptureDeviceInput(device: device) else { return }
        
        if suzyCaptureSessionSuzy.canAddInput(input) {
            suzyCaptureSessionSuzy.addInput(input)
            suzyCameraPreviewLayerSuzy.session = suzyCaptureSessionSuzy
            suzyCameraPreviewLayerSuzy.videoGravity = .resizeAspectFill
            suzyCameraPreviewLayerSuzy.frame = view.bounds
            view.layer.insertSublayer(suzyCameraPreviewLayerSuzy, at: 0)
            suzyToggleCameraSessionSuzy()
        }
    }

    private func suzyShowPermissionDeniedStateSuzy() {
        suzyFallbackBgImageViewSuzy.isHidden = false
        SuzyPermissionManagerSuzy.shared.suzyShowCameraDeniedAlertSuzy(on: self)
        
    }
    private let suzyCaptureQueueSuzy = DispatchQueue(label: "com.suzy.camera.running.queue.suzy")

    func suzyToggleCameraSessionSuzy() {
      
        guard !self.suzyCaptureSessionSuzy.isRunning else { return }
        
        suzyCaptureQueueSuzy.async { [weak self] in
            guard let self = self else { return }
       
            self.suzyCaptureSessionSuzy.startRunning()
            
       
        }
    }
    @objc private func suzyHandleFilterTapSuzy(_ sender: UIButton) {
       
        suzyAllFilterBtnSuzy.isSelected = (sender == suzyAllFilterBtnSuzy)
        suzyInterestFilterBtnSuzy.isSelected = (sender == suzyInterestFilterBtnSuzy)
        
        if sender == suzyInterestFilterBtnSuzy {
            suzyPresentInterestPopupSuzy()
        }
    }

    private func suzyPresentInterestPopupSuzy() {
     
        let suzyPopup = SuzyInterestPickerPopupSuzy(fromrEdit: false)
        suzyPopup.modalPresentationStyle = .overCurrentContext
        suzyPopup.modalTransitionStyle = .crossDissolve
        self.present(suzyPopup, animated: true)
    }
   
 
    @objc func suzyOnStartMeetClickedSuzy()  {

        if suzyAllFilterBtnSuzy.isSelected {
            self.navigationController?.pushViewController(SuzyAlgorithmyControllerSuzy.init(suzyCurrentMatchTypeSuzy: .suzyAllSuzy), animated: true)
            return
        }
        
        let freeCount = SuzyMatchManagerSuzy.shared.suzyGetRemainingFreeMatchesSuzy()
        if freeCount > 0 {
            
            suzyShowCustomAlertSuzy(isEnough: true,isFreenAlert: true )
            
        } else {
       
            let currentCoins = SuzySecureVaultSuzy.sharedSuzy.suzyFetchCurrentProfileSuzy()?.suzyCoinsSuzy ?? 0
            suzyShowCustomAlertSuzy(isEnough: currentCoins >= 20,isFreenAlert: false )
            
        }
        
        
        
        
       
    }
    
    
    @objc private func suzyHandleIcebreakerTapSuzy() {
        let suzyCurrentCoinsSuzy = SuzySecureVaultSuzy.sharedSuzy.suzyFetchCurrentProfileSuzy()?.suzyCoinsSuzy ?? 0
       
        suzyShowCustomAlertSuzy(isEnough: suzyCurrentCoinsSuzy >= 20)
    }
    
    private func suzyShowCustomAlertSuzy(isEnough: Bool,isFreenAlert:Bool = true) {
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
        titleLabel.text = SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "/zyRJSXbunLOI0hiCsxwjJDPE+N7SA6tgWy0y1+J/XofuZTPcc58cw==")
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        suzyAlertViewSuzy.addSubview(titleLabel)
        let msgLabel = UILabel()
        msgLabel.textColor = .lightGray
        msgLabel.numberOfLines = 0
        msgLabel.textAlignment = .center
        let tip = SuzyMatchManagerSuzy.shared.suzyGetCurrentMatchTipSuzy()
        msgLabel.text = isEnough ? tip : SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "3KkDqvNC1CtWSL5B20QmWCw9PQaa22noj4niAStzbYF+GLQhtWgJ+qWufKOjcnFTew5Or1e9v0nPS5/wMzYH9QTqbbT0WqElOGoXY2zZEDKw")
        
        if isFreenAlert {
            msgLabel.text = tip
        }
        
        msgLabel.translatesAutoresizingMaskIntoConstraints = false
        suzyAlertViewSuzy.addSubview(msgLabel)
        
        let actionBtn = UIButton(type: .custom)
        actionBtn.layer.cornerRadius = 25
        actionBtn.backgroundColor = .systemPurple
        actionBtn.setTitle(isEnough ? SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "pVXrbWWSEW6M7H4Hes2Fx+GdvtEqiEdvowkeP8CjhMCNfIE/bRXvfQ==") : SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "hbHpQr7e6hsGR1qyWXRaG8/EOqJPH4q7HMLNO7xGvwpa5P6pZwkvWg=="), for: .normal)
        actionBtn.translatesAutoresizingMaskIntoConstraints = false
        suzyAlertViewSuzy.addSubview(actionBtn)
        
        let suzyDismissBtnSuzy = UIButton(type: .custom)
       
        
        suzyDismissBtnSuzy.setTitle(SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "aTNaKlig2P8jhFebt85K5EMQSIvE4ZDbreor+tZOVkddTnPEPI0="), for: .normal)
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
            if isEnough && isFreenAlert{
                SuzyMatchManagerSuzy.shared.suzyIncrementMatchCountSuzy()
                self.navigationController?.pushViewController(SuzyAlgorithmyControllerSuzy.init(suzyCurrentMatchTypeSuzy: .suzyFilteredSuzy), animated: true)
            } else  if isEnough && isFreenAlert == false{
                SuzySecureVaultSuzy.sharedSuzy.suzyUpdateMutableAttributesSuzy(deltaCoinsSuzy: -20)
                self.navigationController?.pushViewController(SuzyAlgorithmyControllerSuzy.init(suzyCurrentMatchTypeSuzy: .suzyFilteredSuzy), animated: true)
            }else{
                let vc = SuzyGoldShopVCSuzy()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
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
    
    private func showeingsafety() {
        let eulaVcSuzy = SuzyLegalReaderControllerSuzy(suzyTypeSuzy: .suzyLegal)
        
        eulaVcSuzy.modalPresentationStyle = .pageSheet
        
        if let suzySheetSuzy = eulaVcSuzy.sheetPresentationController {
          
            suzySheetSuzy.detents = [.medium(), .large()]
            
            suzySheetSuzy.prefersGrabberVisible = true
            
            suzySheetSuzy.preferredCornerRadius = 24
        
            suzySheetSuzy.prefersScrollingExpandsWhenScrolledToEdge = false
        }
        
        self.present(eulaVcSuzy, animated: true)
    }
}

