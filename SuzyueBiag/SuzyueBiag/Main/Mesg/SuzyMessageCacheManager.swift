//
//  SuzyMessageCacheManager.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/25.
//

import Foundation
enum SuzyMessageType {
    case text(String)
    case call(duration: String)
}
// 聊天记录模型保持不变
struct SuzyChatDetailRecord {
    let isMine: Bool
    let content: SuzyMessageType
    let time: String
}

// 修改后的对话模型：直接持有用户实体
struct SuzyConversationModel {
    let userInfo: SuzyMatchEntitySuzy  // 替换为你的用户实体
    var unreadCount: Int
    var messages: [SuzyChatDetailRecord]
    
    // 快捷访问属性
    var lastTime: String {
        return messages.last?.time ?? ""
    }
    
    var lastMessage: String {
        guard let last = messages.last else { return "" }
        switch last.content {
        case .text(let txt): return txt
        case .call: return "[Voice Call]"
        }
    }
}

class SuzyMessageCacheManager {
    static let shared = SuzyMessageCacheManager()
    
    var conversations: [SuzyConversationModel] = []

}
