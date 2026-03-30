//
//  SuzyPermissionManagerSuzy.swift
//  SuzyueBiag
//
//  Created by SuzyueBiag on 2026/3/27.
//

import AVFoundation
import UIKit

final class SuzyPermissionManagerSuzy {
    
    static let shared = SuzyPermissionManagerSuzy()
    private init() {}
    
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
  
    func suzyShowCameraDeniedAlertSuzy(on vc: UIViewController) {
        let alert = UIAlertController(
            title: SuzyArtToyVibeEngine.suzyredoStackSuue(stateMachineSuzy: "FZSQJ9ZpFHFWfOa5rVXU+n9b+7Ez7GDOwaS3LFodEYa6PdQA+Z5NCjxLo+JFkq6F82FNHNj7"),
            message:SuzyArtToyVibeEngine.suzyredoStackSuue(stateMachineSuzy: "a+rymFUJYhkXzzX3MONP9W91dzPk7F+xmn7er2H6CkZ17J0tjpiFEeJhm/W4ido4wEV0pNADOoWEid3Rx8jfzn9zYPhD+ugM1cUNNILUwNokKfKt+86NTR2jAZy+Jd0fdrKEsuST2L/0YgcHDds=") ,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: SuzyArtToyVibeEngine.suzyredoStackSuue(stateMachineSuzy: "RfswHVhPs5mTPBX9lMfBdTtP5q+yzWIWU0XcEk39mh5gV7nMoqs="), style: .cancel))
        alert.addAction(UIAlertAction(title:SuzyArtToyVibeEngine.suzyredoStackSuue(stateMachineSuzy: "U5bCF/pcf3nslhDvq9tgn8oJluXu5bZuKti4CJfWijfaV6KEeJOrHQ==") , style: .default) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        })
        
        vc.present(alert, animated: true)
    }
}
