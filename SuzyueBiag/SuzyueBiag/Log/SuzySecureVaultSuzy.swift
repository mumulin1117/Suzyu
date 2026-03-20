//
//  SuzySecureVaultSuzy.swift
//  SuzyueBiag
//
//  Created by mumu on 2026/3/19.
//

import UIKit
import AuthenticationServices
import Security

import Foundation

struct SuzyUserProfileSuzy: Codable {
    let suzyUidSuzy: String           // 不可变
    let suzyGenderSuzy: String        // 不可变
    let suzyAgeSuzy: Int              // 不可变
       // 可变
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
    static let suzyGuestFlagSuzy = "com.suzy.status.isGuestSuzy"
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
    func suzyUpdateMutableAttributesSuzy(newBioSuzy: String? = nil, newTagsSuzy: [String]? = nil, deltaCoinsSuzy: Int = 0) {
        guard var suzyCurrentSuzy = suzyFetchCurrentProfileSuzy() else { return }
        
        // 仅修改允许变动的字段
        if let bioSuzy = newBioSuzy { suzyCurrentSuzy.suzyBioSuzy = bioSuzy }
        if let tagsSuzy = newTagsSuzy { suzyCurrentSuzy.suzyTagsSuzy = tagsSuzy }
        
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
        
        /// 退出登录：彻底清除 Keychain 存储和本地注册标记
    func suzyDeconstructAccountSuzy(completionSuzy: (() -> Void)? = nil) {
        // 1. 定义查找该账号的查询字典
        let suzyLogoutQuerySuzy: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: SuzySecureVaultSuzy.suzyProfileKeySuzy
        ]
        
        // 2. 从系统 Keychain 中移除加密数据
        let suzyStatusSuzy = SecItemDelete(suzyLogoutQuerySuzy as CFDictionary)
        
        if suzyStatusSuzy == errSecSuccess || suzyStatusSuzy == errSecItemNotFound {
            print("Suzy: Keychain identity has been successfully dissolved.")
        } else {
            print("Suzy: Logout encountered a non-fatal status: \(suzyStatusSuzy)")
        }
        
        // 3. 重置本地持久化状态位
        // 确保下次启动 App 时能重新进入 Onboarding 流程
        UserDefaults.standard.set(false, forKey: "SuzyIsUserRegisteredSuzy")
        UserDefaults.standard.removeObject(forKey: "SuzyIsUserRegisteredSuzy") // 彻底移除键
        UserDefaults.standard.synchronize()
        
        UserDefaults.standard.set(false, forKey: SuzySecureVaultSuzy.suzyGuestFlagSuzy)
       
        // 5. 执行回调（通常用于跳转回登录/注册页面）
        DispatchQueue.main.async {
            completionSuzy?()
        }
        
    }
}
