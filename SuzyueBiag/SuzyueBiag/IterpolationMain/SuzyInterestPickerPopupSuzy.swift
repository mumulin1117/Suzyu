//
//  SuzyInterestPickerPopupSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/20.
//

import UIKit

final class SuzyInterestPickerPopupSuzy: UIViewController {
    var fromrEdit:Bool = false
    init(fromrEdit: Bool) {
        self.fromrEdit = fromrEdit
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var suzyProfileDataSuzy = SuzyUserDraftProfileSuzy()
     
    var suzySelectCompleteSuzy:(([String])->(Void))?
    
    // MARK: - UI Components Suzy
    private let suzyDimmedBgViewSuzy = UIView()
    private let suzyContainerViewSuzy: UIView = {
        let viewSuzy = UIView()
        viewSuzy.backgroundColor = UIColor(white: 0.12, alpha: 1.0) // 匹配设计图深色背景
        viewSuzy.layer.cornerRadius = 30
        viewSuzy.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        viewSuzy.translatesAutoresizingMaskIntoConstraints = false
        return viewSuzy
    }()

    private let suzyTitleLabelSuzy: UILabel = {
        let labelSuzy = UILabel()
        
        labelSuzy.textColor = .white
        labelSuzy.font = .systemFont(ofSize: 16, weight: .medium)
        labelSuzy.translatesAutoresizingMaskIntoConstraints = false
        return labelSuzy
    }()

    private lazy var suzyCollectionViewSuzy: UICollectionView = {
        let suzyLayoutSuzy = UICollectionViewFlowLayout()
        suzyLayoutSuzy.scrollDirection = .vertical
        suzyLayoutSuzy.minimumInteritemSpacing = 10
        suzyLayoutSuzy.minimumLineSpacing = 15
        suzyLayoutSuzy.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 20, right: 20)
        
        let suzyCVSuzy = UICollectionView(frame: .zero, collectionViewLayout: suzyLayoutSuzy)
        suzyCVSuzy.backgroundColor = .clear
        suzyCVSuzy.delegate = self
        suzyCVSuzy.dataSource = self
        suzyCVSuzy.allowsMultipleSelection = true // 支持多选
        suzyCVSuzy.translatesAutoresizingMaskIntoConstraints = false
        
        // 注册自定义 Cell
        suzyCVSuzy.register(SuzyTagCellSuzy.self, forCellWithReuseIdentifier: "SuzyTagCellSuzy")
        suzyCVSuzy.translatesAutoresizingMaskIntoConstraints = false
        return suzyCVSuzy
    }()
   
     private lazy var suzyDoneButtonSuzy: UIButton = {
        let btnSuzy = UIButton(type: .custom)
        btnSuzy.layer.cornerRadius = 25
        btnSuzy.clipsToBounds = true
        btnSuzy.translatesAutoresizingMaskIntoConstraints = false
         btnSuzy.addTarget(self, action:#selector(suzyDoneButtonSuzyotup), for: .touchUpInside)
        return btnSuzy
    }()

    
    @objc func suzyDoneButtonSuzyotup()  {
        
        if fromrEdit == true {
            suzySelectCompleteSuzy?(suzySelectedInterestsSuzy)
            self.dismiss(animated: true)
        }else{
            suzyOnDoneClickedSuzy()
        }
        
    }
    // MARK: - Properties Suzy
    private var suzySelectedInterestsSuzy: [String] = []
 
    private let suzyAllInterestsSuzy: [String] = ["Dancing💃",
                                                  "Movies🎬",
                                                  "Animals🐈",
                                                  "Photography📷",
                                                  "Reading📖",
                                                  "Gaming🎮",
                                                  "Music🎵",
                                                  "Travel✈️",
                                                  "Painting🎨",
                                                  "Technology💻",
                                                  "Fashion👗",
                                                  "Cooking👨‍🍳",
                                                  "Food🍕",
                                                  "Sports⚽",
                                                  "Fitness💪"
    ]
   
    // MARK: - Lifecycle Suzy
    override func viewDidLoad() {
        super.viewDidLoad()
        suzyLoadLocalProfileDataSuzy()
        suzyUpdateTitleCountSuzy()
        suzySetupPopupUISuzy()
        suzyApplyDoneButtonGradientSuzy()
    }

    private func suzyLoadLocalProfileDataSuzy() {
        
       
        if let suzyCurrentProfileSuzy = SuzySecureVaultSuzy.sharedSuzy.suzyFetchCurrentProfileSuzy() {
           
            self.suzySelectedInterestsSuzy = suzyCurrentProfileSuzy.suzyTagsSuzy
         
            self.suzyProfileDataSuzy.suzyTagsSuzy = suzyCurrentProfileSuzy.suzyTagsSuzy
           
        }
        
    }
    
    private func suzySetupPopupUISuzy() {
        view.backgroundColor = .clear
        suzyDimmedBgViewSuzy.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        suzyDimmedBgViewSuzy.frame = view.bounds
        view.addSubview(suzyDimmedBgViewSuzy)

        view.addSubview(suzyContainerViewSuzy)
        suzyContainerViewSuzy.addSubview(suzyTitleLabelSuzy)
        suzyContainerViewSuzy.addSubview(suzyCollectionViewSuzy)
        suzyContainerViewSuzy.addSubview(suzyDoneButtonSuzy)

        let suzyBtnTitleSuzy = NSMutableAttributedString(string: "Done  |  ", attributes: [
            .font: UIFont.systemFont(ofSize: 18, weight: .bold),
            .foregroundColor: UIColor.white
        ])
        let DeserialAttachmentSuzy = NSTextAttachment()
        DeserialAttachmentSuzy.image = SuzyArtToyVibeEngine.suzyfilterApplySuzy(assetManagerSuue: "suzy_ic_coin_small")
        DeserialAttachmentSuzy.bounds = CGRect(x: 0, y: -4, width: 20, height: 20)
        suzyBtnTitleSuzy.append(NSAttributedString(attachment: DeserialAttachmentSuzy))
        suzyBtnTitleSuzy.append(NSAttributedString(string: " 20", attributes: [
            .font: UIFont.systemFont(ofSize: 18, weight: .bold),
            .foregroundColor: UIColor.white
        ]))
        
        if fromrEdit {
            suzyDoneButtonSuzy.setTitle(SuzyArtToyVibeEngine.suzyredoStackSuue(stateMachineSuzy: "d0OPJY6URr2B6FfrFjRvhmO7MbISn7jgkKmm1/nPVQMfIBNu"), for: .normal)
        }else{
           let recomine = SuzyAertionManagerSuzy.shared.suzyGetRemainingFreeAertionSuzy()
            if recomine > 0 {
                suzyDoneButtonSuzy.setTitleColor(.white, for: .normal)
                suzyDoneButtonSuzy.setTitle("Three free times a day \(recomine)/3", for: .normal)
            }else{
                suzyDoneButtonSuzy.setAttributedTitle( suzyBtnTitleSuzy, for: .normal)
            }
            
        }
        
        NSLayoutConstraint.activate([
            suzyContainerViewSuzy.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            suzyContainerViewSuzy.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            suzyContainerViewSuzy.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -240),
            suzyContainerViewSuzy.heightAnchor.constraint(equalToConstant: 460),

            suzyTitleLabelSuzy.topAnchor.constraint(equalTo: suzyContainerViewSuzy.topAnchor, constant: 25),
            suzyTitleLabelSuzy.centerXAnchor.constraint(equalTo: suzyContainerViewSuzy.centerXAnchor),

            suzyCollectionViewSuzy.topAnchor.constraint(equalTo: suzyTitleLabelSuzy.bottomAnchor, constant: 20),
            suzyCollectionViewSuzy.leadingAnchor.constraint(equalTo: suzyContainerViewSuzy.leadingAnchor, constant: 20),
            suzyCollectionViewSuzy.trailingAnchor.constraint(equalTo: suzyContainerViewSuzy.trailingAnchor, constant: -20),
            suzyCollectionViewSuzy.bottomAnchor.constraint(equalTo: suzyDoneButtonSuzy.topAnchor, constant: -20),

            suzyDoneButtonSuzy.bottomAnchor.constraint(equalTo: suzyContainerViewSuzy.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            suzyDoneButtonSuzy.leadingAnchor.constraint(equalTo: suzyContainerViewSuzy.leadingAnchor, constant: 40),
            suzyDoneButtonSuzy.trailingAnchor.constraint(equalTo: suzyContainerViewSuzy.trailingAnchor, constant: -40),
            suzyDoneButtonSuzy.heightAnchor.constraint(equalToConstant: 50)
        ])

       
        let tapSuzy = UITapGestureRecognizer(target: self, action: #selector(suzyDismissPopupSuzy))
        suzyDimmedBgViewSuzy.addGestureRecognizer(tapSuzy)
       
    }

    private func suzyApplyDoneButtonGradientSuzy() {
        let gradientSuzy = CAGradientLayer()
        gradientSuzy.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 80, height: 50)
        gradientSuzy.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradientSuzy.startPoint = CGPoint(x: 0, y: 0.5)
        gradientSuzy.endPoint = CGPoint(x: 1, y: 0.5)
        suzyDoneButtonSuzy.layer.insertSublayer(gradientSuzy, at: 0)
    }

    @objc private func suzyDismissPopupSuzy() {
        if fromrEdit == true {
            suzySelectCompleteSuzy?(suzySelectedInterestsSuzy)
           
        }
        self.dismiss(animated: true)
    }

    @objc private func suzyOnDoneClickedSuzy() {
     
        self.dismiss(animated: true)
        
    }
}

extension SuzyInterestPickerPopupSuzy: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suzyAllInterestsSuzy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let suzyCellSuzy = collectionView.dequeueReusableCell(withReuseIdentifier: "SuzyTagCellSuzy", for: indexPath) as! SuzyTagCellSuzy
        
        let suzyItemSuzy = suzyAllInterestsSuzy[indexPath.item]
     
        let suzyIsSelectedSuzy = self.suzySelectedInterestsSuzy.contains(suzyItemSuzy)

        suzyCellSuzy.suzyConfigureSuzy(item: suzyItemSuzy, isSelected: suzyIsSelectedSuzy)
        return suzyCellSuzy
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        
        let tagNameSuzy = suzyAllInterestsSuzy[indexPath.item]
        if suzySelectedInterestsSuzy.contains(tagNameSuzy) {
           
            if let index = suzySelectedInterestsSuzy.firstIndex(of: tagNameSuzy) {
                suzySelectedInterestsSuzy.remove(at: index)
            }
          
            SuzySecureVaultSuzy.sharedSuzy.suzyUpdateMutableAttributesSuzy(newTagsSuzy: suzySelectedInterestsSuzy)
            collectionView.reloadItems(at: [indexPath])
            suzyUpdateTitleCountSuzy()
            return
            
        }
          
            if suzySelectedInterestsSuzy.count >= 5 {
               
                return
            }
          
            if !suzySelectedInterestsSuzy.contains(tagNameSuzy) {
                suzySelectedInterestsSuzy.append(tagNameSuzy)
                suzyUpdateTitleCountSuzy()
                SuzySecureVaultSuzy.sharedSuzy.suzyUpdateMutableAttributesSuzy(newTagsSuzy:suzySelectedInterestsSuzy)
                collectionView.reloadItems(at: [indexPath])
            }
        
     
    }
    

    func suzyUpdateTitleCountSuzy()  {
        suzyTitleLabelSuzy.text = "Select up to 5 (\(suzySelectedInterestsSuzy.count)/5)"
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let suzyTextSuzy = suzyAllInterestsSuzy[indexPath.item]

        let suzyFullStringSuzy = suzyTextSuzy
       
        let suzySizeSuzy = (suzyFullStringSuzy as NSString).size(withAttributes: [.font: UIFont.systemFont(ofSize: 14)])
        return CGSize(width: suzySizeSuzy.width + 40, height: 40)
    }
}
