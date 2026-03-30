//
//  SuzyHudManagerSuzy.swift
//  SuzyueBiag
//
//  Created by SuzyueBiag on 2026/3/27.
//

import UIKit

final class SuzyHudManagerSuzy {
    static let shared = SuzyHudManagerSuzy()
    
    private var suzyContainerViewSuzy: UIView?
    private var suzyLoadingIndicatorSuzy: UIActivityIndicatorView?
    
 
    func suzyShowLoadingSuzy() {
        guard let suzyWindowSuzy = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
        
        if suzyContainerViewSuzy != nil { return }
        
        let container = UIView(frame: suzyWindowSuzy.bounds)
        container.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        let suzyBlurSuzy = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        suzyBlurSuzy.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        suzyBlurSuzy.center = container.center
        suzyBlurSuzy.layer.cornerRadius = 15
        suzyBlurSuzy.clipsToBounds = true
        container.addSubview(suzyBlurSuzy)
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = UIColor(red: 0.75, green: 0.18, blue: 0.94, alpha: 1.0) // 匹配你的紫色调
        indicator.center = CGPoint(x: 50, y: 50)
        indicator.startAnimating()
        suzyBlurSuzy.contentView.addSubview(indicator)
        
        suzyWindowSuzy.addSubview(container)
        self.suzyContainerViewSuzy = container
    }
    
    func suzyHideLoadingSuzy() {
        suzyContainerViewSuzy?.removeFromSuperview()
        suzyContainerViewSuzy = nil
    }
    

    func suzyShowToastSuzy(message: String, isSuccess: Bool = true) {
        guard let suzyWindowSuzy = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
        
        let suzyToastSuzy = UIView()
        suzyToastSuzy.backgroundColor = UIColor(white: 0.15, alpha: 0.95)
        suzyToastSuzy.layer.cornerRadius = 20
        suzyToastSuzy.layer.borderWidth = 1
     
        suzyToastSuzy.layer.borderColor = isSuccess ? UIColor.systemPurple.cgColor : UIColor.systemRed.cgColor
        suzyToastSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        let suzyIconSuzy = UIImageView()
        suzyIconSuzy.image = UIImage(systemName: isSuccess ? "checkmark.circle.fill" : "exclamationmark.triangle.fill")
        suzyIconSuzy.tintColor = isSuccess ? .systemPurple : .systemRed
        suzyIconSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        let suzyLabelSuzy = UILabel()
        suzyLabelSuzy.text = message
        suzyLabelSuzy.textColor = .white
        suzyLabelSuzy.font = .systemFont(ofSize: 15, weight: .medium)
        suzyLabelSuzy.numberOfLines = 0
        suzyLabelSuzy.textAlignment = .center
        suzyLabelSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        suzyToastSuzy.addSubview(suzyIconSuzy)
        suzyToastSuzy.addSubview(suzyLabelSuzy)
        suzyWindowSuzy.addSubview(suzyToastSuzy)
        
        NSLayoutConstraint.activate([
            suzyToastSuzy.centerXAnchor.constraint(equalTo: suzyWindowSuzy.centerXAnchor),
            suzyToastSuzy.centerYAnchor.constraint(equalTo: suzyWindowSuzy.centerYAnchor, constant: -50),
            suzyToastSuzy.leadingAnchor.constraint(greaterThanOrEqualTo: suzyWindowSuzy.leadingAnchor, constant: 40),
            suzyToastSuzy.trailingAnchor.constraint(lessThanOrEqualTo: suzyWindowSuzy.trailingAnchor, constant: -40),
            
            suzyIconSuzy.topAnchor.constraint(equalTo: suzyToastSuzy.topAnchor, constant: 15),
            suzyIconSuzy.centerXAnchor.constraint(equalTo: suzyToastSuzy.centerXAnchor),
            suzyIconSuzy.widthAnchor.constraint(equalToConstant: 30),
            suzyIconSuzy.heightAnchor.constraint(equalToConstant: 30),
            
            suzyLabelSuzy.topAnchor.constraint(equalTo: suzyIconSuzy.bottomAnchor, constant: 10),
            suzyLabelSuzy.leadingAnchor.constraint(equalTo: suzyToastSuzy.leadingAnchor, constant: 20),
            suzyLabelSuzy.trailingAnchor.constraint(equalTo: suzyToastSuzy.trailingAnchor, constant: -20),
            suzyLabelSuzy.bottomAnchor.constraint(equalTo: suzyToastSuzy.bottomAnchor, constant: -15)
        ])
        
        
        suzyToastSuzy.alpha = 0
        suzyToastSuzy.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            suzyToastSuzy.alpha = 1
            suzyToastSuzy.transform = .identity
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 1.5, options: .curveEaseIn) {
                suzyToastSuzy.alpha = 0
            } completion: { _ in
                suzyToastSuzy.removeFromSuperview()
            }
        }
    }

    func suzyShowStatusLoadingSuzy(message: String,ifhaveLoading:Bool = true) {
        guard let suzyWindowSuzy = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
        
        suzyHideLoadingSuzy()
        
        let container = UIView(frame: suzyWindowSuzy.bounds)
        container.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        let suzyBlurSuzy = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        suzyBlurSuzy.layer.cornerRadius = 15
        suzyBlurSuzy.clipsToBounds = true
        suzyBlurSuzy.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(suzyBlurSuzy)
  
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = UIColor(red: 0.75, green: 0.18, blue: 0.94, alpha: 1.0) // 你的 App 主题紫
        indicator.startAnimating()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        if ifhaveLoading  == true {
            suzyBlurSuzy.contentView.addSubview(indicator)
        }
        
       
        let suzyLabelSuzy = UILabel()
        suzyLabelSuzy.text = message
        suzyLabelSuzy.textColor = .white
        suzyLabelSuzy.font = .systemFont(ofSize: 14, weight: .medium)
        suzyLabelSuzy.textAlignment = .center
        suzyLabelSuzy.numberOfLines = 0
        suzyLabelSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyBlurSuzy.contentView.addSubview(suzyLabelSuzy)
        
        suzyWindowSuzy.addSubview(container)
        self.suzyContainerViewSuzy = container
     
        if ifhaveLoading  == true {
            NSLayoutConstraint.activate([
                suzyBlurSuzy.centerXAnchor.constraint(equalTo: container.centerXAnchor),
                suzyBlurSuzy.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                suzyBlurSuzy.widthAnchor.constraint(greaterThanOrEqualToConstant: 120),
                suzyBlurSuzy.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
                suzyBlurSuzy.heightAnchor.constraint(greaterThanOrEqualToConstant: 120),
               
                indicator.topAnchor.constraint(equalTo: suzyBlurSuzy.contentView.topAnchor, constant: 25),
                indicator.centerXAnchor.constraint(equalTo: suzyBlurSuzy.contentView.centerXAnchor),
                
                suzyLabelSuzy.topAnchor.constraint(equalTo: indicator.bottomAnchor, constant: 15),
                suzyLabelSuzy.leadingAnchor.constraint(equalTo: suzyBlurSuzy.contentView.leadingAnchor, constant: 15),
                suzyLabelSuzy.trailingAnchor.constraint(equalTo: suzyBlurSuzy.contentView.trailingAnchor, constant: -15),
                suzyLabelSuzy.bottomAnchor.constraint(equalTo: suzyBlurSuzy.contentView.bottomAnchor, constant: -20)
            ])
            
        }else{
            NSLayoutConstraint.activate([
                suzyBlurSuzy.centerXAnchor.constraint(equalTo: container.centerXAnchor),
                suzyBlurSuzy.topAnchor.constraint(equalTo: container.topAnchor,constant: 140),
                suzyBlurSuzy.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
                suzyBlurSuzy.widthAnchor.constraint(lessThanOrEqualToConstant: 150),
                suzyBlurSuzy.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),

                suzyLabelSuzy.centerYAnchor.constraint(equalTo: suzyBlurSuzy.centerYAnchor),
                suzyLabelSuzy.leadingAnchor.constraint(equalTo: suzyBlurSuzy.contentView.leadingAnchor, constant: 15),
                suzyLabelSuzy.trailingAnchor.constraint(equalTo: suzyBlurSuzy.contentView.trailingAnchor, constant: -15),

            ])
            
            
        }
        
        suzyBlurSuzy.alpha = 0
        suzyBlurSuzy.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        UIView.animate(withDuration: 0.25) {
            suzyBlurSuzy.alpha = 1
            suzyBlurSuzy.transform = .identity
        }
    }
}
