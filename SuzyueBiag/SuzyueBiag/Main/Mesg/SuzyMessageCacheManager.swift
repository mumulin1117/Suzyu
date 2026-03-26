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

//    private init() {
//        setupMockData()
//    }

//    private func setupMockData() {
        // 模拟两个用户实体
//       if let user1 = SuzyStaticDataCenterSuzy.suzyMockUserLibrarySuzy.first,
//          let user2 = SuzyStaticDataCenterSuzy.suzyMockUserLibrarySuzy.last{
//           
            // 组装对话列表
//            self.conversations = [
//                SuzyConversationModel(
//                    userInfo: user1,
//                    unreadCount: 1,
//                    messages: [
//                        SuzyChatDetailRecord(isMine: false, content: .text("How do you do today?"), time: "10:31AM")
//                    ]
//                ),
//                SuzyConversationModel(
//                    userInfo: user2,
//                    unreadCount: 0,
//                    messages: [
//                        SuzyChatDetailRecord(isMine: false, content: .call(duration: "02:15"), time: "10:31AM")
//                    ]
//                )
//            ]
//       }
        
       
//    }
}
