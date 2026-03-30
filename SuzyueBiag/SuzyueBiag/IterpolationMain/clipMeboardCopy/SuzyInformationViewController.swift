//
//  SuzyInformationViewController.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/25.
//

import UIKit

class SuzyInformationViewController: UIViewController {
    private lazy var suzyEmptyViewSuzy: UIView = {
        let view = UIView()
        view.isHidden = true
      
        let icon = UIImageView(image: UIImage(systemName: "message.circle"))
        icon.tintColor = .darkGray
        icon.contentMode = .scaleAspectFit
        
        let label = UILabel()
        label.text = SuzyArtToyVibeEngine.suzyredoStackSuue(stateMachineSuzy: "5jWwFIO2Zz1yzBFxIIaty4OAW0WT7BVFyhSFRtTTEvHn3aclihe4TXGLxA==")
        label.textColor = .gray
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        
        [icon, label].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            icon.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            icon.widthAnchor.constraint(equalToConstant: 80),
            icon.heightAnchor.constraint(equalToConstant: 80),
            
            label.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 15),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        return view
    }()
    private let tableView = UITableView()
    private var dataSource :[SuzynoisetionModel]  = [SuzynoisetionModel]()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        suzyBuildReportInterfaceSuzy()
        setupNavigation()
        setupTableView()
        view.addSubview(suzyEmptyViewSuzy)
            suzyEmptyViewSuzy.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                suzyEmptyViewSuzy.topAnchor.constraint(equalTo: tableView.topAnchor),
                suzyEmptyViewSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                suzyEmptyViewSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                suzyEmptyViewSuzy.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
            ])
        NotificationCenter.default.addObserver(self, selector: #selector(suzyRefreshDataStatusSuzy), name: NSNotification.Name("SuzySwitchToReportDetails"), object: nil)
        suzyRefreshDataStatusSuzy()
    }
    @objc func suzyRefreshDataStatusSuzy() {
        let isEmpty = SuzynoiseCacheManager.shared.conversations.isEmpty
        
        // 如果为空，显示占位图，隐藏列表
        suzyEmptyViewSuzy.isHidden = !isEmpty
        tableView.isHidden = isEmpty
        
        if !isEmpty {
            self.dataSource = SuzynoiseCacheManager.shared.conversations
            tableView.reloadData()
        }
    }
   
    let shaninfoLabel = UILabel.init()
    
    let backBtn = UIButton(type: .custom)
    private let suzyFallbackBgImageViewSuzy: UIImageView = {
        let iv = UIImageView.init(frame: UIScreen.main.bounds)
        iv.image = SuzyArtToyVibeEngine.suzyfilterApplySuzy(assetManagerSuue: "SuzyWelcomeBgSuzyELUA")
        iv.contentMode = .scaleAspectFill
       
        return iv
    }()
    private func suzyBuildReportInterfaceSuzy() {
        view.addSubview(suzyFallbackBgImageViewSuzy)
       
    }

    private func setupNavigation() {
        shaninfoLabel.text = "Information"
        shaninfoLabel.textColor = .white
        shaninfoLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        shaninfoLabel.textAlignment = .center
        shaninfoLabel.translatesAutoresizingMaskIntoConstraints = false
        backBtn.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        backBtn.tintColor = .white
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backBtn)
        view.addSubview(shaninfoLabel)
    }

    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SuzyMessageListCell.self, forCellReuseIdentifier: "SuzyMessageListCell")
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            backBtn.widthAnchor.constraint(equalToConstant: 25),
            backBtn.heightAnchor.constraint(equalToConstant: 30),
            backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            shaninfoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shaninfoLabel.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor),
            tableView.topAnchor.constraint(equalTo: backBtn.bottomAnchor,constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    @objc private func backAction() {
        navigationController?.popViewController(animated: true)
    }
}

extension SuzyInformationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SuzyMessageListCell", for: indexPath) as! SuzyMessageListCell
        cell.configure(with: dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let detailVC = SuzymagneticDetailViewController()
        detailVC.targetUser = dataSource[indexPath.row].userInfo
        detailVC.chatHistory = dataSource[indexPath.row].noiseloi
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
