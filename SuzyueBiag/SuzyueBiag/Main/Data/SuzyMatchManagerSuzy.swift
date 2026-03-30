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
    
    
    func suzyGetRemainingFreeMatchesSuzy() -> Int {
        suzyCheckAndResetDailyCountSuzy()
        let used = UserDefaults.standard.integer(forKey: suzyLimitKeySuzy)
        return max(0, 3 - used)
    }
   
    func suzyIncrementMatchCountSuzy() {
        let current = UserDefaults.standard.integer(forKey: suzyLimitKeySuzy)
        UserDefaults.standard.set(current + 1, forKey: suzyLimitKeySuzy)
    }
    
  
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
           
            return "\(remaining)" + SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "Qacl8GVluE3e+NC779grcIcyMTLYV3YSXCd15SsoKVALKHOih3OMOI3odW6O3WYLH1SatH5RjBpm4k41Bmc94reVvSrHRix4lWp8uVhU+A2AHGe6SQ0=")
        } else {
            
            return SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "XVeVjpYtnoxP96qYlT4WuztLJPNk6IdGi/ZGtndg3kmZELMq0ScDWjtBWvBt0MO9z0OrpCkxhP11AMWs4SflRlZ+JwHxhwPH7ZguhRjooZqVUcEAK9xG")
        }
    }
}
