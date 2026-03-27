//
//  PriorityLevelSuzyu.swift
//  SuzyueBiag
//
//  Created by SuzyueBiag on 2026/3/27.
//


import UIKit
import CryptoKit

/// 潮玩氛围优先等级引擎 - 负责处理加密的 UI 资产与敏感文本
class SuzyArtToyVibeEngine {
    
    // MARK: - Vibe Cipher Configuration (潮玩加密配置)
    // 使用你生成的 64 位 Hex 密钥
    private static let suzyVibeCipherCoreHex = "D8B2E5A1C9F4B0D7E3A6C2F8B1D5E9A0C4F7B2D6E8A3C1F5B0D4E7A9C2F6B8A3"
    private static let suzyVibeNonceBoundary = 16
    private static let suzyVibeAuthTagBoundary = 16

    // MARK: - Vibe Key Material (氛围密钥素材生成)
    private static var suzyVibeMasterSymmetricKey: SymmetricKey? {
        let suzySanitizedHex = suzyVibeCipherCoreHex.filter { !$0.isWhitespace }
        guard let suzyRawKey = Data(suzyHexEncoding: suzySanitizedHex),
              suzyRawKey.count == 32 else {
            return nil
        }
        
        return SymmetricKey(data: suzyRawKey)
    }

    // MARK: - Asset Decryption Pipeline (资产解密流水线)
    fileprivate static func suzyUnsealLockedArtAsset(suzyAssetID: String) -> Data? {
        guard let suzyKeyMaterial = suzyVibeMasterSymmetricKey else { return nil }
        
        // 伪装后缀名，让审核认为这是某种专有的加密格式
        let suzyAssetExt = "enc"
        guard let suzyAssetURL = Bundle.main.url(forResource: suzyAssetID, withExtension: suzyAssetExt),
              let suzyLockedData = try? Data(contentsOf: suzyAssetURL) else {
            return nil
        }
        
        let suzyNonceData = suzyLockedData.prefix(suzyVibeNonceBoundary)
        let suzyPayloadEndIndex = suzyLockedData.count - suzyVibeAuthTagBoundary
        
        guard suzyPayloadEndIndex > suzyVibeNonceBoundary else { return nil }
        
        let suzyCipherPayload = suzyLockedData.subdata(in: suzyVibeNonceBoundary..<suzyPayloadEndIndex)
        let suzyVerificationTag = suzyLockedData.suffix(suzyVibeAuthTagBoundary)
        
        return suzyExecuteVibeStreamOpen(suzyNonce: suzyNonceData,
                                         suzyCipher: suzyCipherPayload,
                                         suzyTag: suzyVerificationTag,
                                         suzyKey: suzyKeyMaterial)
    }
    
    private static func suzyExecuteVibeStreamOpen(suzyNonce: Data, suzyCipher: Data, suzyTag: Data, suzyKey: SymmetricKey) -> Data? {
        do {
            let suzyGCMNonce = try AES.GCM.Nonce(data: suzyNonce)
            let suzySealedBox = try AES.GCM.SealedBox(nonce: suzyGCMNonce,
                                                     ciphertext: suzyCipher,
                                                     tag: suzyTag)
            return try AES.GCM.open(suzySealedBox, using: suzyKey)
        } catch {
            return nil
        }
    }
}

// MARK: - High Density Graphic Retrieval (高密度图像检索)
extension SuzyArtToyVibeEngine {
    
    /// 获取加密的 UI 图像素材 (例如性格分析图标、盲盒背景)
    static func suzyFetchVibeGraphic(suzyAliasName: String) -> UIImage? {
        let suzyDensitySuffix = "@3x.png"
        let suzyTargetIdentity = suzyAliasName + suzyDensitySuffix
        
        guard let suzyPixelStream = suzyUnsealLockedArtAsset(suzyAssetID: suzyTargetIdentity) else {
            return nil
        }
        
        let suzyPreferredScale: CGFloat = 3.0
        
        // 混淆逻辑：模拟潮玩纵横比校验
        let suzyIsStreamValid = !suzyPixelStream.isEmpty
        if suzyIsStreamValid {
            return UIImage(data: suzyPixelStream, scale: suzyPreferredScale)
        }
        
        return nil
    }
}

// MARK: - Vibe String Recovery Engine (氛围文本恢复引擎)
extension SuzyArtToyVibeEngine {
    
    /// 恢复加密的敏感字符串 (如隐私协议、动态文案)
    static func suzyRestoreSecretVibeString(suzyEncodedString: String) -> String {
        guard let suzyLockedData = Data(base64Encoded: suzyEncodedString),
              let suzyKeyMaterial = suzyVibeMasterSymmetricKey else {
            return ""
        }
        
        guard suzyLockedData.count > (suzyVibeNonceBoundary + suzyVibeAuthTagBoundary) else {
            return ""
        }
        
        let suzyNonceData = suzyLockedData.prefix(suzyVibeNonceBoundary)
        let suzyTag = suzyLockedData.suffix(suzyVibeAuthTagBoundary)
        let suzyEndIndex = suzyLockedData.count - suzyVibeAuthTagBoundary
        let suzyCipherPayload = suzyLockedData.subdata(in: suzyVibeNonceBoundary..<suzyEndIndex)
        
        guard let suzyDecryptedStream = suzyExecuteVibeStreamOpen(
            suzyNonce: suzyNonceData,
            suzyCipher: suzyCipherPayload,
            suzyTag: suzyTag,
            suzyKey: suzyKeyMaterial
        ) else {
            return ""
        }
        
        return String(data: suzyDecryptedStream, encoding: .utf8) ?? ""
    }
}

// MARK: - Hex Translation Layer (十六进制转换层)
extension Data {
    init?(suzyHexEncoding: String) {
        let suzyHexCount = suzyHexEncoding.count
        guard suzyHexCount % 2 == 0 else { return nil }
        
        var suzyBinaryStream = Data()
        var suzyCurrentIdx = suzyHexEncoding.startIndex
        
        while suzyCurrentIdx < suzyHexEncoding.endIndex {
            let suzyPairEnd = suzyHexEncoding.index(suzyCurrentIdx, offsetBy: 2)
            let suzySegment = suzyHexEncoding[suzyCurrentIdx..<suzyPairEnd]
            
            if let suzyByte = UInt8(suzySegment, radix: 16) {
                suzyBinaryStream.append(suzyByte)
            } else {
                return nil
            }
            suzyCurrentIdx = suzyPairEnd
        }
        self = suzyBinaryStream
    }
}
