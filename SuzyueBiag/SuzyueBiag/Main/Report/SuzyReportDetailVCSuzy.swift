//
//  SuzyReportDetailVCSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/25.
//

import UIKit

final class SuzyReportDetailVCSuzy: UIViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    private let suzyBackActionBtnSuzy = UIButton(type: .custom)
    private let suzyTitleHeaderSuzy = UILabel()
    
    private let suzyOptionsStackSuzy = UIStackView()
    private let suzyReasonInputAreaSuzy = UITextView()
    private let suzyConfirmActionBtnSuzy = UIButton(type: .custom)
    
    private var suzySelectedReasonIdxSuzy: Int = 0 // 默认选中 Other
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
    
     @objc func suzyGoBackSuzy(){
        self.dismiss(animated: true)
    }
    private func suzyBuildReportInterfaceSuzy() {
        view.addSubview(suzyFallbackBgImageViewSuzy)
        let suzyScreenHeightSuzy = UIScreen.main.bounds.height
        suzyAddKeyboardObserversSuzy()
        // 1. 返回按钮
        suzyBackActionBtnSuzy.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        suzyBackActionBtnSuzy.tintColor = .white
        suzyBackActionBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyBackActionBtnSuzy)
        suzyConfirmActionBtnSuzy.addTarget(self, action: #selector(suzyPerformConfirmActionSuzy), for: .touchUpInside)
        suzyBackActionBtnSuzy.addTarget(self, action: #selector(suzyGoBackSuzy), for: .touchUpInside)
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
        suzyContainerSuzy.tag = tagSuzy // 标记索引
        
        // 添加点击手势
        let tap = UITapGestureRecognizer(target: self, action: #selector(suzyDidSelectReasonSuzy(_:)))
        suzyContainerSuzy.addGestureRecognizer(tap)
        suzyContainerSuzy.isUserInteractionEnabled = true

        let suzyIsSelectedSuzy = (tagSuzy == suzySelectedReasonIdxSuzy)
        
        let suzyCircleSuzy = UIImageView()
        // 使用 tag 方便后面查找更新
        suzyCircleSuzy.tag = 100
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
            suzyContainerSuzy.heightAnchor.constraint(equalToConstant: 40) // 稍微增加点击区域
        ])
        
        return suzyContainerSuzy
    }
    
    
}
// MARK: - Interaction & Logic Suzy
extension SuzyReportDetailVCSuzy {
    
    // 初始化时默认不选中（或者选中一个）
    // private var suzySelectedReasonIdxSuzy: Int = -1

    @objc private func suzyDidSelectReasonSuzy(_ sender: UITapGestureRecognizer) {
        guard let tappedView = sender.view else { return }
        suzySelectedReasonIdxSuzy = tappedView.tag
        
        // 刷新所有选项的 UI
        for (index, subview) in suzyOptionsStackSuzy.arrangedSubviews.enumerated() {
            if let circle = subview.viewWithTag(100) as? UIImageView {
                let isSelected = (index == suzySelectedReasonIdxSuzy)
                circle.image = UIImage(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                circle.tintColor = isSelected ? .systemRed : .gray
            }
        }
    }

    @objc private func suzyPerformConfirmActionSuzy() {
        // 1. 检查是否勾选
        if suzySelectedReasonIdxSuzy == -1 {
           
            SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "Please select a reason.", isSuccess: false)
            return
        }
        
        // 2. 检查 "Other" 逻辑 (假设 Other 是最后一个)
        let otherIdx = suzyReasonListSuzy.count - 1
        if suzySelectedReasonIdxSuzy == otherIdx {
            let content = suzyReasonInputAreaSuzy.text.trimmingCharacters(in: .whitespacesAndNewlines)
            if content.isEmpty || content == "Enter your reason hers ..." {
                
                SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "Please describe the reason.", isSuccess: false)
                return
            }
        }
        
        // 3. 提交成功效果
        suzySubmitSuccessSuzy()
    }
    
    private func suzySubmitSuccessSuzy() {
        SuzyHudManagerSuzy.shared.suzyShowStatusLoadingSuzy(message: "Uploading Report...")
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            SuzyHudManagerSuzy.shared.suzyHideLoadingSuzy()
            SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: "Report submitted successfully!")
            
            if self.navigationController == nil {
                self.dismiss(animated: true)
            } else{
                self.navigationController?.popViewController(animated: true)
            }
            
        }
    }
    
  
}
extension UIView {
    func suzyFindFirstResponderSuzy() -> UIView? {
        if isFirstResponder { return self }
        for subview in subviews {
            if let firstResponder = subview.suzyFindFirstResponderSuzy() { return firstResponder }
        }
        return nil
    }
}


extension UIViewController{
    
     func suzyAddKeyboardObserversSuzy() {
        NotificationCenter.default.addObserver(self,
                                                   selector: #selector(suzyKeyboardWillShowSuzy(_:)),
                                                   name: UIResponder.keyboardWillShowNotification,
                                                   object: nil)
   
           
        NotificationCenter.default.addObserver(self,
                                                   selector: #selector(suzyKeyboardWillHideSuzy(_:)),
                                                   name: UIResponder.keyboardWillHideNotification,
                                                   object: nil)
    }
    // MARK: - 全局视图位移处理 Suzy

    @objc func suzyKeyboardWillShowSuzy(_ n: Notification) {
        guard let userInfo = n.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardTop = view.frame.height - keyboardFrame.cgRectValue.height
        
        // 找到当前正在输入的那个控件（比如你的 suzyReasonInputAreaSuzy）
        if let activeView = self.view.suzyFindFirstResponderSuzy() {
            // 转换坐标系，获取控件底部在屏幕上的位置
            let frameInWindow = activeView.convert(activeView.bounds, to: self.view)
            let bottomY = frameInWindow.maxY
            
            // 如果控件底部被键盘挡住了
            if bottomY > keyboardTop {
                let offset = bottomY - keyboardTop + 20 // 多留 20 像素的间距
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin.y = -offset
                }
            }
        }
    }

    @objc func suzyKeyboardWillHideSuzy(_ n: Notification) {
        guard let userInfo = n.userInfo,
              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        
       
        if self.view.frame.origin.y != 0 {
            UIView.animate(withDuration: duration) {
                self.view.frame.origin.y = 0
            }
        }
    }
}
