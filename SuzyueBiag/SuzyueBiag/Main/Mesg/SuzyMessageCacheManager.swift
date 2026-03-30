//
//  SuzyMessageCacheManager.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/25.
//

import Foundation
enum SuzyMessageType {
    case text(String)
    case clipboard(duration: String)
}

struct SuzyChatDetailRecord {
    let isMine: Bool
    let content: SuzyMessageType
    let time: String
}


struct SuzyConversationModel {
    let userInfo: UseAertionEntitySuzy
    var unreadCount: Int
    var messages: [SuzyChatDetailRecord]
    
    
    var lastTime: String {
        return messages.last?.time ?? ""
    }
    
    var lastMessage: String {
        guard let last = messages.last else { return "" }
        switch last.content {
        case .text(let txt): return txt
        case .clipboard: return SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "izVD5l1tUiPCjuH8rR7/NCo1HabZaeQJtqsZXxHAifGHu4yH161LF7aa8CA=")
        }
    }
}

class SuzyMessageCacheManager {
    static let shared = SuzyMessageCacheManager()
    
    var conversations: [SuzyConversationModel] = []

}
