//
//  SuzyAOpticControoerSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/20.
//

import UIKit
import AVFoundation

final class SuzyMainDashboardControllerSuzy: UIViewController {
    
    // MARK: - UI Components
    private let suzyCameraPreviewLayerSuzy = AVCaptureVideoPreviewLayer()
    private let suzyCaptureSessionSuzy = AVCaptureSession()
    
  
    private let suzyFallbackBgImageViewSuzy: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "SuzyWelcomeBgSuzyELUA@")
        iv.contentMode = .scaleAspectFill
        iv.isHidden = true
        return iv
    }()
    
    private let suzyFFullCoverImageViewSuzy: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "SuzyDefaultDashboardBgSuzy@")
        iv.contentMode = .scaleAspectFill
       
        return iv
    }()
    
    private let suzyStartMeetButtonSuzy = UIButton(type: .custom)
    
    // 筛选按钮
    private let suzyAllFilterBtnSuzy = UIButton()
    private let suzyInterestFilterBtnSuzy = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        suzyAllFilterBtnSuzy.setImage(UIImage.init(named: "suzyAllFilterBtnSuzy"), for: .normal)
        suzyAllFilterBtnSuzy.setImage(UIImage.init(named: "suzyAllFilterBtnSuzysel@"), for: .selected)
        
        suzyInterestFilterBtnSuzy.setImage(UIImage.init(named: "suzyInterestFilterBtnSuzy"), for: .normal)
        suzyInterestFilterBtnSuzy.setImage(UIImage.init(named: "suzyInterestFilterBtnSuzysel"), for: .selected)
        
        suzyAllFilterBtnSuzy.isSelected = true
        
        suzySetupBaseUISuzy()
        suzyCheckCameraPermissionSuzy()
    }
    @objc func memoryLeakSuue() {
        self.navigationController?.pushViewController(LandmarkSUZYTrackSuue(), animated: true)
     }
    private func suzySetupBaseUISuzy() {
        view.backgroundColor = .black
        
        // 1. 静态背景图 (当无权限时显示)
        suzyFallbackBgImageViewSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyFallbackBgImageViewSuzy)
        view.addSubview(suzyFFullCoverImageViewSuzy)
        
        // 2. 顶部装饰 (StatusBar 遮罩或渐变，增加视觉深度)
        let suzyTopGradientSuzy = UIView()
        suzyTopGradientSuzy.backgroundColor = .clear
        suzyTopGradientSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyTopGradientSuzy)
        
        // 3. 设置按钮 (右上角齿轮)
        let suzySettingBtnSuzy = UIButton(type: .custom)
        suzySettingBtnSuzy.setImage(UIImage(named: "suzy_ic_settings"), for: .normal)
        suzySettingBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzySettingBtnSuzy)
        suzySettingBtnSuzy.addTarget(self, action: #selector(memoryLeakSuue), for: .touchUpInside)
        // 4. 中间提示文字
        let suzyHintLabelSuzy = UILabel()
        suzyHintLabelSuzy.text = "I want to chat with this 😋"
        suzyHintLabelSuzy.textColor = .white
        suzyHintLabelSuzy.font = .systemFont(ofSize: 18, weight: .medium)
        suzyHintLabelSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyHintLabelSuzy)
        
        // 5. 底部筛选区域容器 (带渐变或阴影)
//        suzyBottomContainerSuzy.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(suzyBottomContainerSuzy)
        
        suzyAllFilterBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyInterestFilterBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyAllFilterBtnSuzy)
        view.addSubview(suzyInterestFilterBtnSuzy)
        
        // 6. Start Meet 按钮
        suzyStartMeetButtonSuzy.backgroundColor = .white
        suzyStartMeetButtonSuzy.setTitle("Start Meet", for: .normal)
        suzyStartMeetButtonSuzy.setTitleColor(.black, for: .normal)
        suzyStartMeetButtonSuzy.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        suzyStartMeetButtonSuzy.layer.cornerRadius = 28
        suzyStartMeetButtonSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyStartMeetButtonSuzy)
        
        // MARK: - Auto Layout
        NSLayoutConstraint.activate([
            // 背景
            suzyFallbackBgImageViewSuzy.topAnchor.constraint(equalTo: view.topAnchor),
            suzyFallbackBgImageViewSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            suzyFallbackBgImageViewSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            suzyFallbackBgImageViewSuzy.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // 设置按钮
            suzySettingBtnSuzy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            suzySettingBtnSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            suzySettingBtnSuzy.widthAnchor.constraint(equalToConstant: 40),
            suzySettingBtnSuzy.heightAnchor.constraint(equalToConstant: 40),
            
            // Start Meet 按钮 (底部固定)
            suzyStartMeetButtonSuzy.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            suzyStartMeetButtonSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            suzyStartMeetButtonSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            suzyStartMeetButtonSuzy.heightAnchor.constraint(equalToConstant: 56),
            
//            // 筛选按钮容器
//            suzyBottomContainerSuzy.bottomAnchor.constraint(equalTo: suzyStartMeetButtonSuzy.topAnchor, constant: -30),
//            suzyBottomContainerSuzy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            suzyBottomContainerSuzy.heightAnchor.constraint(equalToConstant: 60),
//
            suzyAllFilterBtnSuzy.heightAnchor.constraint(equalToConstant: 66),
            suzyAllFilterBtnSuzy.widthAnchor.constraint(equalToConstant: 109),
            suzyAllFilterBtnSuzy.leadingAnchor.constraint(equalTo: suzyStartMeetButtonSuzy.leadingAnchor),
            suzyAllFilterBtnSuzy.bottomAnchor.constraint(equalTo: suzyStartMeetButtonSuzy.topAnchor,constant: -20),
            
            suzyInterestFilterBtnSuzy.heightAnchor.constraint(equalToConstant: 66),
            suzyInterestFilterBtnSuzy.leadingAnchor.constraint(equalTo: suzyAllFilterBtnSuzy.trailingAnchor, constant: 15),
            suzyInterestFilterBtnSuzy.trailingAnchor.constraint(equalTo: suzyStartMeetButtonSuzy.trailingAnchor),
            suzyInterestFilterBtnSuzy.centerYAnchor.constraint(equalTo: suzyAllFilterBtnSuzy.centerYAnchor),
            
            // 提示文字
            suzyHintLabelSuzy.bottomAnchor.constraint(equalTo: suzyAllFilterBtnSuzy.topAnchor, constant: -20),
            suzyHintLabelSuzy.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // 初始状态绑定
        suzyAllFilterBtnSuzy.addTarget(self, action: #selector(suzyHandleFilterTapSuzy(_:)), for: .touchUpInside)
        suzyInterestFilterBtnSuzy.addTarget(self, action: #selector(suzyHandleFilterTapSuzy(_:)), for: .touchUpInside)
        suzyStartMeetButtonSuzy.addTarget(self, action: #selector(suzyOnStartMeetClickedSuzy), for: .touchUpInside)
    }
    
    
    private func suzyCheckCameraPermissionSuzy() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            suzyInitializeCameraSuzy()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                DispatchQueue.main.async {
                    if granted { self?.suzyInitializeCameraSuzy() }
                    else { self?.suzyShowPermissionDeniedStateSuzy() }
                }
            }
        default:
            suzyShowPermissionDeniedStateSuzy()
        }
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
            suzyCaptureSessionSuzy.startRunning()
        }
    }

    private func suzyShowPermissionDeniedStateSuzy() {
        suzyFallbackBgImageViewSuzy.isHidden = false
        // 提示逻辑：点击任何功能按钮时弹出跳转设置的 Alert
    }
    
    @objc private func suzyHandleFilterTapSuzy(_ sender: UIButton) {
        // 权限检查
        guard AVCaptureDevice.authorizationStatus(for: .video) == .authorized else {
            suzyShowPermissionAlertSuzy()
            return
        }

        // 互斥选中逻辑
        suzyAllFilterBtnSuzy.isSelected = (sender == suzyAllFilterBtnSuzy)
        suzyInterestFilterBtnSuzy.isSelected = (sender == suzyInterestFilterBtnSuzy)
        
        if sender == suzyInterestFilterBtnSuzy {
            suzyPresentInterestPopupSuzy()
        }
    }

    private func suzyPresentInterestPopupSuzy() {
        // 弹出设计图中的半屏弹窗
        // 这里的 CollectionView 逻辑直接复用你注册流程中的 `SuzyTagCellSuzy`
        let suzyPopup = SuzyInterestPickerPopupSuzy(fromrEdit: false)
        suzyPopup.modalPresentationStyle = .overCurrentContext
        suzyPopup.modalTransitionStyle = .crossDissolve
        self.present(suzyPopup, animated: true)
    }
    private func suzyShowPermissionAlertSuzy() {
        let suzyAlertSuzy = UIAlertController(
            title: "Camera Access Required",
            message: "To start a meet and verify your identity, please enable camera access in your device settings.",
            preferredStyle: .alert
        )
        
        // “去设置” 动作：直接跳转到当前 App 的系统设置页面
        let suzySettingsActionSuzy = UIAlertAction(title: "Go to Settings", style: .default) { _ in
            guard let suzySettingsUrlSuzy = URL(string: UIApplication.openSettingsURLString) else { return }
            if UIApplication.shared.canOpenURL(suzySettingsUrlSuzy) {
                UIApplication.shared.open(suzySettingsUrlSuzy, options: [:], completionHandler: nil)
            }
        }
        
        // “取消” 动作
        let suzyCancelActionSuzy = UIAlertAction(title: "Maybe Later", style: .cancel, handler: nil)
        
        suzyAlertSuzy.addAction(suzySettingsActionSuzy)
        suzyAlertSuzy.addAction(suzyCancelActionSuzy)
       
        if let suzyPopoverSuzy = suzyAlertSuzy.popoverPresentationController {
            suzyPopoverSuzy.sourceView = self.view
            suzyPopoverSuzy.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            suzyPopoverSuzy.permittedArrowDirections = []
        }
        
        self.present(suzyAlertSuzy, animated: true, completion: nil)
    }
    @objc func suzyOnStartMeetClickedSuzy()  {
        if suzyAllFilterBtnSuzy.isSelected {
            self.navigationController?.pushViewController(SuzyAlgorithmyControllerSuzy.init(suzyCurrentMatchTypeSuzy: .suzyAllSuzy), animated: true)
            return
        }
        self.navigationController?.pushViewController(SuzyAlgorithmyControllerSuzy.init(suzyCurrentMatchTypeSuzy: .suzyFilteredSuzy), animated: true)
    }
}
