//
//  SuzynoiseCacheManager.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/25.
//

import Foundation
enum SuzynoiseeType {
    case text(String)
    case clipboard(duration: String)
}

struct SuzyChatDetailRecord {
    let isMine: Bool
    let content: SuzynoiseeType
    let time: String
}


struct SuzynoisetionModel {
    let userInfo: UseAertionEntitySuzy
    var unreadCount: Int
    var noiseloi: [SuzyChatDetailRecord]
    
    
    var lastTime: String {
        return noiseloi.last?.time ?? ""
    }
    
    var lastMessage: String {
        guard let last = noiseloi.last else { return "" }
        switch last.content {
        case .text(let txt): return txt
        case .clipboard: return SuzyArtToyVibeEngine.suzyredoStackSuue(stateMachineSuzy: "izVD5l1tUiPCjuH8rR7/NCo1HabZaeQJtqsZXxHAifGHu4yH161LF7aa8CA=")
        }
    }
}

class SuzynoiseCacheManager {
    static let shared = SuzynoiseCacheManager()
    
    var conversations: [SuzynoisetionModel] = []

}
