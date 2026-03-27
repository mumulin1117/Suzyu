//
//  SuzyMatchManagerSuzy.swift
//  SuzyueBiag
//
//  Created by SuzyueBiag on 2026/3/26.
//

import UIKit
final class SuzyMatchManagerSuzy {
    static let shared = SuzyMatchManagerSuzy()
    
    private let suzyLimitKeySuzy = "suzy_daily_match_count_key"
    private let suzyDateKeySuzy = "suzy_last_match_date_key"
    
    // 获取今日剩余免费次数
    func suzyGetRemainingFreeMatchesSuzy() -> Int {
        suzyCheckAndResetDailyCountSuzy()
        let used = UserDefaults.standard.integer(forKey: suzyLimitKeySuzy)
        return max(0, 3 - used)
    }
    
    // 记录一次匹配
    func suzyIncrementMatchCountSuzy() {
        let current = UserDefaults.standard.integer(forKey: suzyLimitKeySuzy)
        UserDefaults.standard.set(current + 1, forKey: suzyLimitKeySuzy)
    }
    
    // 跨天重置逻辑
    private func suzyCheckAndResetDailyCountSuzy() {
        let today = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)
        let lastDate = UserDefaults.standard.string(forKey: suzyDateKeySuzy) ?? ""
        
        if today != lastDate {
            UserDefaults.standard.set(today, forKey: suzyDateKeySuzy)
            UserDefaults.standard.set(0, forKey: suzyLimitKeySuzy)
        }
    }
}
extension SuzyMatchManagerSuzy {
    func suzyGetCurrentMatchTipSuzy() -> String {
        let remaining = suzyGetRemainingFreeMatchesSuzy()
        if remaining > 0 {
            // 还有免费次数
            return "\(remaining) free daily Interest matches left. Then 20 coins each."
        } else {
            // 免费已耗尽
            return "0 free left. 20 coins to match.Are you sure to consume?"
        }
    }
}
