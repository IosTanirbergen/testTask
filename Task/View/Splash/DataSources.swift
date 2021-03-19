//
//  DataSources.swift
//  Task
//
//  Created by Tanirbergen Kaldibai on 18.03.2021.
//

import UIKit

extension SplashViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return splashCount.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            return collectionView.dequeueReusableCell(withReuseIdentifier: FIRST_PAGE_CELLID, for: indexPath) as! FirstCollectionViewCell
        case 1:
            return collectionView.dequeueReusableCell(withReuseIdentifier: SECOND_PAGE_CELLID, for: indexPath) as! SecondCollectionViewCell
        case 2:
            return collectionView.dequeueReusableCell(withReuseIdentifier: THIRD_PAGE_CELLID, for: indexPath) as! ThirdCollectionViewCell
        default:
            return collectionView.dequeueReusableCell(withReuseIdentifier: SECOND_PAGE_CELLID, for: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: splashCollectionView.frame.size.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scroll = scrollView.contentOffset.x / view.frame.width
        pageControl.currentPage = Int(scroll)
    }
}
