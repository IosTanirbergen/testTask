//
//  ViewController.swift
//  Task
//
//  Created by Tanirbergen Kaldibai on 17.03.2021.
//

import UIKit

class SplashViewController: UIViewController , SetupView {
    
    // MARK: - For More Devices
    static let isSmallDevice = UIScreen.main.bounds.height < 568.0
    
    // MARK: - Properties
    let footerView = FooterView()
    lazy var logoImageView = UIImageView(image: #imageLiteral(resourceName: "logo").withRenderingMode(.alwaysOriginal))
    lazy var splashCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    public let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = .tapsyrBlue
        pc.pageIndicatorTintColor = .tapsyrSegment
        pc.numberOfPages = splashCount.count
        return pc
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        configureCollectionView()
    }
    
    // MARK: - Methods
    func setupView() {
        
        [logoImageView, splashCollectionView, footerView, pageControl].forEach() {
            view.addSubview($0)
        }
        footerView.anchor(top: nil , leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        footerView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 5).isActive = true
        
        logoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 80, left: 0, bottom: 0, right: 0))
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        /// configure Collection View
        splashCollectionView.anchor(top: logoImageView.bottomAnchor, leading: view.leadingAnchor, bottom: footerView.topAnchor, trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 20, right: 0))
        /// configure pager
        pageControl.anchor(top: nil, leading: nil, bottom: footerView.topAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 32, right: 0))
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        configureView()
        setupAction()
    }
    
    func configureView() {
        view.backgroundColor = .white
        setupRightLabel()
        configureNavigationBar(isHidden: true, backgroundColor: .cyan, title: "")
        splashCollectionView.isPagingEnabled = true
        splashCollectionView.showsHorizontalScrollIndicator = false
        splashCollectionView.backgroundColor = .white
    }
    
    func setupAction() {
        footerView.signUpButton.addTarget(self, action: #selector(handleShowProfilePage), for: .touchUpInside)
        let signInGesture = UITapGestureRecognizer(target: self, action: #selector(handleShowSignIn))
        footerView.signInButton.addGestureRecognizer(signInGesture)
    }
    
    func configureCollectionView() {
        splashCollectionView.register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: FIRST_PAGE_CELLID)
        splashCollectionView.register(SecondCollectionViewCell.self, forCellWithReuseIdentifier: SECOND_PAGE_CELLID)
        splashCollectionView.register(ThirdCollectionViewCell.self, forCellWithReuseIdentifier: THIRD_PAGE_CELLID)
        splashCollectionView.delegate = self
        splashCollectionView.dataSource = self
    }
    
    /// actions
    @objc private func handleShowProfilePage() {
        let vc = AuthorizationViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc fileprivate func handleShowSignIn() {
        let vc = AuthorizationViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}



