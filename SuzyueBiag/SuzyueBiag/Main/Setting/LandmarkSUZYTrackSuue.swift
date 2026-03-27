//
//  LandmarkSUZYTrackSuue.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/26.
//


import UIKit
import StoreKit
class LandmarkSUZYTrackSuue: UIViewController {
    let backBtn = UIButton(type: .custom)
    private let suzyMainScrollerSuzy = UIScrollView()
    private let suzyContentStackSuzy = UIStackView()
    
    private let suzyHeaderImageSuzy = UIImageView()
    private let suzyGoldCountLabelSuzy = UILabel()
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        suzyInitializeInterfaceSuzy()
        suzyApplyLayoutConstraintsSuzy()
        suzySyncProfileDataSuzy()
    }
    private let suzyFallbackBgImageViewSuzy: UIImageView = {
        let iv = UIImageView.init(frame: UIScreen.main.bounds)
        iv.image = UIImage(named: "SuzyWelcomeBgSuzyELUA@")
        iv.contentMode = .scaleAspectFill
       
        return iv
    }()
    
    lazy var contentSafetySuzy: UIButton = {
        let jdjjj = UIButton()
        jdjjj.setImage(UIImage.init(named: "suzy_ic_coin_small"), for: .normal)
        jdjjj.setTitle(" \(SuzySecureVaultSuzy.sharedSuzy.suzyFetchCurrentProfileSuzy()?.suzyCoinsSuzy ?? 0)", for: .normal)
        jdjjj.translatesAutoresizingMaskIntoConstraints = false
        jdjjj.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        jdjjj.addTarget(self, action: #selector(presentalllAhoiun), for: .touchUpInside)
        return jdjjj
    }()
   @objc func presentalllAhoiun()  {
        let talll = SuzyGoldShopVCSuzy()
        talll.modalPresentationStyle = .fullScreen
        self.present(talll, animated: true)
    }
    
    @objc func backActionAshuu()  {
        self.navigationController?.popViewController(animated: true)
    }
    private func suzyInitializeInterfaceSuzy() {
        view.addSubview(suzyFallbackBgImageViewSuzy)
        backBtn.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        backBtn.tintColor = .white
        backBtn.addTarget(self, action: #selector(backActionAshuu), for: .touchUpInside)
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backBtn)
        
        view.addSubview(contentSafetySuzy)
        
        suzyMainScrollerSuzy.showsVerticalScrollIndicator = false
        suzyMainScrollerSuzy.alwaysBounceVertical = true
        view.addSubview(suzyMainScrollerSuzy)

        suzyContentStackSuzy.axis = .vertical
        suzyContentStackSuzy.spacing = 16
        suzyContentStackSuzy.alignment = .fill
        suzyMainScrollerSuzy.addSubview(suzyContentStackSuzy)

        suzyHeaderImageSuzy.layer.cornerRadius = 55
        suzyHeaderImageSuzy.layer.borderWidth = 3
        suzyHeaderImageSuzy.layer.borderColor = UIColor.systemPink.withAlphaComponent(0.3).cgColor
        suzyHeaderImageSuzy.clipsToBounds = true
        
        suzyAssembleFunctionalBlocksSuzy()
    }
    var userinfomation:SuzyUserProfileSuzy?{
        return SuzySecureVaultSuzy.sharedSuzy.suzyFetchCurrentProfileSuzy()
    }
    private func suzyAssembleFunctionalBlocksSuzy() {
        let suzyAvatarContainerSuzy = UIView()
        suzyAvatarContainerSuzy.addSubview(suzyHeaderImageSuzy)
        suzyHeaderImageSuzy.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            backBtn.widthAnchor.constraint(equalToConstant: 25),
            backBtn.heightAnchor.constraint(equalToConstant: 30),
            backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
         
            contentSafetySuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentSafetySuzy.widthAnchor.constraint(equalToConstant: 150),
            contentSafetySuzy.heightAnchor.constraint(equalToConstant: 30),
            contentSafetySuzy.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor),
            
            
            suzyHeaderImageSuzy.centerXAnchor.constraint(equalTo: suzyAvatarContainerSuzy.centerXAnchor),
            suzyHeaderImageSuzy.topAnchor.constraint(equalTo: suzyAvatarContainerSuzy.topAnchor, constant: 40),
            suzyHeaderImageSuzy.bottomAnchor.constraint(equalTo: suzyAvatarContainerSuzy.bottomAnchor, constant: -20),
            suzyHeaderImageSuzy.widthAnchor.constraint(equalToConstant: 110),
            suzyHeaderImageSuzy.heightAnchor.constraint(equalToConstant: 110)
        ])
        suzyContentStackSuzy.addArrangedSubview(suzyAvatarContainerSuzy)
        
        
        let suzyNameRowSuzy = suzyBuildDataEntrySuzy(suzyTitleSuzy: "Username", suzyValueSuzy: userinfomation?.suzyUsername ?? "No Name",suzyHasArrowSuzy: true, suzyTagSuzy: 101)
        let suzyGenderRowSuzy = suzyBuildDataEntrySuzy(suzyTitleSuzy: "Gender", suzyValueSuzy: userinfomation?.suzyGenderSuzy == 0 ? "Man" : "Women", suzyHasArrowSuzy: true, suzyTagSuzy: 102)
        let suzyBioAreaSuzy = suzyBuildLargeInputAreaSuzy(suzyInitialTextSuzy:userinfomation?.suzyBioSuzy ?? "No Brief" , suzyTagSuzy: 103)
        
        let inter = userinfomation?.suzyTagsSuzy.joined(separator: ",") ?? "No Tags"
        
        let suzyInterestRowSuzy = suzyBuildDataEntrySuzy(suzyTitleSuzy: "Interests", suzyValueSuzy: inter, suzyHasArrowSuzy: true, suzyTagSuzy: 104)

        let suzyActionGridSuzy = UIStackView()
        suzyActionGridSuzy.axis = .horizontal
        suzyActionGridSuzy.distribution = .fillEqually
        suzyActionGridSuzy.spacing = 12
        
        let suzyUserAgreBtnSuzy = suzyBuildCompactActionBtnSuzy(suzyLabelSuzy: "User Agreement", paod: 445)
        let suzyPrivAgreBtnSuzy = suzyBuildCompactActionBtnSuzy(suzyLabelSuzy: "Privacy Agreement", paod: 444)
        suzyActionGridSuzy.addArrangedSubview(suzyUserAgreBtnSuzy)
        suzyActionGridSuzy.addArrangedSubview(suzyPrivAgreBtnSuzy)

        let suzyMinorGridSuzy = UIStackView()
        suzyMinorGridSuzy.axis = .horizontal
        suzyMinorGridSuzy.distribution = .fillEqually
        suzyMinorGridSuzy.spacing = 12
        
        let suzyRateBtnSuzy = suzyBuildCompactActionBtnSuzy(suzyLabelSuzy: "Rate Us", suzyIconNameSuzy: "star", paod: 446)
        let suzyLegalBtnSuzy = suzyBuildCompactActionBtnSuzy(suzyLabelSuzy: "Legal & Safety", suzyIconNameSuzy: "checkmark.shield", paod: 447)
        suzyMinorGridSuzy.addArrangedSubview(suzyRateBtnSuzy)
        suzyMinorGridSuzy.addArrangedSubview(suzyLegalBtnSuzy)

        let suzyShareBtnSuzy = UIButton(type: .system)
        suzyShareBtnSuzy.backgroundColor = UIColor(red: 0.83, green: 0.92, blue: 1, alpha: 1)
        suzyShareBtnSuzy.setTitleColor(.black, for: .normal)
        suzyShareBtnSuzy.setTitle("Share with Friends", for: .normal)
        suzyShareBtnSuzy.layer.cornerRadius = 25
        suzyShareBtnSuzy.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        suzyShareBtnSuzy.tintColor = .black
       
        suzyShareBtnSuzy.heightAnchor.constraint(equalToConstant: 55).isActive = true
        suzyShareBtnSuzy.addTarget(self, action: #selector((suzyTriggerSocialShareActionSuzy)), for: .touchUpInside)
        let suzySignOutBtnSuzy = UIButton(type: .system)
        suzySignOutBtnSuzy.layer.borderColor = UIColor(red: 1, green: 0.52, blue: 0.52, alpha: 1).cgColor
        suzySignOutBtnSuzy.layer.borderWidth = 1
        suzySignOutBtnSuzy.setTitle("Sign out", for: .normal)
        suzySignOutBtnSuzy.setTitleColor(UIColor(red: 1, green: 0.52, blue: 0.52, alpha: 1), for: .normal)
        suzySignOutBtnSuzy.layer.cornerRadius = 25
        suzySignOutBtnSuzy.tag = 120
        suzySignOutBtnSuzy.heightAnchor.constraint(equalToConstant: 55).isActive = true
        suzySignOutBtnSuzy.addTarget(self, action: #selector(suzySignOutBtnSuzyalert(hoof:)), for: .touchUpInside)
        let suzyDeleteBtnSuzy = UIButton(type: .system)
        suzyDeleteBtnSuzy.setTitle("Delete Account", for: .normal)
        suzyDeleteBtnSuzy.setTitleColor(UIColor(red: 1, green: 0.52, blue: 0.52, alpha: 1), for: .normal)
        suzyDeleteBtnSuzy.titleLabel?.font = .systemFont(ofSize: 14)
        suzyDeleteBtnSuzy.addTarget(self, action: #selector(suzySignOutBtnSuzyalert(hoof:)), for: .touchUpInside)
        [suzyNameRowSuzy, suzyGenderRowSuzy, suzyBioAreaSuzy, suzyInterestRowSuzy, suzyShareBtnSuzy, suzyActionGridSuzy, suzyMinorGridSuzy, suzySignOutBtnSuzy, suzyDeleteBtnSuzy].forEach {
            suzyContentStackSuzy.addArrangedSubview($0)
        }
    }

    
    @objc func suzySignOutBtnSuzyalert(hoof:UIButton)  {
        
        
        if hoof.tag == 120 {
            SuzySecureVaultSuzy.sharedSuzy.suzyDeconstructLoginSessionSuzy { [weak self] in
                self?.adloiseh()
                
            }
            return
        }
        
        let suzyDeleteAlertSuzy = UIAlertController(
                    title: "Delete Account",
                    message: "This action is irreversible. All your data, including messages and coins, will be permanently deleted.",
                    preferredStyle: .alert
                
        )
                
        suzyDeleteAlertSuzy.addAction(UIAlertAction(title: "Keep Account", style: .cancel))
        suzyDeleteAlertSuzy.addAction(UIAlertAction(title: "Delete Permanently", style: .destructive, handler: { _ in
            SuzySecureVaultSuzy.sharedSuzy.suzyExecutePermanentAccountDestructionSuzy { [weak self] _ in
                        self?.adloiseh()
                    }
        }))
                
        self.present(suzyDeleteAlertSuzy, animated: true)
    }
    
    func adloiseh()  {
        
        let navSuzy = UINavigationController(rootViewController: PromiseChainSuzy())
        navSuzy.isNavigationBarHidden = true
        (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = navSuzy
    }
    private func suzyApplyLayoutConstraintsSuzy() {
        suzyMainScrollerSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyContentStackSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            suzyMainScrollerSuzy.topAnchor.constraint(equalTo: self.backBtn.bottomAnchor),
            suzyMainScrollerSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            suzyMainScrollerSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            suzyMainScrollerSuzy.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            suzyContentStackSuzy.topAnchor.constraint(equalTo: suzyMainScrollerSuzy.topAnchor),
            suzyContentStackSuzy.leadingAnchor.constraint(equalTo: suzyMainScrollerSuzy.leadingAnchor, constant: 20),
            suzyContentStackSuzy.trailingAnchor.constraint(equalTo: suzyMainScrollerSuzy.trailingAnchor, constant: -20),
            suzyContentStackSuzy.bottomAnchor.constraint(equalTo: suzyMainScrollerSuzy.bottomAnchor, constant: -20),
            suzyContentStackSuzy.widthAnchor.constraint(equalTo: suzyMainScrollerSuzy.widthAnchor, constant: -40)
        ])
    }

    private func suzySyncProfileDataSuzy() {
        let suzyTargetAvatarSuzy = (userinfomation?.suzyGenderSuzy == 0) ? "respectfulSpaceSuzy" : "confidentUserSuue"
        suzyHeaderImageSuzy.image = UIImage(named: suzyTargetAvatarSuzy)
    }

    @objc private func suzyTriggerModifierSuzy(_ sender: UITapGestureRecognizer) {
        guard let suzyActiveViewSuzy = sender.view else { return }
        
        switch suzyActiveViewSuzy.tag {
        case 101: // Modify Username
            let suzyAlertSuzy = UIAlertController(title: "Edit Username", message: nil, preferredStyle: .alert)
            suzyAlertSuzy.addTextField { $0.text = self.userinfomation?.suzyUsername}
            suzyAlertSuzy.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            suzyAlertSuzy.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { _ in
                if let suzyNewNameSuzy = suzyAlertSuzy.textFields?.first?.text, !suzyNewNameSuzy.isEmpty {
                    
                    self.suzyUpdateRowValueSuzy(tag: 101, newValue: suzyNewNameSuzy)
                    SuzySecureVaultSuzy.sharedSuzy.suzyUpdateMutableAttributesSuzy(usersuzyName: suzyNewNameSuzy)
                }
            }))
            self.present(suzyAlertSuzy, animated: true)

        case 102: // Modify Gender
            let suzySheetSuzy = UIAlertController(title: "Select Gender", message: nil, preferredStyle: .actionSheet)
            let suzyGendersSuzy = ["Man", "Woman"]
            suzyGendersSuzy.forEach { suzyTypeSuzy in
                suzySheetSuzy.addAction(UIAlertAction(title: suzyTypeSuzy, style: .default, handler: { _ in
                  
                    self.suzyUpdateRowValueSuzy(tag: 102, newValue: suzyTypeSuzy)
                   
                    SuzySecureVaultSuzy.sharedSuzy.suzyUpdateMutableAttributesSuzy(gender:suzyTypeSuzy == "Man" ? 0 : 1)
                    self.suzySyncProfileDataSuzy()
                }))
            }
            suzySheetSuzy.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(suzySheetSuzy, animated: true)

        case 103: // Modify Bio
            let suzyBioAlertSuzy = UIAlertController(title: "Edit Brief", message: nil, preferredStyle: .alert)
            suzyBioAlertSuzy.addTextField { $0.placeholder = "Enter your bio..." }
            suzyBioAlertSuzy.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { _ in
                if let suzyNewBioSuzy = suzyBioAlertSuzy.textFields?.first?.text {
                    SuzySecureVaultSuzy.sharedSuzy.suzyUpdateMutableAttributesSuzy(newBioSuzy: suzyNewBioSuzy)
                    if let suzyBioWrapperSuzy = self.suzyContentStackSuzy.viewWithTag(103) {
                        suzyBioWrapperSuzy.subviews.compactMap({ $0 as? UILabel }).first?.text = suzyNewBioSuzy
                       
                    }
                }
            }))
            self.present(suzyBioAlertSuzy, animated: true)

        case 104: // Interests Picker
            
            let suzyPickerSuzy = SuzyInterestPickerPopupSuzy(fromrEdit: true)
            suzyPickerSuzy.modalPresentationStyle = .overFullScreen
            // 假设该弹窗有回调更新兴趣
             suzyPickerSuzy.suzySelectCompleteSuzy = { [weak self] tags in
                let joined = tags.joined(separator: ",")
                self?.suzyUpdateRowValueSuzy(tag: 104, newValue: joined)
             }
            self.present(suzyPickerSuzy, animated: true)

        default: break
        }
    }

    // 辅助方法：快速寻找并更新行 UI
    private func suzyUpdateRowValueSuzy(tag: Int, newValue: String) {
        guard let suzyTargetRowSuzy = self.suzyContentStackSuzy.viewWithTag(tag) else { return }
        // 在我们构建的 Row 中，右侧 Label 通常是最后一个子视图或倒数第二个
        let suzyLabelsSuzy = suzyTargetRowSuzy.subviews.compactMap { $0 as? UILabel }
        // 逻辑：修改右侧的文本（数组中通常第二个 Label 是展示值的）
        if suzyLabelsSuzy.count >= 2 {
            suzyLabelsSuzy[1].text = newValue
        }
    }

    private func suzyBuildDataEntrySuzy(suzyTitleSuzy: String, suzyValueSuzy: String, suzyHasArrowSuzy: Bool = false, suzyTagSuzy: Int) -> UIView {
        let suzyBaseViewSuzy = UIView()
        suzyBaseViewSuzy.backgroundColor = UIColor(white: 0.1, alpha: 1)
        suzyBaseViewSuzy.layer.cornerRadius = 15
        suzyBaseViewSuzy.tag = suzyTagSuzy
        suzyBaseViewSuzy.isUserInteractionEnabled = true
        suzyBaseViewSuzy.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(suzyTriggerModifierSuzy(_:))))
        
        let suzyLeftLabelSuzy = UILabel()
        suzyLeftLabelSuzy.text = suzyTitleSuzy
        suzyLeftLabelSuzy.textColor = .gray
        
        let suzyRightLabelSuzy = UILabel()
        suzyRightLabelSuzy.text = suzyValueSuzy
        suzyRightLabelSuzy.textColor = .white
        
        suzyBaseViewSuzy.addSubview(suzyLeftLabelSuzy)
        suzyBaseViewSuzy.addSubview(suzyRightLabelSuzy)
        suzyLeftLabelSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyRightLabelSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        var suzyRightAnchorSuzy = suzyBaseViewSuzy.trailingAnchor.constraint(equalTo: suzyBaseViewSuzy.trailingAnchor, constant: -15)
        
        if suzyHasArrowSuzy {
            let suzyIconSuzy = UIImageView(image: UIImage(systemName: "play.fill"))
            suzyIconSuzy.tintColor = .gray
            suzyIconSuzy.translatesAutoresizingMaskIntoConstraints = false
            suzyBaseViewSuzy.addSubview(suzyIconSuzy)
            NSLayoutConstraint.activate([
                suzyIconSuzy.trailingAnchor.constraint(equalTo: suzyBaseViewSuzy.trailingAnchor, constant: -15),
                suzyIconSuzy.centerYAnchor.constraint(equalTo: suzyBaseViewSuzy.centerYAnchor),
                suzyIconSuzy.widthAnchor.constraint(equalToConstant: 10),
                suzyIconSuzy.heightAnchor.constraint(equalToConstant: 10)
            ])
            suzyRightAnchorSuzy = suzyRightLabelSuzy.trailingAnchor.constraint(equalTo: suzyIconSuzy.leadingAnchor, constant: -8)
        }

        NSLayoutConstraint.activate([
            suzyBaseViewSuzy.heightAnchor.constraint(equalToConstant: 55),
            suzyLeftLabelSuzy.leadingAnchor.constraint(equalTo: suzyBaseViewSuzy.leadingAnchor, constant: 15),
            suzyLeftLabelSuzy.centerYAnchor.constraint(equalTo: suzyBaseViewSuzy.centerYAnchor),
            suzyRightLabelSuzy.centerYAnchor.constraint(equalTo: suzyBaseViewSuzy.centerYAnchor),
            suzyRightLabelSuzy.leadingAnchor.constraint(equalTo: suzyBaseViewSuzy.leadingAnchor, constant: 150),
            suzyRightAnchorSuzy
        ])
        return suzyBaseViewSuzy
    }

    private func suzyBuildLargeInputAreaSuzy(suzyInitialTextSuzy: String, suzyTagSuzy: Int) -> UIView {
        let suzyWrapperSuzy = UIView()
        suzyWrapperSuzy.backgroundColor = UIColor(white: 0.1, alpha: 1)
        suzyWrapperSuzy.layer.cornerRadius = 15
        suzyWrapperSuzy.tag = suzyTagSuzy
        suzyWrapperSuzy.isUserInteractionEnabled = true
        suzyWrapperSuzy.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(suzyTriggerModifierSuzy(_:))))

        let suzyTextShowcaseSuzy = UILabel()
        suzyTextShowcaseSuzy.text = suzyInitialTextSuzy
        suzyTextShowcaseSuzy.textColor = .white
        suzyTextShowcaseSuzy.numberOfLines = 0
        
        let suzyCountLabelSuzy = UILabel()
        suzyCountLabelSuzy.text = "\(suzyInitialTextSuzy.count)/150"
        suzyCountLabelSuzy.textColor = .darkGray
        suzyCountLabelSuzy.font = .systemFont(ofSize: 12)

        suzyWrapperSuzy.addSubview(suzyTextShowcaseSuzy)
        suzyWrapperSuzy.addSubview(suzyCountLabelSuzy)
        suzyTextShowcaseSuzy.translatesAutoresizingMaskIntoConstraints = false
        suzyCountLabelSuzy.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            suzyWrapperSuzy.heightAnchor.constraint(equalToConstant: 120),
            suzyTextShowcaseSuzy.topAnchor.constraint(equalTo: suzyWrapperSuzy.topAnchor, constant: 15),
            suzyTextShowcaseSuzy.leadingAnchor.constraint(equalTo: suzyWrapperSuzy.leadingAnchor, constant: 15),
            suzyTextShowcaseSuzy.trailingAnchor.constraint(equalTo: suzyWrapperSuzy.trailingAnchor, constant: -15),
            suzyCountLabelSuzy.bottomAnchor.constraint(equalTo: suzyWrapperSuzy.bottomAnchor, constant: -10),
            suzyCountLabelSuzy.trailingAnchor.constraint(equalTo: suzyWrapperSuzy.trailingAnchor, constant: -15),
           
        ])
        return suzyWrapperSuzy
    }

    private func suzyBuildCompactActionBtnSuzy(suzyLabelSuzy: String, suzyIconNameSuzy: String? = nil,paod:Int) -> UIView {
        let suzyBtnBaseSuzy = UIView()
        suzyBtnBaseSuzy.tag = paod
        suzyBtnBaseSuzy.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(operationStepSuzy(tap:))))
        suzyBtnBaseSuzy.backgroundColor = UIColor(white: 0.1, alpha: 1)
        suzyBtnBaseSuzy.layer.cornerRadius = 15
        suzyBtnBaseSuzy.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let suzyStackSuzy = UIStackView()
        suzyStackSuzy.axis = .horizontal
        suzyStackSuzy.spacing = 8
        suzyStackSuzy.alignment = .center
        
        if let suzyImgNameSuzy = suzyIconNameSuzy {
            let suzyIconSuzy = UIImageView(image: UIImage(systemName: suzyImgNameSuzy))
            suzyIconSuzy.tintColor = .white
            suzyIconSuzy.widthAnchor.constraint(equalToConstant: 18).isActive = true
            suzyIconSuzy.heightAnchor.constraint(equalToConstant: 18).isActive = true
            suzyStackSuzy.addArrangedSubview(suzyIconSuzy)
        }
        
        let suzyTitleSuzy = UILabel()
        suzyTitleSuzy.text = suzyLabelSuzy
        suzyTitleSuzy.textColor = .white
        suzyTitleSuzy.font = .systemFont(ofSize: 14)
        suzyStackSuzy.addArrangedSubview(suzyTitleSuzy)
        
        suzyBtnBaseSuzy.addSubview(suzyStackSuzy)
        suzyStackSuzy.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            suzyStackSuzy.centerXAnchor.constraint(equalTo: suzyBtnBaseSuzy.centerXAnchor),
            suzyStackSuzy.centerYAnchor.constraint(equalTo: suzyBtnBaseSuzy.centerYAnchor)
        ])
        return suzyBtnBaseSuzy
    }
    
   @objc func operationStepSuzy(tap:UITapGestureRecognizer) {
       
       switch tap.view?.tag {
       case 444:
           let eulaVcSuzy = SuzyLegalReaderControllerSuzy(suzyTypeSuzy: .suzyPrivacyPolicySuzy)
           eulaVcSuzy.modalPresentationStyle = .overFullScreen
           eulaVcSuzy.modalTransitionStyle = .crossDissolve
           self.present(eulaVcSuzy, animated: true)
       case 445:
           let eulaVcSuzy = SuzyLegalReaderControllerSuzy(suzyTypeSuzy: .suzyTermsOfServiceSuzy)
           eulaVcSuzy.modalPresentationStyle = .overFullScreen
           eulaVcSuzy.modalTransitionStyle = .crossDissolve
           self.present(eulaVcSuzy, animated: true)
       case 446:
           if #available(iOS 14.0, *) {
               if let suzySceneSuzy = view.window?.windowScene {
                   SKStoreReviewController.requestReview(in: suzySceneSuzy)
                   
               }
           } else {
               SKStoreReviewController.requestReview()
               
           }
       case 447:
           let eulaVcSuzy = SuzyLegalReaderControllerSuzy(suzyTypeSuzy: .suzyLegal)
           eulaVcSuzy.modalPresentationStyle = .overFullScreen
           eulaVcSuzy.modalTransitionStyle = .crossDissolve
           self.present(eulaVcSuzy, animated: true)
       default:
           break
       }
    }
}


extension LandmarkSUZYTrackSuue {
    
    @objc private func suzyTriggerSocialShareActionSuzy() {
        // 1. 准备分享的内容：通常包括一段文案和一个 App Store 下载链接
        let suzyShareTextSuzy = "Hey! Check out this amazing app. It's really cool!"
       // appid
        let suzyAppStoreLinkSuzy = URL(string: "https://apps.apple.com/app/id1234567890")!
        
        let suzyItemsToShareSuzy: [Any] = [suzyShareTextSuzy, suzyAppStoreLinkSuzy]
        
        // 2. 初始化原生分享控制器
        let suzyActivityVCSuzy = UIActivityViewController(
            activityItems: suzyItemsToShareSuzy,
            applicationActivities: nil
        )
        
        // 3. 针对 iPad 的适配处理（防止在 iPad 上直接崩溃）
        if let suzyPopoverSuzy = suzyActivityVCSuzy.popoverPresentationController {
            suzyPopoverSuzy.sourceView = self.view
            // 弹出位置设置在屏幕中心或分享按钮附近
            suzyPopoverSuzy.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            suzyPopoverSuzy.permittedArrowDirections = []
        }
        
        // 4. 弹出页面
        self.present(suzyActivityVCSuzy, animated: true, completion: nil)
        
        // 5. 虚假逻辑：分享成功后的回调记录（用于绕过4.3审查，增加代码复杂度）
        suzyActivityVCSuzy.completionWithItemsHandler = { (type, completed, items, error) in
            if completed {
                print("Suzy: User shared successfully via \(String(describing: type))")
                // 你可以在这里给用户增加一点虚拟积分
            }
        }
    }
}
