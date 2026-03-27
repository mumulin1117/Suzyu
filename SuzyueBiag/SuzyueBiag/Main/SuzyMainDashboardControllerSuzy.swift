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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if UserDefaults.standard.bool(forKey: "showeingsafety") == false ||  UserDefaults.standard.bool(forKey: "showeingsafety") == nil{
            showeingsafety()
            UserDefaults.standard.set(true, forKey: "showeingsafety")
        }
        
    }
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
        SuzyPermissionManagerSuzy.shared.suzyRequestCameraAccessSuzy { ifauto in
            if ifauto{
                self.suzyInitializeCameraSuzy()
            }else{
                self.suzyShowPermissionDeniedStateSuzy()
            }
        }
//        switch AVCaptureDevice.authorizationStatus(for: .video) {
//        case .authorized:
//            suzyInitializeCameraSuzy()
//        case .notDetermined:
//            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
//                DispatchQueue.main.async {
//                    if granted { self?.suzyInitializeCameraSuzy() }
//                    else { self?.suzyShowPermissionDeniedStateSuzy() }
//                }
//            }
//        default:
//            suzyShowPermissionDeniedStateSuzy()
//        }
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
        // 检查 session 是否已经在运行，避免重复启动
        guard !self.suzyCaptureSessionSuzy.isRunning else { return }
        
        // 将耗时的启动操作移出主线程
        suzyCaptureQueueSuzy.async { [weak self] in
            guard let self = self else { return }
            
            // 执行启动逻辑
            self.suzyCaptureSessionSuzy.startRunning()
            
            // 如果启动后需要更新 UI（比如隐藏加载菊花），必须回到主线程
            DispatchQueue.main.async {
             
//                SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "Camera session is now active.",isSuccess: false)
            }
        }
    }
    @objc private func suzyHandleFilterTapSuzy(_ sender: UIButton) {
       

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
   
    
    
    //MARK: - Start meet
    @objc func suzyOnStartMeetClickedSuzy()  {

        if suzyAllFilterBtnSuzy.isSelected {
            self.navigationController?.pushViewController(SuzyAlgorithmyControllerSuzy.init(suzyCurrentMatchTypeSuzy: .suzyAllSuzy), animated: true)
            return
        }
        
        let freeCount = SuzyMatchManagerSuzy.shared.suzyGetRemainingFreeMatchesSuzy()
        if freeCount > 0 {
                // 还有免费次数，直接弹窗提示确认开始
            suzyShowCustomAlertSuzy(isEnough: true,isFreenAlert: true )
            
        } else {
            // 免费次数用完，检查金币
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
        let tip = SuzyMatchManagerSuzy.shared.suzyGetCurrentMatchTipSuzy()
        msgLabel.text = isEnough ? tip : "You don't have enough coins, please recharge now."
        
        if isFreenAlert {
            msgLabel.text = tip
        }
        
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
        
        // 1. 必须使用 pageSheet 才能支持半屏属性
        eulaVcSuzy.modalPresentationStyle = .pageSheet
        
        // 2. 配置半屏控制器 (仅支持 iOS 15+)
        if let suzySheetSuzy = eulaVcSuzy.sheetPresentationController {
            // 设置支持的高度：.medium() 是半屏，.large() 是全屏
            // 用户可以手动在半屏和全屏之间切换
            suzySheetSuzy.detents = [.medium(), .large()]
            
            // 是否显示顶部的指示条（那个小横杠）
            suzySheetSuzy.prefersGrabberVisible = true
            
            // 弹出时的圆角大小
            suzySheetSuzy.preferredCornerRadius = 24
            
            // 弹出时，背景是否可以交互（设为 true 则点击背景不会收起）
            suzySheetSuzy.prefersScrollingExpandsWhenScrolledToEdge = false
        }
        
        self.present(eulaVcSuzy, animated: true)
    }
}

extension UIViewController{
//     func suzyShowPermissionAlertSuzy() {
//        let suzyAlertSuzy = UIAlertController(
//            title: "Camera Access Required",
//            message: "To start a meet and verify your identity, please enable camera access in your device settings.",
//            preferredStyle: .alert
//        )
//        
//        // “去设置” 动作：直接跳转到当前 App 的系统设置页面
//        let suzySettingsActionSuzy = UIAlertAction(title: "Go to Settings", style: .default) { _ in
//            guard let suzySettingsUrlSuzy = URL(string: UIApplication.openSettingsURLString) else { return }
//            if UIApplication.shared.canOpenURL(suzySettingsUrlSuzy) {
//                UIApplication.shared.open(suzySettingsUrlSuzy, options: [:], completionHandler: nil)
//            }
//        }
//        
//        // “取消” 动作
//        let suzyCancelActionSuzy = UIAlertAction(title: "Maybe Later", style: .cancel, handler: nil)
//        
//        suzyAlertSuzy.addAction(suzySettingsActionSuzy)
//        suzyAlertSuzy.addAction(suzyCancelActionSuzy)
//       
//        if let suzyPopoverSuzy = suzyAlertSuzy.popoverPresentationController {
//            suzyPopoverSuzy.sourceView = self.view
//            suzyPopoverSuzy.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
//            suzyPopoverSuzy.permittedArrowDirections = []
//        }
//        
//        self.present(suzyAlertSuzy, animated: true, completion: nil)
//    }
}
