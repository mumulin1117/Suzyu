//
//  SuzyChatDetailViewController.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/25.
//

import UIKit

class SuzyChatDetailViewController: UIViewController {
    private var suzyInputBarBottomConstraintSuzy: NSLayoutConstraint!
   
    var targetUser: UseAertionEntitySuzy?
    var chatHistory: [SuzyChatDetailRecord] = []
    
 
    private let suzyChatTableSuzy = UITableView()
    private let inputBar = UIView()
    private let textField = UITextField()
    private let sendButton = UIButton()
    
    private let suzyControlWrapperSuzy = UIStackView()
    private let suzyCameraSwitchBtnSuzy = UIButton(type: .custom)
   
    private let suzyAertionUserInfoSuzy = UIButton(type: .custom)
    private let suzyFallbackBgImageViewSuzy: UIImageView = {
        let iv = UIImageView.init(frame: UIScreen.main.bounds)
        iv.image = SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "SuzyWelcomeBgSuzyELUA")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(suzyFallbackBgImageViewSuzy)
        NotificationCenter.default.addObserver(self, selector: #selector(backAction), name: NSNotification.Name("SuzySwitchToReportDetails"), object: nil)
        setupNavigation()
        setupTableView()
        setupInputBar()
        
      
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
 

    private func setupNavigation() {
        suzyControlWrapperSuzy.axis = .horizontal
        suzyControlWrapperSuzy.spacing = 15
        
        suzyControlWrapperSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyControlWrapperSuzy)
    
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        backBtn.tintColor = .white
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
      
 
        let suzySpacerSuzy = UIView()
            suzySpacerSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzySpacerSuzy.setContentHuggingPriority(.init(1), for: .horizontal)
        suzyCameraSwitchBtnSuzy.setImage(SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "calcaremaifl"), for: .normal)
        suzyCameraSwitchBtnSuzy.addTarget(self, action: #selector(funcbuildCafff), for: .touchUpInside)
        
        suzyAertionUserInfoSuzy.addTarget(self, action: #selector(showReportMenu), for: .touchUpInside)
        suzyAertionUserInfoSuzy.setTitle(targetUser?.suzyUsernameSuzy, for: .normal)
        suzyAertionUserInfoSuzy.titleLabel?.font = .systemFont(ofSize: 12)
        suzyAertionUserInfoSuzy.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2500)
        suzyAertionUserInfoSuzy.layer.cornerRadius = 10
        suzyAertionUserInfoSuzy.setImage(SuzyArtToyVibeEngine.suzyFetchVibeGraphic(suzyAliasName: "exclamationmark"), for: .normal)
        suzyAertionUserInfoSuzy.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
      
            
        suzyAertionUserInfoSuzy.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)

        [backBtn, suzyCameraSwitchBtnSuzy,suzySpacerSuzy, suzyAertionUserInfoSuzy].forEach {
            $0.tintColor = .white
            $0.translatesAutoresizingMaskIntoConstraints = false
            suzyControlWrapperSuzy.addArrangedSubview($0)
            
        }
        let widthConstraint = suzyAertionUserInfoSuzy.widthAnchor.constraint(equalToConstant: 140)
        widthConstraint.priority = .required
        widthConstraint.isActive = true
        NSLayoutConstraint.activate([
            suzyControlWrapperSuzy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            suzyControlWrapperSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            suzyControlWrapperSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            suzyCameraSwitchBtnSuzy.heightAnchor.constraint(equalToConstant: 40),
            suzyCameraSwitchBtnSuzy.widthAnchor.constraint(equalToConstant: 40),
            backBtn.widthAnchor.constraint(equalToConstant: 30),
            suzyAertionUserInfoSuzy.heightAnchor.constraint(equalToConstant: 40),
            suzyAertionUserInfoSuzy.widthAnchor.constraint(equalToConstant: 140)
            
        ])
       
    }
    
    @objc func funcbuildCafff()  {
        guard let target = self.targetUser else {
            return
        }
        let calddvc = SuzyClipboardSessionVCSuzy.init(suzyAertiony: target)
        calddvc.protrShow = {
            let vc = SuzyGoldShopVCSuzy()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        calddvc.modalPresentationStyle = .fullScreen
        self.present(calddvc, animated: true)
    }

    private func setupTableView() {
        suzyChatTableSuzy.backgroundColor = .clear
        suzyChatTableSuzy.separatorStyle = .none
        suzyChatTableSuzy.delegate = self
        suzyChatTableSuzy.dataSource = self
        suzyChatTableSuzy.register(SuzyChatBubbleCell.self, forCellReuseIdentifier: "BubbleCell")
        suzyChatTableSuzy.keyboardDismissMode = .interactive
        let suzyTapToDismissSuzy = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
            suzyTapToDismissSuzy.cancelsTouchesInView = false // 确保不影响 Cell 点击
            view.addGestureRecognizer(suzyTapToDismissSuzy)
        
        view.addSubview(suzyChatTableSuzy)
        suzyChatTableSuzy.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            suzyChatTableSuzy.topAnchor.constraint(equalTo: suzyControlWrapperSuzy.bottomAnchor,constant: 42),
            suzyChatTableSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            suzyChatTableSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            suzyChatTableSuzy.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70)
        ])
    }

    private func setupInputBar() {
        inputBar.backgroundColor = UIColor(white: 0.1, alpha: 1)
        inputBar.layer.cornerRadius = 25
        
        textField.backgroundColor = .clear
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Say hi...", attributes: [.foregroundColor: UIColor.gray])
        
        sendButton.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        sendButton.tintColor = .white
        sendButton.backgroundColor = .systemPurple
        sendButton.layer.cornerRadius = 20
        sendButton.addTarget(self, action: #selector(sendAction), for: .touchUpInside)
        suzyInputBarBottomConstraintSuzy = inputBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        view.addSubview(inputBar)
        inputBar.addSubview(textField)
        inputBar.addSubview(sendButton)
        
        inputBar.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
         
            
            inputBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            inputBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            suzyInputBarBottomConstraintSuzy,
            inputBar.heightAnchor.constraint(equalToConstant: 50),
            
            textField.leadingAnchor.constraint(equalTo: inputBar.leadingAnchor, constant: 20),
            textField.centerYAnchor.constraint(equalTo: inputBar.centerYAnchor),
            textField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -10),
            
            sendButton.trailingAnchor.constraint(equalTo: inputBar.trailingAnchor, constant: -5),
            sendButton.centerYAnchor.constraint(equalTo: inputBar.centerYAnchor),
            sendButton.widthAnchor.constraint(equalToConstant: 40),
            sendButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }


    @objc private func sendAction() {
        guard let text = textField.text, !text.isEmpty else {
            SuzyHudManagerSuzy.shared.suzyShowToastSuzy(message: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "TtzGbekkqYWULNQFmmuv847Twpd28s1LGiRW3PgV3K4ZTrq6kQfUsCS7Huk5WlCS/GlP1S2v0AufNgoWG7ldIQ=="), isSuccess: false)
            return
        }
      
        let newMessage = SuzyChatDetailRecord(isMine: true, content: .text(text), time: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "lu3RRG7BBqbR1rRJtMGHqhx8D9QCOCnG+AH4gKnoBGrrw3s="))
        chatHistory.append(newMessage)
        
      
        updateLocalCache(with: newMessage)
        
      
        textField.text = ""
        suzyChatTableSuzy.reloadData()
        scrollToBottom()
    }
    
    private func updateLocalCache(with msg: SuzyChatDetailRecord) {
        if let index = SuzyMessageCacheManager.shared.conversations.firstIndex(where: { $0.userInfo.suzyIdentifierSuzy == targetUser?.suzyIdentifierSuzy }) {
            SuzyMessageCacheManager.shared.conversations[index].messages.append(msg)
        }else{
            guard let targetu = self.targetUser else {
                return
            }
            SuzyMessageCacheManager.shared.conversations.insert(SuzyConversationModel.init(userInfo:targetu , unreadCount: 0, messages: chatHistory), at: 0)
        }
    }

    @objc private func showReportMenu() {
        let actionreport = SuzyActioningSheetVCSuzy()
        actionreport.pathUID = targetUser?.suzyIdentifierSuzy
        actionreport.modalPresentationStyle = .fullScreen
        self.present(actionreport, animated: true)
    }

    @objc private func backAction() { navigationController?.popViewController(animated: true) }
    
    private func scrollToBottom() {
        if chatHistory.count > 0 {
            suzyChatTableSuzy.scrollToRow(at: IndexPath(row: chatHistory.count - 1, section: 0), at: .bottom, animated: true)
        }
    }
    
   
    @objc func keyboardWillShow(n: Notification) {
       
        guard let userInfo = n.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
              let curveValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int else { return }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height
        let suzySafeBottom = view.safeAreaInsets.bottom
     
        suzyInputBarBottomConstraintSuzy.constant = -(keyboardHeight - suzySafeBottom)
        
      
        let curve = UIView.AnimationOptions(rawValue: UInt(curveValue << 16))
        UIView.animate(withDuration: duration, delay: 0, options: [curve, .beginFromCurrentState], animations: {
            self.view.layoutIfNeeded()
            
            self.suzyScrollToBottomSuzy(animated: false)
        }, completion: nil)
    }

    @objc func keyboardWillHide(n: Notification) {
        guard let userInfo = n.userInfo,
              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
              let curveValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int else { return }
        
  
        suzyInputBarBottomConstraintSuzy.constant = -5
        
      
        let curve = UIView.AnimationOptions(rawValue: UInt(curveValue << 16))
            UIView.animate(withDuration: duration, delay: 0, options: [curve, .beginFromCurrentState], animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
    }

  
    private func suzyScrollToBottomSuzy(animated: Bool) {
        
        let rowCount = suzyChatTableSuzy.numberOfRows(inSection: 0)
        if rowCount > 0 {
            let indexPath = IndexPath(row: rowCount - 1, section: 0)
            suzyChatTableSuzy.scrollToRow(at: indexPath, at: .bottom, animated: animated)
        }
    }
}


extension SuzyChatDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return chatHistory.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BubbleCell", for: indexPath) as! SuzyChatBubbleCell
        let msg = chatHistory[indexPath.row]
        cell.configure(msg: msg, genderImg: (targetUser?.suzyGenderSuzy == 0) ? "respectfulSpaceSuzy" : "confidentUserSuue")
        return cell
    }
}
