//
//  SuzyPermissionManagerSuzy.swift
//  SuzyueBiag
//
//  Created by mumu on 2026/3/27.
//

import AVFoundation
import UIKit

final class SuzyPermissionManagerSuzy {
    
    static let shared = SuzyPermissionManagerSuzy()
    private init() {}
    
    /// 检查并请求相机权限
    /// - Parameters:
    ///   - completion: 授权结果回调 (Bool 代表是否允许)
    func suzyRequestCameraAccessSuzy(completion: @escaping (Bool) -> Void) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch status {
        case .authorized:
            completion(true)
            
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    completion(granted)
                }
            }
            
        case .denied, .restricted:
            completion(false)
            
        @unknown default:
            completion(false)
        }
    }
    
    /// 弹出引导去设置页面的 Alert
    /// - Parameter vc: 当前控制器
    func suzyShowCameraDeniedAlertSuzy(on vc: UIViewController) {
        let alert = UIAlertController(
            title: "Camera Access Required",
            message: "Please enable camera access in Settings to proceed with identity verification.",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Settings", style: .default) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        })
        
        vc.present(alert, animated: true)
    }
}
