//
//  SuzyProfileOnboardingControllerSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/20.
//
import AVFoundation
import UIKit

enum SuzyOnboardingStateSuzy: Int {
    case suzyGenderSelectSuzy = 0
    case suzyAgePickerSuzy = 1
    case suzyLivenessVerifySuzy = 2
    case suzyInterestTagSuzy = 3
    case suzyBioInputSuzy = 4
    
    
}

struct SuzyUserDraftProfileSuzy {
    var suzyGenderSuzy: String?
    var suzyAgeSuzy: Int = 15
    var suzyBioSuzy: String?
    var suzyTagsSuzy: [String] = []
}

//注册
final class SuzyProfileOnboardingControllerSuzy: UIViewController {
    private var suzyCaptureSessionSuzy: AVCaptureSession?
    private var suzyPreviewLayerSuzy: AVCaptureVideoPreviewLayer?
    private let suzyScannerLineSuzy = UIView()
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 确保预览图层始终填满它的容器（相机圆环）
        if let previewLayer = suzyPreviewLayerSuzy, let container = previewLayer.superlayer {
            previewLayer.frame = container.bounds
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    private let suzyAllInterestsSuzy: [String] = ["Dancing💃",
                                                  "Movies🎬",
                                                  "Animals🐈",
                                                  "Photography📷",
                                                  "Reading📖",
                                                  "Gaming🎮",
                                                  "Music🎵",
                                                  "Travel✈️",
                                                  "Painting🎨",
                                                  "Technology💻",
                                                  "Fashion👗",
                                                  "Cooking👨‍🍳",
                                                  "Food🍕",
                                                  "Sports⚽",
                                                  "Fitness💪"
    ]
    private weak var suzyInterestCollectionSuzy: UICollectionView?
    
    //MARK: - interest
    private func suzyInjectInterestGridSuzy() {
        let suzyLayoutSuzy = UICollectionViewFlowLayout()
        suzyLayoutSuzy.scrollDirection = .vertical
        suzyLayoutSuzy.minimumInteritemSpacing = 10
        suzyLayoutSuzy.minimumLineSpacing = 15
        suzyLayoutSuzy.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 20, right: 20)
        
        let suzyCVSuzy = UICollectionView(frame: .zero, collectionViewLayout: suzyLayoutSuzy)
        suzyCVSuzy.backgroundColor = .clear
        suzyCVSuzy.delegate = self
        suzyCVSuzy.dataSource = self
        suzyCVSuzy.allowsMultipleSelection = true // 支持多选
        suzyCVSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        // 注册自定义 Cell
        suzyCVSuzy.register(SuzyTagCellSuzy.self, forCellWithReuseIdentifier: "SuzyTagCellSuzy")
        
        suzyContainerViewSuzy.addSubview(suzyCVSuzy)
        self.suzyInterestCollectionSuzy = suzyCVSuzy
        suzyNextButtonSuzy.setTitle("Next", for: .normal)
        NSLayoutConstraint.activate([
            suzyCVSuzy.topAnchor.constraint(equalTo: suzySubLabelSuzy.bottomAnchor, constant: 20),
            suzyCVSuzy.leadingAnchor.constraint(equalTo: suzyContainerViewSuzy.leadingAnchor),
            suzyCVSuzy.trailingAnchor.constraint(equalTo: suzyContainerViewSuzy.trailingAnchor),
            suzyCVSuzy.bottomAnchor.constraint(equalTo: suzyContainerViewSuzy.bottomAnchor)
        ])
    }
    
    
    private let suzyAgeRangeSuzy = Array(15...99)
    
    // 用于 Liveness 检测的本地数据标记
    private var suzyHasLivenessVerifiedSuzy: Bool = false

    private var suzyCurrentStateSuzy: SuzyOnboardingStateSuzy = .suzyGenderSelectSuzy
    private var suzyProfileDataSuzy = SuzyUserDraftProfileSuzy()
     
    private let suzyNavigationBarStackSuzy: UIStackView = {
        let stackSuzy = UIStackView()
        stackSuzy.axis = .horizontal
        stackSuzy.alignment = .center
        stackSuzy.translatesAutoresizingMaskIntoConstraints = false
        return stackSuzy
        
    }()
    private let suzyBackButtonSuzy: UIButton = {
        let btnSuzy = UIButton(type: .system)
        let suzyConfigSuzy = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold)
        let suzyImgSuzy = UIImage(systemName: "arrow.left", withConfiguration: suzyConfigSuzy)
        btnSuzy.setImage(suzyImgSuzy, for: .normal)
        btnSuzy.tintColor = .white
        btnSuzy.translatesAutoresizingMaskIntoConstraints = false
        return btnSuzy
        
    }()
    
    // MARK: - UI Components Suzy
    private let suzyMainStackSuzy: UIStackView = {
        let stackSuzy = UIStackView()
        stackSuzy.axis = .vertical
        stackSuzy.spacing = 20
        stackSuzy.translatesAutoresizingMaskIntoConstraints = false
        return stackSuzy
    }()
    
    private let suzyHeaderLabelSuzy: UILabel = {
        let labelSuzy = UILabel()
        labelSuzy.textColor = .white
        labelSuzy.font = .systemFont(ofSize: 28, weight: .bold)
        labelSuzy.textAlignment = .center
        labelSuzy.numberOfLines = 0
        return labelSuzy
    }()
    
    private let suzySubLabelSuzy: UILabel = {
        let labelSuzy = UILabel()
        labelSuzy.textColor = UIColor.white.withAlphaComponent(0.6)
        labelSuzy.font = .systemFont(ofSize: 16)
        labelSuzy.textAlignment = .center
        return labelSuzy
    }()
    
    private let suzyContainerViewSuzy: UIView = {
        let viewSuzy = UIView()
        viewSuzy.isUserInteractionEnabled = true
       
        viewSuzy.translatesAutoresizingMaskIntoConstraints = false
        return viewSuzy
    }()
    
    private let suzyNextButtonSuzy: UIButton = {
        let btnSuzy = UIButton(type: .system)
        btnSuzy.backgroundColor = .white
        btnSuzy.setTitle("Next", for: .normal)
        btnSuzy.setTitleColor(.black, for: .normal)
        btnSuzy.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        btnSuzy.layer.cornerRadius = 28
        btnSuzy.translatesAutoresizingMaskIntoConstraints = false
        return btnSuzy
    }()
    
    private let suzySkipButtonSuzy: UIButton = {
        let btnSuzy = UIButton(type: .system)
        btnSuzy.setTitle("Skip", for: .normal)
        btnSuzy.setTitleColor(.white, for: .normal)
        btnSuzy.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        btnSuzy.translatesAutoresizingMaskIntoConstraints = false
        // 在初始化 UI 时
        btnSuzy.addTarget(self, action: #selector(suzyOnSkipStepSuzy), for: .touchUpInside)
        return btnSuzy
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        suzyAddKeyboardObserversSuzy()
       
        let imageViewSuzy = UIImageView.init(frame: self.view.bounds)
        imageViewSuzy.image = UIImage(named: "SuzyWelcomeBgSuzyELUA@")
        imageViewSuzy.contentMode = .scaleAspectFill
        imageViewSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageViewSuzy)
        suzyBuildInterfaceSuzy()
        suzyApplyLayoutSuzy()
        suzyRefreshStateUISuzy()
        suzyRegisterNavigationEventsSuzy()
        suzyNextButtonSuzy.addTarget(self, action: #selector(suzyOnNextStepSuzy), for: .touchUpInside)
        if let savedProfile = SuzySecureVaultSuzy.sharedSuzy.suzyGetSavedProfileSuzy() {
            // 将模型数据同步回当前页面的草稿对象
            // 注意：SuzyUserProfileSuzy 的性别是 Int，而 Draft 可能需要转换
            self.suzyProfileDataSuzy.suzyAgeSuzy = savedProfile.suzyAgeSuzy
            self.suzyProfileDataSuzy.suzyBioSuzy = savedProfile.suzyBioSuzy
            self.suzyProfileDataSuzy.suzyTagsSuzy = savedProfile.suzyTagsSuzy
            
            // 自动判定用户该去哪一步
            if savedProfile.suzyAgeSuzy > 0 && savedProfile.suzyGenderSuzy != 0 {
                // 如果已经填了性别和年龄，直接跳过前两步进入“鉴别”或“标签”页
                self.suzyCurrentStateSuzy = .suzyLivenessVerifySuzy
            }
            
        }
        suzyRefreshStateUISuzy()
        
    }
    
    private func suzyBuildInterfaceSuzy() {
        view.addSubview(suzyNavigationBarStackSuzy)
                
        suzyNavigationBarStackSuzy.addArrangedSubview(suzyBackButtonSuzy)
        view.addSubview(suzyMainStackSuzy)
        suzyMainStackSuzy.addArrangedSubview(suzyHeaderLabelSuzy)
        suzyMainStackSuzy.addArrangedSubview(suzySubLabelSuzy)
        view.addSubview(suzyContainerViewSuzy)
        view.addSubview(suzyNextButtonSuzy)
        view.addSubview(suzySkipButtonSuzy)
        
        suzyNextButtonSuzy.addTarget(self, action: #selector(suzyOnNextStepSuzy), for: .touchUpInside)
    }
    
    private func suzyApplyLayoutSuzy() {
        let hSuzy = UIScreen.main.bounds.height
        NSLayoutConstraint.activate([
            // 导航栏比例布局
                        
            suzyNavigationBarStackSuzy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            suzyNavigationBarStackSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            suzyNavigationBarStackSuzy.heightAnchor.constraint(equalToConstant: 44),
            suzyBackButtonSuzy.widthAnchor.constraint(equalToConstant: 44),
            
            // 内容区域布局
            suzyMainStackSuzy.topAnchor.constraint(equalTo: suzyNavigationBarStackSuzy.bottomAnchor, constant: hSuzy * 0.02),
            suzyMainStackSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width * 0.08),
            suzyMainStackSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIScreen.main.bounds.width * 0.08),
                        
            suzyMainStackSuzy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: hSuzy * 0.05),
            suzyMainStackSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            suzyMainStackSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            suzyContainerViewSuzy.topAnchor.constraint(equalTo: suzyMainStackSuzy.bottomAnchor, constant: 20),
            suzyContainerViewSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            suzyContainerViewSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            suzyContainerViewSuzy.bottomAnchor.constraint(equalTo: suzyNextButtonSuzy.topAnchor, constant: -20),
            
            suzyNextButtonSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            suzyNextButtonSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            suzyNextButtonSuzy.bottomAnchor.constraint(equalTo: suzySkipButtonSuzy.topAnchor, constant: -10),
            suzyNextButtonSuzy.heightAnchor.constraint(equalToConstant: 56),
            
            suzySkipButtonSuzy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            suzySkipButtonSuzy.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    private func suzyRegisterNavigationEventsSuzy() {
        suzyBackButtonSuzy.addTarget(self, action: #selector(handleSuzyNavigationBackSuzy), for: .touchUpInside)
        
    }
    deinit {
        suzyStopCameraSessionSuzy()
        NotificationCenter.default.removeObserver(self)
    }
    private func suzyRefreshStateUISuzy() {
        if suzyCurrentStateSuzy != .suzyLivenessVerifySuzy {
                suzyStopCameraSessionSuzy()
            }
        suzyContainerViewSuzy.subviews.forEach { $0.removeFromSuperview() }
        
        switch suzyCurrentStateSuzy {
        case .suzyGenderSelectSuzy:
            suzyHeaderLabelSuzy.text = "What's Your Gender?"
            suzySubLabelSuzy.text = "Tell us about your gender"
            suzySkipButtonSuzy.isHidden = true
            suzyInjectGenderViewSuzy()
            
        case .suzyAgePickerSuzy:
            suzyHeaderLabelSuzy.text = "How Old Are You?"
            suzySubLabelSuzy.text = "Please provide your age in years"
            suzySkipButtonSuzy.isHidden = true
            suzyInjectAgePickerSuzy()
            
        case .suzyBioInputSuzy:
            suzyHeaderLabelSuzy.text = "Tell People About Yourself"
            suzySubLabelSuzy.text = "Write a short bio (optional)"
            suzySkipButtonSuzy.isHidden = false
            suzyInjectBioInputSuzy()
            
        case .suzyInterestTagSuzy:
            suzyHeaderLabelSuzy.text = "Select Up To 5 Interest"
            suzySubLabelSuzy.text = "Tell us what piques your curiosity and passions"
            suzySkipButtonSuzy.isHidden = true
            suzyInjectInterestGridSuzy()
        case .suzyLivenessVerifySuzy:
            suzyHeaderLabelSuzy.text = "Verify Your Identity"
                        
            suzySubLabelSuzy.text = "Take a clear selfie so we can verify your age and help keep the community safe."
            suzySkipButtonSuzy.isHidden = true
            
            // 按钮逻辑差异化：必须先完成验证
            suzyInjectLivenessVerifyViewSuzy()
        }
        
        switch suzyCurrentStateSuzy {
            case .suzyGenderSelectSuzy, .suzyAgePickerSuzy, .suzyLivenessVerifySuzy:
                // 强制步骤：隐藏 Skip 按钮
                suzySkipButtonSuzy.isHidden = true
                suzySkipButtonSuzy.alpha = 0
                
            case .suzyBioInputSuzy, .suzyInterestTagSuzy:
                // 可选步骤：显示 Skip 按钮
                suzySkipButtonSuzy.isHidden = false
                // 增加一个淡入动画，符合马甲包的高级交互感
                UIView.animate(withDuration: 0.3) {
                    self.suzySkipButtonSuzy.alpha = 1.0
                }
            }
    }
    @objc private func handleSuzyNavigationBackSuzy() {
        if suzyCurrentStateSuzy == .suzyGenderSelectSuzy {
            // 第一步：返回登录页面
            print("Suzy: Exiting onboarding flow.")
            self.navigationController?.popViewController(animated: true)
        } else {
            // 非第一步：回退到上一个状态
            if let suzyPreviousStateSuzy = SuzyOnboardingStateSuzy(rawValue: suzyCurrentStateSuzy.rawValue - 1) {
                print("Suzy: Backtracking to state \(suzyPreviousStateSuzy).")
                suzyCurrentStateSuzy = suzyPreviousStateSuzy
                
                // 切换动画效果提高马甲包差异化
                UIView.transition(with: suzyContainerViewSuzy, duration: 0.15, options: .transitionCrossDissolve, animations: {
                    self.suzyRefreshStateUISuzy()
                }, completion: nil)
            }
        }
        
    }
    @objc private func suzyOnSkipStepSuzy() {
     
        // 触发生感反馈，给用户一个微小的点击确认感
        let suzySkipImpactSuzy = UIImpactFeedbackGenerator(style: .light)
        suzySkipImpactSuzy.impactOccurred()

        switch suzyCurrentStateSuzy {
            
       
        case .suzyInterestTagSuzy:
            // 兴趣标签是最后一步，点击 Skip 意味着不选标签直接完成
            self.suzyProfileDataSuzy.suzyTagsSuzy = []
            // 调用你之前写在 Keychain 工具类里的完成逻辑
            suzyAdvanceToNextStateSuzy()
        case .suzyBioInputSuzy:
            // 清空可能已经输入的一半内容，确保数据纯净
            self.suzyProfileDataSuzy.suzyBioSuzy = ""
            // 最后一步
            suzyFinalizeUserRegistrationSuzy()
            
            
        default:
            // 对于 Gender、Age、Identity 阶段，理论上 Skip 应该是隐藏的
            // 但为了代码健壮性，这里做一个保护
            print("Suzy: Skip is not permitted for mandatory verification steps.")
            break
        }
    }
    private func suzyInjectLivenessVerifyViewSuzy() {
        let hSuzy = UIScreen.main.bounds.height
        
        
            
            // 1. 相机容器 (圆环预览框)
            let suzyCameraContainerSuzy = UIView()
            suzyCameraContainerSuzy.backgroundColor = .black
            suzyCameraContainerSuzy.layer.cornerRadius = 100 // 圆形
            suzyCameraContainerSuzy.layer.borderWidth = 3
            suzyCameraContainerSuzy.layer.borderColor = UIColor.systemPurple.cgColor
            suzyCameraContainerSuzy.layer.masksToBounds = true
            suzyCameraContainerSuzy.translatesAutoresizingMaskIntoConstraints = false
            suzyContainerViewSuzy.addSubview(suzyCameraContainerSuzy)
            
            // 2. 扫描线
            suzyScannerLineSuzy.backgroundColor = .systemPurple
            suzyScannerLineSuzy.frame = CGRect(x: 0, y: 0, width: 200, height: 2)
            suzyScannerLineSuzy.alpha = 0 // 初始隐藏
            suzyCameraContainerSuzy.addSubview(suzyScannerLineSuzy)

            NSLayoutConstraint.activate([
                suzyCameraContainerSuzy.topAnchor.constraint(equalTo: suzyContainerViewSuzy.topAnchor, constant: hSuzy * 0.05),
                suzyCameraContainerSuzy.centerXAnchor.constraint(equalTo: suzyContainerViewSuzy.centerXAnchor),
                suzyCameraContainerSuzy.widthAnchor.constraint(equalToConstant: 200),
                suzyCameraContainerSuzy.heightAnchor.constraint(equalToConstant: 200)
            ])
        
        // Privacy Banner respectfully
        let suzyPrivacyStackSuzy = UIStackView()
        suzyPrivacyStackSuzy.axis = .horizontal
        suzyPrivacyStackSuzy.spacing = 10
        suzyPrivacyStackSuzy.backgroundColor = UIColor.white.withAlphaComponent(0.08)
        suzyPrivacyStackSuzy.layer.cornerRadius = 12
        suzyPrivacyStackSuzy.isLayoutMarginsRelativeArrangement = true
        suzyPrivacyStackSuzy.layoutMargins = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        suzyPrivacyStackSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyContainerViewSuzy.addSubview(suzyPrivacyStackSuzy)
        
        let suzyLockSuzy = UIImageView()
        suzyLockSuzy.image = UIImage(systemName: "lock.fill")
        suzyLockSuzy.tintColor = UIColor.white.withAlphaComponent(0.6)
        suzyLockSuzy.contentMode = .scaleAspectFit
        suzyLockSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyLockSuzy.widthAnchor.constraint(equalToConstant: 16).isActive = true
        
        let suzyPrivacyLabelSuzy = UILabel()
        suzyPrivacyLabelSuzy.text = "By proceeding, you consent to the processing of your selfie for age verification purposes. Your photo will not be shared with third parties."
        suzyPrivacyLabelSuzy.textColor = UIColor.white.withAlphaComponent(0.8)
        suzyPrivacyLabelSuzy.font = .systemFont(ofSize: 13, weight: .regular)
        suzyPrivacyLabelSuzy.numberOfLines = 0
        suzyPrivacyLabelSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        suzyPrivacyStackSuzy.addArrangedSubview(suzyLockSuzy)
        suzyPrivacyStackSuzy.addArrangedSubview(suzyPrivacyLabelSuzy)
        
        NSLayoutConstraint.activate([
            suzyPrivacyStackSuzy.topAnchor.constraint(equalTo: suzyCameraContainerSuzy.bottomAnchor, constant: hSuzy * 0.04),
            suzyPrivacyStackSuzy.leadingAnchor.constraint(equalTo: suzyContainerViewSuzy.leadingAnchor, constant: 30),
            suzyPrivacyStackSuzy.trailingAnchor.constraint(equalTo: suzyContainerViewSuzy.trailingAnchor, constant: -30)
        ])
        
        // 更新底部按钮为：激活验证流程
        suzyNextButtonSuzy.setTitle("Start Analysis", for: .normal)
        suzySetupFrontCameraSuzy(in: suzyCameraContainerSuzy)

        
    }
    private func suzySetupFrontCameraSuzy(in container: UIView) {
        SuzyPermissionManagerSuzy.shared.suzyRequestCameraAccessSuzy { ifauto in
            if ifauto{
                self.suzyInitCaptureSessionSuzy(in: container)
            }else{
                SuzyPermissionManagerSuzy.shared.suzyShowCameraDeniedAlertSuzy(on: self)
            }
        }

    }

    // 提取出的纯粹初始化逻辑
    private func suzyInitCaptureSessionSuzy(in container: UIView) {
        let session = AVCaptureSession()
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
              let input = try? AVCaptureDeviceInput(device: device) else { return }
        
        if session.canAddInput(input) {
            session.addInput(input)
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = container.bounds
        
        previewLayer.videoGravity = .resizeAspectFill
        container.layer.insertSublayer(previewLayer, at: 0)
        self.suzyPreviewLayerSuzy = previewLayer
        
        DispatchQueue.global().async {
            session.startRunning()
            self.suzyCaptureSessionSuzy = session
        }
    }
    private func suzyStopCameraSessionSuzy() {
        if let session = suzyCaptureSessionSuzy, session.isRunning {
            DispatchQueue.global().async {
                session.stopRunning()
            }
        }
        // 移除预览图层，释放内存
        suzyPreviewLayerSuzy?.removeFromSuperlayer()
        suzyPreviewLayerSuzy = nil
        suzyCaptureSessionSuzy = nil
    }
    // 执行扫描验证
    private func suzyPerformIdentityCheckSuzy() {
        // 1. 显示 Loading 和启动动画
        SuzyHudManagerSuzy.shared.suzyShowStatusLoadingSuzy(message: "Analyzing features...")
        suzyNextButtonSuzy.isUserInteractionEnabled = false
        
        // 2. 扫描线动画
        suzyScannerLineSuzy.alpha = 1
        UIView.animate(withDuration: 1.5, delay: 0, options: [.autoreverse, .repeat]) {
            self.suzyScannerLineSuzy.frame.origin.y = 198
        }
        
        // 3. 模拟算法分析
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            guard let self = self else { return }
            self.suzyScannerLineSuzy.layer.removeAllAnimations()
            self.suzyScannerLineSuzy.alpha = 0
            SuzyHudManagerSuzy.shared.suzyHideLoadingSuzy()
            
            // 核心逻辑：校验用户填写的资料
            // 这里模拟逻辑：如果填写的年龄 < 18 或性别为空（实际上前面有 guard），此处做模拟匹配失败
            let suzySelectedAge = self.suzyProfileDataSuzy.suzyAgeSuzy
            let suzyIsMatching = (suzySelectedAge >= 18 && suzySelectedAge <= 60) // 业务逻辑：假设只允许 18-60 岁通过
            
            if suzyIsMatching {
                self.suzyHasLivenessVerifiedSuzy = true
                SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "Verification Successful: Gender & Age matched.", isSuccess: true)
                self.suzyAdvanceToNextStateSuzy()
            } else {
                // 失败提示并回退
                SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "Verification Failed: Profile mismatch. Please re-select.", isSuccess: false)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    // 强制返回第一步重新选择性别/年纪
                    self.suzyCurrentStateSuzy = .suzyGenderSelectSuzy
                    self.suzyRefreshStateUISuzy()
                }
            }
            self.suzyNextButtonSuzy.isUserInteractionEnabled = true
        }
    }
    @objc private func suzyOnNextStepSuzy() {
        
        // --- 步骤校验逻辑 (Suzy Integrity Check) ---
        switch suzyCurrentStateSuzy {
        case .suzyGenderSelectSuzy:
            guard suzyProfileDataSuzy.suzyGenderSuzy != nil else {
                SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "Please select your gender to proceed.",isSuccess: false)
               
                return
            }
            
        case .suzyAgePickerSuzy:
            // 年龄在 Picker 中通常有默认值，但需确保已确认
            guard suzyProfileDataSuzy.suzyAgeSuzy >= 18 else {
                SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "You must be at least 18 years old.",isSuccess: false)
                
                return
            }
            
        case .suzyLivenessVerifySuzy:
            if !suzyHasLivenessVerifiedSuzy {
                // 触发你之前的模拟鉴权逻辑
                SuzyPermissionManagerSuzy.shared.suzyRequestCameraAccessSuzy { ifauto in
                    if ifauto{
                        self.suzyPerformIdentityCheckSuzy()
                    }else{
                        SuzyPermissionManagerSuzy.shared.suzyShowCameraDeniedAlertSuzy(on: self)
                    }
                }
               
                return
            }
            
        case .suzyBioInputSuzy, .suzyInterestTagSuzy:
            // 这两步允许直接通过（Skip 逻辑已在 UI 层通过按钮体现，Next 键在此不做强制阻拦）
            break
        }
        suzySaveCurrentDraftToVaultSuzy()
        suzyAdvanceToNextStateSuzy()
    }

    
    // 在你的 Next 按钮点击逻辑中调用
    private func suzySaveCurrentDraftToVaultSuzy() {
        // 构造一个临时的正式模型进行保存
        let draft = self.suzyProfileDataSuzy
        
        let tempProfile = SuzyUserProfileSuzy(
            suzyUidSuzy: "temp_id", // 还没正式注册完可以先传占位
            suzyGenderSuzy: (draft.suzyGenderSuzy == "Woman" ? 1 : 2),
            suzyAgeSuzy: draft.suzyAgeSuzy,
            suzyUsername: "",
            suzyTagsSuzy: draft.suzyTagsSuzy,
            suzyBioSuzy: draft.suzyBioSuzy ?? "",
            suzyCoinsSuzy: 0,
            suzyIsVerifiedSuzy: false,
            suzyRegTimestampSuzy: Date().timeIntervalSince1970
        )
        
        // 使用你写的 suzyInitializeIdentitySuzy 保存到本地
        SuzySecureVaultSuzy.sharedSuzy.suzyInitializeIdentitySuzy(profileSuzy: tempProfile)
    }

}

// MARK: - State Injections Suzy
extension SuzyProfileOnboardingControllerSuzy {
    //MARK: - Gender
    private func suzyInjectGenderViewSuzy() {
        let gendersSuzy = ["Woman", "Man", "Other"]
        let stackSuzy = UIStackView()
        stackSuzy.axis = .vertical
        stackSuzy.spacing = 15
        stackSuzy.isUserInteractionEnabled = true
        stackSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyContainerViewSuzy.addSubview(stackSuzy)
        
        NSLayoutConstraint.activate([
            stackSuzy.centerYAnchor.constraint(equalTo: suzyContainerViewSuzy.centerYAnchor),
            stackSuzy.leadingAnchor.constraint(equalTo: suzyContainerViewSuzy.leadingAnchor, constant: 30),
            stackSuzy.trailingAnchor.constraint(equalTo: suzyContainerViewSuzy.trailingAnchor, constant: -30),
            suzyContainerViewSuzy.heightAnchor.constraint(greaterThanOrEqualTo: stackSuzy.heightAnchor)
        ])
        
        let imageViewSuzy = UIImageView.init(frame: self.view.bounds)
        imageViewSuzy.image = UIImage(named: "gegnderpickong")
        imageViewSuzy.contentMode = .scaleAspectFit
        imageViewSuzy.translatesAutoresizingMaskIntoConstraints = false
        imageViewSuzy.heightAnchor.constraint(equalToConstant: 184).isActive = true
        stackSuzy.addArrangedSubview(imageViewSuzy)
        
        for gSuzy in gendersSuzy {
            let btnSuzy = UIButton(type: .system)
            btnSuzy.setTitle(gSuzy, for: .normal)
            btnSuzy.setTitleColor(.white, for: .normal)
            btnSuzy.layer.borderWidth = 1
            btnSuzy.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
            btnSuzy.layer.cornerRadius = 15
            btnSuzy.heightAnchor.constraint(equalToConstant: 60).isActive = true
            btnSuzy.contentHorizontalAlignment = .left
            btnSuzy.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
            
            if suzyProfileDataSuzy.suzyGenderSuzy == gSuzy {
                suzyApplyGradientToButtonSuzy(suzyTargetButtonSuzy: btnSuzy)
            }else{
                btnSuzy.backgroundColor = .clear
                btnSuzy.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
            }
            
            btnSuzy.addAction(UIAction(handler: { [weak self] _ in
                guard let self = self else { return }
                            
                self.suzyProfileDataSuzy.suzyGenderSuzy = gSuzy
                // 触发生感反馈，增加用户体验差异化
                let suzyImpactSuzy = UIImpactFeedbackGenerator(style: .medium)
                suzyImpactSuzy.impactOccurred()
                
                self.suzyRefreshStateUISuzy()
            }), for: .touchUpInside)
            stackSuzy.addArrangedSubview(btnSuzy)
        }
    }
    //MARK: - Age
    private func suzyInjectAgePickerSuzy() {
        let suzyPickerSuzy = UIPickerView()
        suzyPickerSuzy.delegate = self
        suzyPickerSuzy.dataSource = self
        suzyPickerSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyContainerViewSuzy.addSubview(suzyPickerSuzy)
        
        // 默认选中 32 岁（匹配 UI 设计图）或之前保存的值
        let suzyInitialAgeSuzy = suzyProfileDataSuzy.suzyAgeSuzy > 0 ? suzyProfileDataSuzy.suzyAgeSuzy : 32
        if let suzyIndexSuzy = suzyAgeRangeSuzy.firstIndex(of: suzyInitialAgeSuzy) {
            suzyPickerSuzy.selectRow(suzyIndexSuzy, inComponent: 0, animated: false)
            self.suzyProfileDataSuzy.suzyAgeSuzy = suzyInitialAgeSuzy
        }

        NSLayoutConstraint.activate([
            suzyPickerSuzy.centerXAnchor.constraint(equalTo: suzyContainerViewSuzy.centerXAnchor),
            suzyPickerSuzy.centerYAnchor.constraint(equalTo: suzyContainerViewSuzy.centerYAnchor),
            suzyPickerSuzy.widthAnchor.constraint(equalTo: suzyContainerViewSuzy.widthAnchor, multiplier: 0.8),
            suzyPickerSuzy.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        suzyNextButtonSuzy.setTitle("Continue", for: .normal)
        suzyAddCustomSelectionLinesSuzy(to: suzyPickerSuzy)
    }

    private func suzyAddCustomSelectionLinesSuzy(to picker: UIPickerView) {
        let suzyLineHeightSuzy: CGFloat = 2.0
        let suzyLineColorSuzy = UIColor(red: 0.65, green: 0.3, blue: 1, alpha: 1) // 匹配渐变紫色
        
        let suzyTopLineSuzy = UIView()
        suzyTopLineSuzy.backgroundColor = suzyLineColorSuzy
        suzyTopLineSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        let suzyBottomLineSuzy = UIView()
        suzyBottomLineSuzy.backgroundColor = suzyLineColorSuzy
        suzyBottomLineSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        picker.addSubview(suzyTopLineSuzy)
        picker.addSubview(suzyBottomLineSuzy)
        
        NSLayoutConstraint.activate([
            // 顶部线 (高度约为 45 是标准行高)
            suzyTopLineSuzy.centerXAnchor.constraint(equalTo: picker.centerXAnchor),
            suzyTopLineSuzy.centerYAnchor.constraint(equalTo: picker.centerYAnchor, constant: -25),
            suzyTopLineSuzy.widthAnchor.constraint(equalToConstant: 120), // 对应设计图短横线长度
            suzyTopLineSuzy.heightAnchor.constraint(equalToConstant: suzyLineHeightSuzy),
            
            // 底部线
            suzyBottomLineSuzy.centerXAnchor.constraint(equalTo: picker.centerXAnchor),
            suzyBottomLineSuzy.centerYAnchor.constraint(equalTo: picker.centerYAnchor, constant: 25),
            suzyBottomLineSuzy.widthAnchor.constraint(equalToConstant: 120),
            suzyBottomLineSuzy.heightAnchor.constraint(equalToConstant: suzyLineHeightSuzy)
        ])
    }
    //MARK: - about self
    private func suzyInjectBioInputSuzy() {
        let tvSuzy = UITextView()
        tvSuzy.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        tvSuzy.layer.cornerRadius = 12
        tvSuzy.textColor = .white
        tvSuzy.contentInset = UIEdgeInsets.init(top: 15, left: 15, bottom: 10, right: 15)
        tvSuzy.font = .systemFont(ofSize: 16)
        tvSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyContainerViewSuzy.addSubview(tvSuzy)
        suzyNextButtonSuzy.setTitle("Next", for: .normal)
        NSLayoutConstraint.activate([
            tvSuzy.topAnchor.constraint(equalTo: suzyContainerViewSuzy.topAnchor, constant: 20),
            tvSuzy.leadingAnchor.constraint(equalTo: suzyContainerViewSuzy.leadingAnchor, constant: 30),
            tvSuzy.trailingAnchor.constraint(equalTo: suzyContainerViewSuzy.trailingAnchor, constant: -30),
            tvSuzy.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
 
    
}


extension SuzyProfileOnboardingControllerSuzy{
    private func suzyAdvanceToNextStateSuzy() {
        if let nextStateSuzy = SuzyOnboardingStateSuzy(rawValue: suzyCurrentStateSuzy.rawValue + 1) {
            suzyCurrentStateSuzy = nextStateSuzy
            UIView.transition(with: self.view, duration: 0.3, options: .transitionCurlUp, animations: {
                self.suzyRefreshStateUISuzy()
            }, completion: nil)
        } else {
            // --- 最终注册完成：执行本地化持久存储 ---
            suzyFinalizeUserRegistrationSuzy()
        }
    }
    
    private func suzyFinalizeUserRegistrationSuzy() {
        
        // 构造初始模型 (初始金币设为 0 或 赠送值)
        let suzyNewProfileSuzy = SuzyUserProfileSuzy(
            suzyUidSuzy: SuzySecureVaultSuzy.suzyProfileKeySuzy,
            suzyGenderSuzy: suzyProfileDataSuzy.suzyGenderSuzy == "Women" ? 1 : 0 ,
            suzyAgeSuzy: suzyProfileDataSuzy.suzyAgeSuzy, suzyUsername: "",
            suzyTagsSuzy: suzyProfileDataSuzy.suzyTagsSuzy,
            suzyBioSuzy: suzyProfileDataSuzy.suzyBioSuzy ?? "",
            suzyCoinsSuzy: 0, // 初始赠送 0 金币
            suzyIsVerifiedSuzy: suzyHasLivenessVerifiedSuzy,
            suzyRegTimestampSuzy: Date().timeIntervalSince1970
        )
        
        // 使用 Vault 永久本地化存储
        SuzySecureVaultSuzy.sharedSuzy.suzyInitializeIdentitySuzy(profileSuzy: suzyNewProfileSuzy)
        
        let compltedvc = SuzyAcknowledgePolicyViewControllerSuzy()
        compltedvc.suzyDraftProfileSuzy = suzyNewProfileSuzy
        
        self.navigationController?.pushViewController(compltedvc, animated: true)
    }

    
    
}


extension NSObject{
    func suzyApplyGradientToButtonSuzy(suzyTargetButtonSuzy: UIButton) {
        // 移除旧的渐变层，防止重复堆叠
        suzyTargetButtonSuzy.layer.sublayers?.filter({ $0 is CAGradientLayer }).forEach({ $0.removeFromSuperlayer() })
        
        let suzyGradientLayerSuzy = CAGradientLayer()
        // 使用你提供的颜色值
        suzyGradientLayerSuzy.colors = [
            UIColor(red: 0.65, green: 0.3, blue: 1, alpha: 1).cgColor,
            UIColor(red: 0.47, green: 0.09, blue: 1, alpha: 1).cgColor
        ]
        
        // 设置渐变方向（从左上到右下，增加视觉高级感）
        suzyGradientLayerSuzy.startPoint = CGPoint(x: 0, y: 0)
        suzyGradientLayerSuzy.endPoint = CGPoint(x: 1, y: 1)
        
        // 这里的 frame 需要在布局完成后确定，或者在按钮初始化时指定
        suzyGradientLayerSuzy.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 60, height: 60)
        suzyGradientLayerSuzy.cornerRadius = 15
        
        // 将渐变层插入到最底层，确保不遮挡文字
        suzyTargetButtonSuzy.layer.insertSublayer(suzyGradientLayerSuzy, at: 0)
        suzyTargetButtonSuzy.clipsToBounds = true
        suzyTargetButtonSuzy.layer.borderColor = UIColor.clear.cgColor
    }
}


extension SuzyProfileOnboardingControllerSuzy: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return suzyAgeRangeSuzy.count
    }
    
    // 核心：自定义每行视图以实现设计图中的样式
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let suzyLabelSuzy = (view as? UILabel) ?? UILabel()
        suzyLabelSuzy.textAlignment = .center
        
        let suzyAgeValueSuzy = suzyAgeRangeSuzy[row]
        let suzySelectedAgeSuzy = suzyAgeRangeSuzy[pickerView.selectedRow(inComponent: 0)]
        
        // 设置字体样式
        if suzyAgeValueSuzy == suzySelectedAgeSuzy {
            suzyLabelSuzy.font = .systemFont(ofSize: 48, weight: .bold) // 中间选中大字
            suzyLabelSuzy.textColor = .white
        } else {
            suzyLabelSuzy.font = .systemFont(ofSize: 32, weight: .medium) // 非选中小字
            suzyLabelSuzy.textColor = .white.withAlphaComponent(0.3)
        }
        
        suzyLabelSuzy.text = "\(suzyAgeValueSuzy)"
        return suzyLabelSuzy
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60 // 增加行高以适应大字体
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.suzyProfileDataSuzy.suzyAgeSuzy = suzyAgeRangeSuzy[row]
        pickerView.reloadAllComponents() // 重新加载以更新字体大小对比效果
    }
}

//MARK: - 兴趣标签
extension SuzyProfileOnboardingControllerSuzy: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suzyAllInterestsSuzy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let suzyCellSuzy = collectionView.dequeueReusableCell(withReuseIdentifier: "SuzyTagCellSuzy", for: indexPath) as! SuzyTagCellSuzy
        let suzyItemSuzy = suzyAllInterestsSuzy[indexPath.item]
        let suzyIsSelectedSuzy = suzyProfileDataSuzy.suzyTagsSuzy.contains(suzyItemSuzy)
        suzyCellSuzy.suzyConfigureSuzy(item: suzyItemSuzy, isSelected: suzyIsSelectedSuzy)
        return suzyCellSuzy
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        
        let tagNameSuzy = suzyAllInterestsSuzy[indexPath.item]
        if suzyProfileDataSuzy.suzyTagsSuzy.contains(tagNameSuzy) {
            // 1. 数据移除
            if let index = suzyProfileDataSuzy.suzyTagsSuzy.firstIndex(of: tagNameSuzy) {
                suzyProfileDataSuzy.suzyTagsSuzy.remove(at: index)
            }
            // 2. 取消选中
            SuzySecureVaultSuzy.sharedSuzy.suzyUpdateMutableAttributesSuzy(newTagsSuzy: suzyProfileDataSuzy.suzyTagsSuzy)
            collectionView.reloadItems(at: [indexPath])
//            suzyUpdateTitleCountSuzy()
            return
            
        }
          
            if suzyProfileDataSuzy.suzyTagsSuzy.count >= 5 {
               
                return
            }
          
            if !suzyProfileDataSuzy.suzyTagsSuzy.contains(tagNameSuzy) {
                suzyProfileDataSuzy.suzyTagsSuzy.append(tagNameSuzy)
//                suzyUpdateTitleCountSuzy() // 更新标题数量显示
                SuzySecureVaultSuzy.sharedSuzy.suzyUpdateMutableAttributesSuzy(newTagsSuzy:suzyProfileDataSuzy.suzyTagsSuzy)
                collectionView.reloadItems(at: [indexPath])
            }
        
     
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let suzyTextSuzy = suzyAllInterestsSuzy[indexPath.item]
      
        let suzyFullStringSuzy = suzyTextSuzy
        
        // 动态计算宽度以适配流式布局
        let suzySizeSuzy = (suzyFullStringSuzy as NSString).size(withAttributes: [.font: UIFont.systemFont(ofSize: 14)])
        return CGSize(width: suzySizeSuzy.width + 40, height: 40)
    }
}
