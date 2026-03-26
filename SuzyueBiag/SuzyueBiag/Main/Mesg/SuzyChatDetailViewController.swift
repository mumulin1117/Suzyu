//
//  SuzyChatDetailViewController.swift
//  SuzyueBiag
//
//  Created by mumu on 2026/3/25.
//

import UIKit

class SuzyChatDetailViewController: UIViewController {
    
    // 数据源
    var targetUser: SuzyMatchEntitySuzy?
    var chatHistory: [SuzyChatDetailRecord] = []
    
    // UI 组件
    private let tableView = UITableView()
    private let inputBar = UIView()
    private let textField = UITextField()
    private let sendButton = UIButton()
    
    private let suzyControlWrapperSuzy = UIStackView()
    private let suzyCameraSwitchBtnSuzy = UIButton(type: .custom)
   
    private let suzyMatchedUserInfoSuzy = UIButton(type: .custom)
    private let suzyFallbackBgImageViewSuzy: UIImageView = {
        let iv = UIImageView.init(frame: UIScreen.main.bounds)
        iv.image = UIImage(named: "SuzyWelcomeBgSuzyELUA@")
        iv.contentMode = .scaleAspectFill
       
        return iv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(suzyFallbackBgImageViewSuzy)
        NotificationCenter.default.addObserver(self, selector: #selector(backAction), name: NSNotification.Name("SuzySwitchToReportDetails"), object: nil)
        setupNavigation()
        setupTableView()
        setupInputBar()
        
        // 监听键盘，防止遮挡输入框
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
 

    private func setupNavigation() {
        suzyControlWrapperSuzy.axis = .horizontal
        suzyControlWrapperSuzy.spacing = 15
        
        suzyControlWrapperSuzy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(suzyControlWrapperSuzy)
        // 左侧返回
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        backBtn.tintColor = .white
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
      
 
        let suzySpacerSuzy = UIView()
            suzySpacerSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzySpacerSuzy.setContentHuggingPriority(.init(1), for: .horizontal)
        suzyCameraSwitchBtnSuzy.setImage(UIImage(named: "calcaremaifl"), for: .normal)
        suzyCameraSwitchBtnSuzy.addTarget(self, action: #selector(funcbuildCafff), for: .touchUpInside)
        
        suzyMatchedUserInfoSuzy.addTarget(self, action: #selector(showReportMenu), for: .touchUpInside)
        suzyMatchedUserInfoSuzy.setTitle(targetUser?.suzyUsernameSuzy, for: .normal)
        suzyMatchedUserInfoSuzy.titleLabel?.font = .systemFont(ofSize: 12)
        suzyMatchedUserInfoSuzy.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2500)
        suzyMatchedUserInfoSuzy.layer.cornerRadius = 10
        suzyMatchedUserInfoSuzy.setImage(UIImage(named: "exclamationmark"), for: .normal)
        suzyMatchedUserInfoSuzy.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
      
            
        suzyMatchedUserInfoSuzy.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)

        [backBtn, suzyCameraSwitchBtnSuzy,suzySpacerSuzy, suzyMatchedUserInfoSuzy].forEach {
            $0.tintColor = .white
            $0.translatesAutoresizingMaskIntoConstraints = false
            suzyControlWrapperSuzy.addArrangedSubview($0)
            
        }
        let widthConstraint = suzyMatchedUserInfoSuzy.widthAnchor.constraint(equalToConstant: 140)
        widthConstraint.priority = .required
        widthConstraint.isActive = true
        NSLayoutConstraint.activate([
            suzyControlWrapperSuzy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            suzyControlWrapperSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            suzyControlWrapperSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            suzyCameraSwitchBtnSuzy.heightAnchor.constraint(equalToConstant: 40),
            suzyCameraSwitchBtnSuzy.widthAnchor.constraint(equalToConstant: 40),
            backBtn.widthAnchor.constraint(equalToConstant: 30),
            suzyMatchedUserInfoSuzy.heightAnchor.constraint(equalToConstant: 40),
            suzyMatchedUserInfoSuzy.widthAnchor.constraint(equalToConstant: 140)
            
        ])
       
    }
    
    @objc func funcbuildCafff()  {
        
    }

    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SuzyChatBubbleCell.self, forCellReuseIdentifier: "BubbleCell")
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: suzyControlWrapperSuzy.bottomAnchor,constant: 42),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70)
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
        
        view.addSubview(inputBar)
        inputBar.addSubview(textField)
        inputBar.addSubview(sendButton)
        
        inputBar.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
         
            
            inputBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            inputBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            inputBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
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

    // MARK: - Actions
    
    @objc private func sendAction() {
        guard let text = textField.text, !text.isEmpty else { return }
        
        // 存储消息逻辑
        let newMessage = SuzyChatDetailRecord(isMine: true, content: .text(text), time: "Now")
        chatHistory.append(newMessage)
        
        // 更新缓存数据源 (同步回 MessageList)
        updateLocalCache(with: newMessage)
        
        // 刷新 UI
        textField.text = ""
        tableView.reloadData()
        scrollToBottom()
    }
    
    private func updateLocalCache(with msg: SuzyChatDetailRecord) {
        if let index = SuzyMessageCacheManager.shared.conversations.firstIndex(where: { $0.userInfo.suzyIdentifierSuzy == targetUser?.suzyIdentifierSuzy }) {
            SuzyMessageCacheManager.shared.conversations[index].messages.append(msg)
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
            tableView.scrollToRow(at: IndexPath(row: chatHistory.count - 1, section: 0), at: .bottom, animated: true)
        }
    }
    
    // 键盘处理 (略...)
    @objc func keyboardWillShow(n: Notification) { /* 调整 inputBar 约束 */ }
    @objc func keyboardWillHide(n: Notification) { /* 还原 inputBar 约束 */ }
}

// MARK: - TableView Delegate
extension SuzyChatDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return chatHistory.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BubbleCell", for: indexPath) as! SuzyChatBubbleCell
        let msg = chatHistory[indexPath.row]
        cell.configure(msg: msg, genderImg: (targetUser?.suzyGenderSuzy == 0) ? "respectfulSpaceSuzy" : "confidentUserSuue")
        return cell
    }
}
