//
//  ProfileViewController.swift
//  Task
//
//  Created by Tanirbergen Kaldibai on 18.03.2021.
//

import UIKit

class AuthorizationViewController: UIViewController, SetupView {
    
    lazy var logoImageView = UIImageView(image: #imageLiteral(resourceName: "logo").withRenderingMode(.alwaysOriginal))
    let customSegmentView = CustomSegment()
    let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupView()
    }
    
    func setupView() {
        [logoImageView, customSegmentView, loginView].forEach {
            view.addSubview($0)
        }
        
        logoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 80, left: 0, bottom: 0, right: 0))
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        /// configureSegment
        customSegmentView.anchor(top: logoImageView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 60, left: 16, bottom: 0, right: 16))
        customSegmentView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 20).isActive = true
        
        /// configureLoginView
        loginView.anchor(top: customSegmentView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 24, left: 16, bottom: 0, right: 16))
        loginView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 2).isActive = true
        configureView()
    }
    
    func configureView() {
        setupRightLabel()
        configureNavigationBar(isHidden: true, backgroundColor: .clear, title: "")
        view.backgroundColor = .white
    }
    
    func setupAction() {
        customSegmentView.signUpButton.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        customSegmentView.signInButton.addTarget(self, action: #selector(handleShowSignIn), for: .touchUpInside)
        loginView.nextButton.addTarget(self, action: #selector(handleShowProfile), for: .touchUpInside)
    }
    
    
    @objc fileprivate func handleShowSignUp() {
        loginView.removeSignInSubview()
        customSegmentView.signInHide()
    }
    
    @objc fileprivate func handleShowSignIn() {
        loginView.setupSignInSubview()
        customSegmentView.signUpHide()
    }
    
    @objc fileprivate func handleShowProfile() {
        let vc = ProfileViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
