//
//  ProfileViewController.swift
//  Task
//
//  Created by Tanirbergen Kaldibai on 19.03.2021.
//

import UIKit

class ProfileViewController: UIViewController, SetupView {
    // MARK: - Properties
    let headerView = HeaderView()
    
    private var userInformationTableView: UITableView = {
        let tb = UITableView(frame: .zero, style: .insetGrouped)
        return tb
    }()
    
    let item = [
        userInformation(title: "Номер Телефона", subTitle: "+7 (122) 333 44"),
        userInformation(title: "Город", subTitle: "New York"),
        userInformation(title: "Email", subTitle: "test1@qwe.con")
    ]
    // MARK: - StackView
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    // MARK: - Methods
    func setupView() {
        [headerView, userInformationTableView].forEach {
            view.addSubview($0)
        }
        headerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
        headerView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 5).isActive = true
        userInformationTableView.anchor(top: headerView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        configureView()
        setupAction()
    }
    
    func configureView() {
        view.backgroundColor = .white
        configureNavigationBar(isHidden: true, backgroundColor: .clear, title: "")
    }
    
    func setupAction() {
        
    }
    
    func configureTableView() {
        userInformationTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: PROFILE_CELLID)
        userInformationTableView.delegate = self
        userInformationTableView.dataSource = self
        userInformationTableView.showsVerticalScrollIndicator = false
    }
}

