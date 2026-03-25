//
//  SuzyChatDetailViewController.swift
//  SuzyueBiag
//
//  Created by mumu on 2026/3/25.
//

import UIKit

class SuzyChatDetailViewController: UIViewController {
    var conversation: SuzyConversationModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = conversation?.username
        
        // 逻辑实现：
        // 在此处使用另一个 UITableView 展示 conversation.messages 数组中的数据
        // 根据 isMine 属性区分左右气泡展示内容
    }
}
