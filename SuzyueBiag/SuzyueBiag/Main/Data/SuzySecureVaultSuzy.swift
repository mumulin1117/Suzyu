//
//  SuzySecureVaultSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/19.
//

import UIKit
import AuthenticationServices
import Security

import Foundation

struct SuzyUserProfileSuzy: Codable {
    let suzyUidSuzy: String
    var suzyGenderSuzy: Int
    let suzyAgeSuzy: Int
     
    var suzyUsername:String 
    
    var suzyTagsSuzy: [String]
    var suzyBioSuzy: String
    var deseriali: Int
    var suzyIsVerifiedSuzy: Bool
    let suzyRegTimestampSuzy: Double
}
import Foundation
import Security

// MARK: - NativeKeychainWrapperSuzy
final class SuzySecureVaultSuzy {
    static let sharedSuzy = SuzySecureVaultSuzy()
    static var suzyProfileKeySuzy = "com.suzy.auth.identifierSuzy"
   
    func suzyInitializeIdentitySuzy(profileSuzy: SuzyUserProfileSuzy) {
        do {
            let suzyDataSuzy = try JSONEncoder().encode(profileSuzy)
            storeSecretSuzy(dataSuzy: suzyDataSuzy, accountSuzy: SuzySecureVaultSuzy.suzyProfileKeySuzy)
            
            UserDefaults.standard.set(true, forKey: "SuzyIsUserRegisteredSuzy")
        } catch {
            print("Suzy: Encoding failed respectfully.")
        }
    }
    
    
    func suzyFetchCurrentProfileSuzy() -> SuzyUserProfileSuzy? {
        guard let suzyDataSuzy = retrieveSecretSuzy(accountSuzy: SuzySecureVaultSuzy.suzyProfileKeySuzy) else { return nil }
        return try? JSONDecoder().decode(SuzyUserProfileSuzy.self, from: suzyDataSuzy)
    }
    
    
    func suzyUpdateMutableAttributesSuzy(newBioSuzy: String? = nil, newTagsSuzy: [String]? = nil, DeserialSuzy: Int = 0,gender:Int = 0,usersuzyName:String? = nil) {
        guard var suzyCurrentSuzy = suzyFetchCurrentProfileSuzy() else { return }
        
      
        if let bioSuzy = newBioSuzy { suzyCurrentSuzy.suzyBioSuzy = bioSuzy }
        if let tagsSuzy = newTagsSuzy { suzyCurrentSuzy.suzyTagsSuzy = tagsSuzy }
        if let nameSuzy = usersuzyName { suzyCurrentSuzy.suzyUsername = nameSuzy  }
        suzyCurrentSuzy.suzyGenderSuzy = gender
       
        suzyCurrentSuzy.deseriali += DeserialSuzy
        
       
        suzyInitializeIdentitySuzy(profileSuzy: suzyCurrentSuzy)
    }

    // MARK: - Internal Low Level Operations
    
    func storeSecretSuzy(dataSuzy: Data, accountSuzy: String) {
        let querySuzy: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: accountSuzy,
            kSecValueData as String: dataSuzy,
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
        ]
        SecItemDelete(querySuzy as CFDictionary)
        SecItemAdd(querySuzy as CFDictionary, nil)
    }
    
    func retrieveSecretSuzy(accountSuzy: String) -> Data? {
        let querySuzy: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: accountSuzy,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        var resultSuzy: AnyObject?
        SecItemCopyMatching(querySuzy as CFDictionary, &resultSuzy)
        return resultSuzy as? Data
    }
    
    // MARK: - Account Destruction & Logout Suzy
        
   
    func suzyDeconstructLoginSessionSuzy(completionSuzy: (() -> Void)? = nil) {
 
        UserDefaults.standard.set(false, forKey: "SuzyIsUserRegisteredSuzy")
        UserDefaults.standard.removeObject(forKey: "SuzyIsUserRegisteredSuzy")
        
        UserDefaults.standard.synchronize()
        
        SuzyMessageCacheManager.shared.conversations.removeAll()
        
        DispatchQueue.main.async {
            completionSuzy?()
        }
        
    }
    func suzyExecutePermanentAccountDestructionSuzy(completionSuzy: ((Bool) -> Void)? = nil ) {
      
        let suzyLogoutQuerySuzy: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: SuzySecureVaultSuzy.suzyProfileKeySuzy
        ]
        
      
        let suzyStatusSuzy = SecItemDelete(suzyLogoutQuerySuzy as CFDictionary)
        
        if suzyStatusSuzy == errSecSuccess || suzyStatusSuzy == errSecItemNotFound {
           
        }
        
       
        self.suzyDeconstructLoginSessionSuzy {
           
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                completionSuzy?(true)
            }
        }
        
    }
}


extension SuzySecureVaultSuzy {
   
    func suzyIsProfileCompletedSuzy() -> Bool {
        guard let profile = self.suzyGetSavedProfileSuzy() else { return false }
       
        return profile.suzyGenderSuzy != nil && profile.suzyAgeSuzy > 0
    }
   
    func suzyGetSavedProfileSuzy() -> SuzyUserProfileSuzy? {
        guard let suzyDataSuzy = retrieveSecretSuzy(accountSuzy: SuzySecureVaultSuzy.suzyProfileKeySuzy) else {
                return nil
            }
            return try? JSONDecoder().decode(SuzyUserProfileSuzy.self, from: suzyDataSuzy)
    }
}
