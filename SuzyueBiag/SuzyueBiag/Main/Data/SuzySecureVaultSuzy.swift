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
    let suzyUidSuzy: String           // 不可变
    var suzyGenderSuzy: Int
    let suzyAgeSuzy: Int              // 不可变
       // 可变
    var suzyUsername:String 
    
    var suzyTagsSuzy: [String]        // 可变
    var suzyBioSuzy: String       //about self
    var suzyCoinsSuzy: Int            // 可变 (新增金币字段)
    var suzyIsVerifiedSuzy: Bool      // 可变
    let suzyRegTimestampSuzy: Double  // 不可变
}
import Foundation
import Security

// MARK: - NativeKeychainWrapperSuzy
final class SuzySecureVaultSuzy {
    static let sharedSuzy = SuzySecureVaultSuzy()
    static let suzyProfileKeySuzy = "com.suzy.auth.identifierSuzy"
    
    // --- 初始注册永久存储 ---
    func suzyInitializeIdentitySuzy(profileSuzy: SuzyUserProfileSuzy) {
        do {
            let suzyDataSuzy = try JSONEncoder().encode(profileSuzy)
            storeSecretSuzy(dataSuzy: suzyDataSuzy, accountSuzy: SuzySecureVaultSuzy.suzyProfileKeySuzy)
            // 标记注册状态
            UserDefaults.standard.set(true, forKey: "SuzyIsUserRegisteredSuzy")
        } catch {
            print("Suzy: Encoding failed respectfully.")
        }
    }
    
    // --- 获取用户信息 ---
    func suzyFetchCurrentProfileSuzy() -> SuzyUserProfileSuzy? {
        guard let suzyDataSuzy = retrieveSecretSuzy(accountSuzy: SuzySecureVaultSuzy.suzyProfileKeySuzy) else { return nil }
        return try? JSONDecoder().decode(SuzyUserProfileSuzy.self, from: suzyDataSuzy)
    }
    
    // --- 更新可变信息 (金币/Bio/Tags) ---
    func suzyUpdateMutableAttributesSuzy(newBioSuzy: String? = nil, newTagsSuzy: [String]? = nil, deltaCoinsSuzy: Int = 0,gender:Int = 0,usersuzyName:String? = nil) {
        guard var suzyCurrentSuzy = suzyFetchCurrentProfileSuzy() else { return }
        
        // 仅修改允许变动的字段
        if let bioSuzy = newBioSuzy { suzyCurrentSuzy.suzyBioSuzy = bioSuzy }
        if let tagsSuzy = newTagsSuzy { suzyCurrentSuzy.suzyTagsSuzy = tagsSuzy }
        if let nameSuzy = usersuzyName { suzyCurrentSuzy.suzyUsername = nameSuzy  }
        suzyCurrentSuzy.suzyGenderSuzy = gender
        // 金币增减逻辑
        suzyCurrentSuzy.suzyCoinsSuzy += deltaCoinsSuzy
        
        // 重新封存，不影响 UID、性别和年龄
        suzyInitializeIdentitySuzy(profileSuzy: suzyCurrentSuzy)
    }

    // MARK: - Internal Low Level Operations
    
    func storeSecretSuzy(dataSuzy: Data, accountSuzy: String) {
        let querySuzy: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: accountSuzy,
            kSecValueData as String: dataSuzy,
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock // 保证后台也能读取
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
        
        /// 退出登录：
    func suzyDeconstructLoginSessionSuzy(completionSuzy: (() -> Void)? = nil) {
        // 1. 重置本地持久化状态位（不触动 Keychain）
        UserDefaults.standard.set(false, forKey: "SuzyIsUserRegisteredSuzy")
        UserDefaults.standard.removeObject(forKey: "SuzyIsUserRegisteredSuzy")
        
        UserDefaults.standard.synchronize()
        
        // 2. 清理即时通讯缓存
        SuzyMessageCacheManager.shared.conversations.removeAll()
        
        print("Suzy: Login session invalidated. Keychain remains intact.")
        
        DispatchQueue.main.async {
            completionSuzy?()
        }
        
    }
    func suzyExecutePermanentAccountDestructionSuzy(completionSuzy: ((Bool) -> Void)? = nil ) {
        // 1. 定义 Keychain 查询字典
        let suzyLogoutQuerySuzy: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: SuzySecureVaultSuzy.suzyProfileKeySuzy
        ]
        
        // 2. 从系统 Keychain 中物理移除加密数据
        let suzyStatusSuzy = SecItemDelete(suzyLogoutQuerySuzy as CFDictionary)
        
        if suzyStatusSuzy == errSecSuccess || suzyStatusSuzy == errSecItemNotFound {
            print("Suzy: Keychain identity has been permanently dissolved.")
        }
        
        // 3. 调用登出清理逻辑重置所有状态位
        self.suzyDeconstructLoginSessionSuzy {
            // 模拟服务器响应延迟
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                completionSuzy?(true)
            }
        }
        
    }
}
