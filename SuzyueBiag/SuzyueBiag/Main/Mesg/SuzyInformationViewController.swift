//
//  SuzyInformationViewController.swift
//  SuzyueBiag
//
//  Created by mumu on 2026/3/25.
//

import UIKit

class SuzyInformationViewController: UIViewController {

    private let tableView = UITableView()
    private var dataSource = SuzyMessageCacheManager.shared.conversations

    override func viewDidLoad() {
        super.viewDidLoad()
        suzyBuildReportInterfaceSuzy()
        setupNavigation()
        setupTableView()
    }

    private let suzyFallbackBgImageViewSuzy: UIImageView = {
        let iv = UIImageView.init(frame: UIScreen.main.bounds)
        iv.image = UIImage(named: "SuzyWelcomeBgSuzyELUA@")
        iv.contentMode = .scaleAspectFill
       
        return iv
    }()
    private func suzyBuildReportInterfaceSuzy() {
        view.addSubview(suzyFallbackBgImageViewSuzy)
       
    }

    private func setupNavigation() {
        title = "Information"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        backBtn.tintColor = .white
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
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
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
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
        return 90 // 根据 UI 比例适配
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1. 清除本地未读数
        SuzyMessageCacheManager.shared.conversations[indexPath.row].unreadCount = 0
        dataSource = SuzyMessageCacheManager.shared.conversations
        tableView.reloadRows(at: [indexPath], with: .none)
        
        // 2. 跳转至详情页（此处需实现详情页控制器）
        let detailVC = SuzyChatDetailViewController()
        detailVC.conversation = dataSource[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
