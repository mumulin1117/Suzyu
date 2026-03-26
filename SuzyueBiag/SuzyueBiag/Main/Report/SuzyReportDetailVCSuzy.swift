//
//  SuzyReportDetailVCSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/25.
//

import UIKit

final class SuzyReportDetailVCSuzy: UIViewController {

    private let suzyBackActionBtnSuzy = UIButton(type: .custom)
    private let suzyTitleHeaderSuzy = UILabel()
    
    private let suzyOptionsStackSuzy = UIStackView()
    private let suzyReasonInputAreaSuzy = UITextView()
    private let suzyConfirmActionBtnSuzy = UIButton(type: .custom)
    
    private var suzySelectedReasonIdxSuzy: Int = 3 // 默认选中 Other
    private let suzyReasonListSuzy = ["Fake photo", "Scam or commercial", "Not interested", "Other"]

    override func viewDidLoad() {
        super.viewDidLoad()
        suzyBuildReportInterfaceSuzy()
    }
    private let suzyFallbackBgImageViewSuzy: UIImageView = {
        let iv = UIImageView.init(frame: UIScreen.main.bounds)
        iv.image = UIImage(named: "SuzyWelcomeBgSuzyELUA@")
        iv.contentMode = .scaleAspectFill
       
        return iv
    }()
    private func suzyBuildReportInterfaceSuzy() {
        view.addSubview(suzyFallbackBgImageViewSuzy)
        let suzyScreenHeightSuzy = UIScreen.main.bounds.height
        
        // 1. 返回按钮
        suzyBackActionBtnSuzy.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        suzyBackActionBtnSuzy.tintColor = .white
        suzyBackActionBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyBackActionBtnSuzy)
        
        // 2. 标题提示
        suzyTitleHeaderSuzy.text = "Please select the reason for reporting this user:"
        suzyTitleHeaderSuzy.textColor = .lightGray
        suzyTitleHeaderSuzy.font = .systemFont(ofSize: 16, weight: .medium)
        suzyTitleHeaderSuzy.numberOfLines = 0
        suzyTitleHeaderSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyTitleHeaderSuzy)
        
        // 3. 选项列表堆栈
        suzyOptionsStackSuzy.axis = .vertical
        suzyOptionsStackSuzy.spacing = suzyScreenHeightSuzy * 0.035
        suzyOptionsStackSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyOptionsStackSuzy)
        
        // 渲染选项
        for (index, reason) in suzyReasonListSuzy.enumerated() {
            let suzyRowSuzy = suzyCreateReasonRowSuzy(titleSuzy: reason, tagSuzy: index)
            suzyOptionsStackSuzy.addArrangedSubview(suzyRowSuzy)
        }
        
        // 4. 自定义原因输入框
        suzyReasonInputAreaSuzy.backgroundColor = UIColor(white: 0.15, alpha: 1.0)
        suzyReasonInputAreaSuzy.layer.cornerRadius = 15
        suzyReasonInputAreaSuzy.textColor = .white
        suzyReasonInputAreaSuzy.font = .systemFont(ofSize: 14)
        suzyReasonInputAreaSuzy.text = "Enter your reason hers ..."
        suzyReasonInputAreaSuzy.textContainerInset = UIEdgeInsets(top: 15, left: 12, bottom: 15, right: 12)
        suzyReasonInputAreaSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyReasonInputAreaSuzy)
        
        // 5. 确认按钮
        suzyConfirmActionBtnSuzy.backgroundColor = .white
        suzyConfirmActionBtnSuzy.setTitle("Confirm", for: .normal)
        suzyConfirmActionBtnSuzy.setTitleColor(.black, for: .normal)
        suzyConfirmActionBtnSuzy.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        suzyConfirmActionBtnSuzy.layer.cornerRadius = 25
        suzyConfirmActionBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyConfirmActionBtnSuzy)
        
        // 布局约束
        NSLayoutConstraint.activate([
            suzyBackActionBtnSuzy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            suzyBackActionBtnSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            suzyTitleHeaderSuzy.topAnchor.constraint(equalTo: suzyBackActionBtnSuzy.bottomAnchor, constant: suzyScreenHeightSuzy * 0.04),
            suzyTitleHeaderSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            suzyTitleHeaderSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            suzyOptionsStackSuzy.topAnchor.constraint(equalTo: suzyTitleHeaderSuzy.bottomAnchor, constant: suzyScreenHeightSuzy * 0.05),
            suzyOptionsStackSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            suzyOptionsStackSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            suzyReasonInputAreaSuzy.topAnchor.constraint(equalTo: suzyOptionsStackSuzy.bottomAnchor, constant: 20),
            suzyReasonInputAreaSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            suzyReasonInputAreaSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            suzyReasonInputAreaSuzy.heightAnchor.constraint(equalToConstant: 160),
            
            suzyConfirmActionBtnSuzy.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            suzyConfirmActionBtnSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            suzyConfirmActionBtnSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            suzyConfirmActionBtnSuzy.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    private func suzyCreateReasonRowSuzy(titleSuzy: String, tagSuzy: Int) -> UIView {
        let suzyContainerSuzy = UIView()
        let suzyIsSelectedSuzy = (tagSuzy == suzySelectedReasonIdxSuzy)
        
        // 圆形选择框
        let suzyCircleSuzy = UIImageView()
        let suzyImgNameSuzy = suzyIsSelectedSuzy ? "checkmark.circle.fill" : "circle"
        suzyCircleSuzy.image = UIImage(systemName: suzyImgNameSuzy)
        suzyCircleSuzy.tintColor = suzyIsSelectedSuzy ? .systemRed : .gray
        suzyCircleSuzy.contentMode = .scaleAspectFit
        suzyCircleSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        let suzyLabelSuzy = UILabel()
        suzyLabelSuzy.text = titleSuzy
        suzyLabelSuzy.textColor = .white
        suzyLabelSuzy.font = .systemFont(ofSize: 17, weight: .regular)
        suzyLabelSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        suzyContainerSuzy.addSubview(suzyCircleSuzy)
        suzyContainerSuzy.addSubview(suzyLabelSuzy)
        
        NSLayoutConstraint.activate([
            suzyCircleSuzy.leadingAnchor.constraint(equalTo: suzyContainerSuzy.leadingAnchor),
            suzyCircleSuzy.centerYAnchor.constraint(equalTo: suzyContainerSuzy.centerYAnchor),
            suzyCircleSuzy.widthAnchor.constraint(equalToConstant: 24),
            suzyCircleSuzy.heightAnchor.constraint(equalToConstant: 24),
            
            suzyLabelSuzy.leadingAnchor.constraint(equalTo: suzyCircleSuzy.trailingAnchor, constant: 15),
            suzyLabelSuzy.centerYAnchor.constraint(equalTo: suzyContainerSuzy.centerYAnchor),
            suzyContainerSuzy.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        return suzyContainerSuzy
    }
}
