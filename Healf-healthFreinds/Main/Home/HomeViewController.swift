//
//  HomeViewController.swift
//  Healf-healthFreinds
//
//  Created by 최용헌 on 2/28/24.
//

import UIKit

final class HomeViewController: NaviHelper {
  
  private lazy var postCollectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal
    flowLayout.minimumLineSpacing = 50
    
    let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    view.backgroundColor = .white
    view.clipsToBounds = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    navigationItemSetting()
    
    setupLayout()
    makeUI()
  }
  
  override func navigationItemSetting() {
    let logoImg = UIImage(named: "MainTitleImg")?.withRenderingMode(.alwaysOriginal)
    let logo = UIBarButtonItem(image: logoImg, style: .done, target: nil, action: nil)
    logo.imageInsets = UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 0)
    logo.isEnabled = false
    
    navigationItem.leftBarButtonItem = logo
  }
  
  func setupLayout(){
    [
      postCollectionView
    ].forEach {
      view.addSubview($0)
    }
  }
  
  func makeUI(){
    postCollectionView.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
      $0.height.equalTo(170)
    }
  }
  
  private func registerCell() {
    postCollectionView.delegate = self
    postCollectionView.dataSource = self
    
    postCollectionView.register(PostedCell.self,
                                     forCellWithReuseIdentifier: PostedCell.id)
    
  }
}

// MARK: - collectionView
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      didSelectItemAt indexPath: IndexPath) {
    
    
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostedCell.id, for: indexPath)
    
    
    
    return cell
  }
}


// 셀의 각각의 크기
extension HomeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 250, height: collectionView.frame.height)
  }
}

