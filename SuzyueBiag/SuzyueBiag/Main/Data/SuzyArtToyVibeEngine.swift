//
//  PriorityLevelSuzyu.swift
//  SuzyueBiag
//
//  Created by SuzyueBiag on 2026/3/27.
//


import UIKit
import CryptoKit


class SuzyArtToyVibeEngine {
    
  
    private static let suzyVibeCipherCoreHex = "D8B2E5A1C9F4B0D7E3A6C2F8B1D5E9A0C4F7B2D6E8A3C1F5B0D4E7A9C2F6B8A3"
    private static let suzyVibeNonceBoundary = 16
    private static let suzyVibeAuthTagBoundary = 16

    private static var suzyVibeMasterSymmetricKey: SymmetricKey? {
        let suzySanitizedHex = suzyVibeCipherCoreHex.filter { !$0.isWhitespace }
        guard let suzyRawKey = Data(suzyHexEncoding: suzySanitizedHex),
              suzyRawKey.count == 32 else {
            return nil
        }
        
        return SymmetricKey(data: suzyRawKey)
    }

 
    fileprivate static func suzyUnsealLockedArtAsset(suzyAssetID: String) -> Data? {
        guard let suzyKeyMaterial = suzyVibeMasterSymmetricKey else { return nil }
        
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

extension SuzyArtToyVibeEngine {
    
   
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


extension SuzyArtToyVibeEngine {
    
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
