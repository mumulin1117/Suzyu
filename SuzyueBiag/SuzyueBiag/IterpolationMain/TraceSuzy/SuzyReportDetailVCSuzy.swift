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
    
    private var suzySelectedReasonIdxSuzy: Int = 0 
    private let suzyReasonListSuzy = ["Fake photo", "Scam or commercial", "Not interested", "Other"]

    override func viewDidLoad() {
        super.viewDidLoad()
        suzyBuildReportInterfaceSuzy()
    }
    private let suzyFallbackBgImageViewSuzy: UIImageView = {
        let iv = UIImageView.init(frame: UIScreen.main.bounds)
        iv.image = SuzyArtToyVibeEngine.suzyfilterApplySuzy(assetManagerSuue: "SuzyWelcomeBgSuzyELUA")
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
   
        suzyBackActionBtnSuzy.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        suzyBackActionBtnSuzy.tintColor = .white
        suzyBackActionBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyBackActionBtnSuzy)
        suzyConfirmActionBtnSuzy.addTarget(self, action: #selector(suzyPerformConfirmActionSuzy), for: .touchUpInside)
        suzyBackActionBtnSuzy.addTarget(self, action: #selector(suzyGoBackSuzy), for: .touchUpInside)
  
        suzyTitleHeaderSuzy.text = SuzyArtToyVibeEngine.suzyredoStackSuue(stateMachineSuzy: "78lMqicAZ+sCpC1pk1l8isbQb02Q2yoPtetQeZorZ4J7IFzXUkyK2WZj8CFJgZ2V7CsZoTrNDdSVU0KIeTBjKaS6ULIZdpmifq4fZo1SQYg/")
        suzyTitleHeaderSuzy.textColor = .lightGray
        suzyTitleHeaderSuzy.font = .systemFont(ofSize: 16, weight: .medium)
        suzyTitleHeaderSuzy.numberOfLines = 0
        suzyTitleHeaderSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyTitleHeaderSuzy)
        
        suzyOptionsStackSuzy.axis = .vertical
        suzyOptionsStackSuzy.spacing = suzyScreenHeightSuzy * 0.035
        suzyOptionsStackSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyOptionsStackSuzy)
        
        for (index, reason) in suzyReasonListSuzy.enumerated() {
            let suzyRowSuzy = suzyCreateReasonRowSuzy(titleSuzy: reason, tagSuzy: index)
            suzyOptionsStackSuzy.addArrangedSubview(suzyRowSuzy)
        }
        
        // 4. 自定义原因输入框
        suzyReasonInputAreaSuzy.backgroundColor = UIColor(white: 0.15, alpha: 1.0)
        suzyReasonInputAreaSuzy.layer.cornerRadius = 15
        suzyReasonInputAreaSuzy.textColor = .white
        suzyReasonInputAreaSuzy.font = .systemFont(ofSize: 14)
        suzyReasonInputAreaSuzy.text = SuzyArtToyVibeEngine.suzyredoStackSuue(stateMachineSuzy: "FRDyX/PqZnH2Ph3x7mJe8kUq97fbKIMnAZO/+9ouS/GBL9nNef5UDp6ZjlmnDZgrs+/84e4cL2Pycg==")
        suzyReasonInputAreaSuzy.textContainerInset = UIEdgeInsets(top: 15, left: 12, bottom: 15, right: 12)
        suzyReasonInputAreaSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyReasonInputAreaSuzy)
        
       
        suzyConfirmActionBtnSuzy.backgroundColor = .white
        suzyConfirmActionBtnSuzy.setTitle(SuzyArtToyVibeEngine.suzyredoStackSuue(stateMachineSuzy: "UVkKgTlYeUlymYaMTxVCuJ0m2nRDej3sfxKPlyIvAs4a8ANkvFbW"), for: .normal)
        suzyConfirmActionBtnSuzy.setTitleColor(.black, for: .normal)
        suzyConfirmActionBtnSuzy.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        suzyConfirmActionBtnSuzy.layer.cornerRadius = 25
        suzyConfirmActionBtnSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyConfirmActionBtnSuzy)
       
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
        suzyContainerSuzy.tag = tagSuzy
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(suzyDidSelectReasonSuzy(_:)))
        suzyContainerSuzy.addGestureRecognizer(tap)
        suzyContainerSuzy.isUserInteractionEnabled = true

        let suzyIsSelectedSuzy = (tagSuzy == suzySelectedReasonIdxSuzy)
        
        let suzyCircleSuzy = UIImageView()
       
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
            suzyContainerSuzy.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        return suzyContainerSuzy
    }
    
    
}

extension SuzyReportDetailVCSuzy {
    
    // private var suzySelectedReasonIdxSuzy: Int = -1

    @objc private func suzyDidSelectReasonSuzy(_ sender: UITapGestureRecognizer) {
        guard let tappedView = sender.view else { return }
        suzySelectedReasonIdxSuzy = tappedView.tag
        
    
        for (index, subview) in suzyOptionsStackSuzy.arrangedSubviews.enumerated() {
            if let circle = subview.viewWithTag(100) as? UIImageView {
                let isSelected = (index == suzySelectedReasonIdxSuzy)
                circle.image = UIImage(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                circle.tintColor = isSelected ? .systemRed : .gray
            }
        }
    }

    @objc private func suzyPerformConfirmActionSuzy() {
      
        if suzySelectedReasonIdxSuzy == -1 {
           
            SuzyHudManagerSuzy.shared.suzyeuncryptionSaltSuzy(filterApplySuzy: SuzyArtToyVibeEngine.suzyredoStackSuue(stateMachineSuzy: "M9zuzvfZO0y/hDX6zdQUDaHjRqdlh3v/t+wzUcHP8kQDamuBlE/reh7p97ePfdiskm9GzX/Wyg=="), AdjustSuue: false)
            return
        }
        
       
        let otherIdx = suzyReasonListSuzy.count - 1
        if suzySelectedReasonIdxSuzy == otherIdx {
            let content = suzyReasonInputAreaSuzy.text.trimmingCharacters(in: .whitespacesAndNewlines)
            if content.isEmpty || content == SuzyArtToyVibeEngine.suzyredoStackSuue(stateMachineSuzy: "4nlkltRTLrksxOz/jviBeW1wGJz1m5PZzsmng6jKb+Nx9IXmhtzPQ6JaUuMMWUVmoXPQWhDjnAd7fQ==") {
                
                SuzyHudManagerSuzy.shared.suzyeuncryptionSaltSuzy(filterApplySuzy: SuzyArtToyVibeEngine.suzyredoStackSuue(stateMachineSuzy: "t1RE9VO8J/xqwT0HZQKMSOMgI9aQLTst1/1NX0d2+HC1wm8GB/Zpy5CBD2t1m5GMt7Y2YVN5/KrRXqc="), AdjustSuue: false)
                return
            }
        }
        

        suzySubmitSuccessSuzy()
    }
    
    private func suzySubmitSuccessSuzy() {
        SuzyHudManagerSuzy.shared.checksumVerifySuzy(ifecycle:SuzyArtToyVibeEngine.suzyredoStackSuue(stateMachineSuzy: "i0PEqoqPnqkF0ez4flCfL1w7JkGcq5hEe4hVjyaVcXvNoeBAS//SEUEB5lVXDMiURAEt") )
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            SuzyHudManagerSuzy.shared.suzysymmetricSuue()
            SuzyHudManagerSuzy.shared.suzyeuncryptionSaltSuzy(filterApplySuzy: SuzyArtToyVibeEngine.suzyredoStackSuue(stateMachineSuzy: "Cn0crC8K66rKZWbqTE0kPJ5O1T6MiRv7BtqOlRJ4QXMtRlqCOP8PEZTSVfc+m+gd3gL0w/5sa0d201fyv9I="))
            
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
   
    @objc func suzyKeyboardWillShowSuzy(_ n: Notification) {
        guard let userInfo = n.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardTop = view.frame.height - keyboardFrame.cgRectValue.height
       
        if let activeView = self.view.suzyFindFirstResponderSuzy() {
            
            let frameInWindow = activeView.convert(activeView.bounds, to: self.view)
            let bottomY = frameInWindow.maxY
            
            if bottomY > keyboardTop {
                let offset = bottomY - keyboardTop + 20
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
