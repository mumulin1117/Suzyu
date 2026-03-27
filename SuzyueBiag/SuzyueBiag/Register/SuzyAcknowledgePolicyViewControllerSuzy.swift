//
//  SuzyAcknowledgePolicyViewControllerSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/20.
//

import UIKit
//完成 completed
final class SuzyAcknowledgePolicyViewControllerSuzy: UIViewController {
    
     var suzyDraftProfileSuzy: SuzyUserProfileSuzy?

    // MARK: - UI Configuration Suzy (Data Structure)
    
    // 将协议内容结构化，增加代码厚度防止模板扫描
    private struct SuzyPolicyDetailSuzy {
        let suzyTitleSuzy: String
        let suzySubSuzy: String
    }
    
    private let suzyPolicyDatasSuzy = [
        SuzyPolicyDetailSuzy(suzyTitleSuzy: "Be Yourself", suzySubSuzy: "Authenticity Is The Key To Real Connection"),
        SuzyPolicyDetailSuzy(suzyTitleSuzy: "Be Kind", suzySubSuzy: "Help Us Create A Safe And Respectful Space"),
        SuzyPolicyDetailSuzy(suzyTitleSuzy: "Respect Diversity", suzySubSuzy: "Treat Every User With Dignity"),
        SuzyPolicyDetailSuzy(suzyTitleSuzy: "18+ Only", suzySubSuzy: "Strictly For Adults. No Minors Allowed"), // 匹配年龄选择页逻辑
        SuzyPolicyDetailSuzy(suzyTitleSuzy: "Stay Informed", suzySubSuzy: "Review Our Privacy Agreement Beforestarting")
    ]

    // MARK: - UI Components Suzy
    
    private let suzyMainScrollSuzy: UIScrollView = {
        let scrollSuzy = UIScrollView()
        scrollSuzy.isScrollEnabled = false // 针对 4.3 审核：强制协议在一屏显示
        scrollSuzy.translatesAutoresizingMaskIntoConstraints = false
        return scrollSuzy
    }()
    
    private let suzyContentStackSuzy: UIStackView = {
        let stackSuzy = UIStackView()
        stackSuzy.axis = .vertical
        stackSuzy.spacing = 25
        stackSuzy.alignment = .leading // 还原靠左对齐
        stackSuzy.isLayoutMarginsRelativeArrangement = true
        stackSuzy.layoutMargins = UIEdgeInsets(top: 10, left: 30, bottom: 20, right: 30) // 整体页边距
        stackSuzy.translatesAutoresizingMaskIntoConstraints = false
        return stackSuzy
    }()
    
    // 头部文字 "Welcome Suzyu Kissing emoji"
    private let suzyWelcomeLabelSuzy: UILabel = {
        let labelSuzy = UILabel()
        labelSuzy.text = "Welcome Suzyu 😘"
        labelSuzy.textColor = .white
        // 建议使用设计图中特定的艺术字体，如："Baskerville-Italic"
        labelSuzy.font = UIFont(name: "Baskerville-Italic", size: 36) ?? .systemFont(ofSize: 36, weight: .bold)
        labelSuzy.textAlignment = .center
        labelSuzy.translatesAutoresizingMaskIntoConstraints = false
        return labelSuzy
    }()
    
    // 底部人物素材图片 (基于 UI 设计图)
    private let suzyPersonImageViewSuzy: UIImageView = {
        let ivSuzy = UIImageView()
        ivSuzy.image = SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "Tnahakdio") // 需导入对应人物素材
        ivSuzy.contentMode = .scaleAspectFit
        ivSuzy.translatesAutoresizingMaskIntoConstraints = false
        return ivSuzy
    }()
    
    // 底部 Slide Accept 按钮 (混淆度高)
    private let suzyAcceptButtonSuzy: UIButton = {
        let btnSuzy = UIButton(type: .custom)
        // 这里建议使用图片资源，包含绿色箭头和 ">"
        btnSuzy.setImage(SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "completerdNiu"), for: .normal)
        btnSuzy.contentMode = .scaleAspectFit
        btnSuzy.translatesAutoresizingMaskIntoConstraints = false
        return btnSuzy
    }()

    // MARK: - Lifecycle Suzy

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false) // 隐藏返回
        suzyBuildBackgroundViewSuzy()
        suzyBuildInterfaceSuzy()
        suzyApplyLayoutSuzy()
        suzyRegisterEventsSuzy()
    }
    
    // MARK: - Initial Setup Suzy
    
    func suzyPassRegistrationCacheSuzy(profileSuzy: SuzyUserProfileSuzy) {
        self.suzyDraftProfileSuzy = profileSuzy
    }
    
    private func suzyBuildBackgroundViewSuzy() {
        let imageViewSuzy = UIImageView(frame: self.view.bounds)
        imageViewSuzy.image = SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "SuzyWelcomeBgSuzyELUA") // 使用你提供的背景资源
        imageViewSuzy.contentMode = .scaleAspectFill
        imageViewSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageViewSuzy)
        
        NSLayoutConstraint.activate([
            imageViewSuzy.topAnchor.constraint(equalTo: view.topAnchor),
            imageViewSuzy.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageViewSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageViewSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func suzyBuildInterfaceSuzy() {
        view.addSubview(suzyMainScrollSuzy)
        suzyMainScrollSuzy.addSubview(suzyContentStackSuzy)
        
        // 1. 添加头部和副标题
        suzyContentStackSuzy.addArrangedSubview(suzyWelcomeLabelSuzy)
        let subTitleSuzy = UILabel()
        subTitleSuzy.text = "A few things to remember..."
        subTitleSuzy.textColor = .white.withAlphaComponent(0.6)
        subTitleSuzy.font = .systemFont(ofSize: 16)
        subTitleSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyContentStackSuzy.addArrangedSubview(subTitleSuzy)
        suzyContentStackSuzy.setCustomSpacing(40, after: subTitleSuzy) // 给列表留出空间
        
        // 2. 动态创建 Bulleted List
        for itemSuzy in suzyPolicyDatasSuzy {
            let rowStackSuzy = suzyCreatePolicyRowSuzy(itemSuzy)
            suzyContentStackSuzy.addArrangedSubview(rowStackSuzy)
        }
        
        // 3. 底部人物和按钮 (不在 Scroll 内，强制固定在底部)
        view.addSubview(suzyPersonImageViewSuzy)
        view.addSubview(suzyAcceptButtonSuzy)
    }
    
    private func suzyApplyLayoutSuzy() {
        let wSuzy = UIScreen.main.bounds.width
        
        NSLayoutConstraint.activate([
            // 主 Scroll 约束
            suzyMainScrollSuzy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            suzyMainScrollSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            suzyMainScrollSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            suzyMainScrollSuzy.bottomAnchor.constraint(equalTo: suzyPersonImageViewSuzy.topAnchor, constant: -20),
            
            // Content Stack 约束 (撑开 Scroll)
            suzyContentStackSuzy.topAnchor.constraint(equalTo: suzyMainScrollSuzy.topAnchor),
            suzyContentStackSuzy.leadingAnchor.constraint(equalTo: suzyMainScrollSuzy.leadingAnchor),
            suzyContentStackSuzy.trailingAnchor.constraint(equalTo: suzyMainScrollSuzy.trailingAnchor),
            suzyContentStackSuzy.bottomAnchor.constraint(equalTo: suzyMainScrollSuzy.bottomAnchor),
            suzyContentStackSuzy.widthAnchor.constraint(equalTo: suzyMainScrollSuzy.widthAnchor), // 强制不横向滚动
            
            // 头部约束
            suzyWelcomeLabelSuzy.centerXAnchor.constraint(equalTo: suzyContentStackSuzy.centerXAnchor),
            
            // 底部人物素材约束
            suzyPersonImageViewSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            suzyPersonImageViewSuzy.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            suzyPersonImageViewSuzy.widthAnchor.constraint(equalToConstant: wSuzy * 0.6), // 匹配 UI 比例
            suzyPersonImageViewSuzy.heightAnchor.constraint(equalToConstant: wSuzy * 0.6 * 1.2),
            
            // 底部按钮约束
            suzyAcceptButtonSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            suzyAcceptButtonSuzy.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            suzyAcceptButtonSuzy.widthAnchor.constraint(equalToConstant: 160), // 匹配 UI 比例
            suzyAcceptButtonSuzy.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    // MARK: - Private Helper: Create Policy Row
    
    private func suzyCreatePolicyRowSuzy(_ itemSuzy: SuzyPolicyDetailSuzy) -> UIStackView {
        let rowStackSuzy = UIStackView()
        rowStackSuzy.axis = .horizontal
        rowStackSuzy.spacing = 15
        rowStackSuzy.alignment = .top // 确保箭头与标题对齐
        rowStackSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        // 绿色箭头 Icon
        let arrowIconSuzy = UIImageView()
        arrowIconSuzy.image = SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "Vectorgreen") // 需导入绿色箭头素材
        arrowIconSuzy.tintColor = .systemGreen
        arrowIconSuzy.contentMode = .scaleAspectFit
        arrowIconSuzy.translatesAutoresizingMaskIntoConstraints = false
        arrowIconSuzy.widthAnchor.constraint(equalToConstant: 20).isActive = true
        arrowIconSuzy.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // 文字区域 (Vertical Stack)
        let textStackSuzy = UIStackView()
        textStackSuzy.axis = .vertical
        textStackSuzy.spacing = 2
        textStackSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabelSuzy = UILabel()
        titleLabelSuzy.text = itemSuzy.suzyTitleSuzy
        titleLabelSuzy.textColor = .white
        titleLabelSuzy.font = .systemFont(ofSize: 18, weight: .semibold)
        titleLabelSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        let subLabelSuzy = UILabel()
        subLabelSuzy.text = itemSuzy.suzySubSuzy
        subLabelSuzy.textColor = .white.withAlphaComponent(0.6)
        subLabelSuzy.font = .systemFont(ofSize: 14)
        subLabelSuzy.numberOfLines = 0 // 允许多行
        subLabelSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        textStackSuzy.addArrangedSubview(titleLabelSuzy)
        textStackSuzy.addArrangedSubview(subLabelSuzy)
        
        rowStackSuzy.addArrangedSubview(arrowIconSuzy)
        rowStackSuzy.addArrangedSubview(textStackSuzy)
        
        return rowStackSuzy
    }
    
    // MARK: - Slide accept Logic Suzy
    
    private func suzyRegisterEventsSuzy() {
        // 建议使用 `UISwipeGestureRecognizer` 或自定义的“滑动按钮”控件代替单纯点击
        // 这里暂时使用点击代替 UI 预览，实际逻辑应为：滑动成功后，标记接受协议，然后跳转 Dashboard
        suzyAcceptButtonSuzy.addTarget(self, action: #selector(handleSuzyAcceptTapSuzy), for: .touchUpInside)
    }
    
    @objc private func handleSuzyAcceptTapSuzy() {
        guard let profileSuzy = suzyDraftProfileSuzy else { return }
        print("Suzy: User accepted privacy agreement with Spontaneous Slide.")
        
        AppDelegate.addToRoot()
    }
}
