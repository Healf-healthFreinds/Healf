//
//  NaviHelper.swift
//  Healf-healthFreinds
//
//  Created by 최용헌 on 2024/02/05.
//
import UIKit

class NaviHelper: UIViewController {

  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - navi 설정
  func navigationItemSetting() {
    let homeImg = UIImage(named: "backButtonImg")?.withRenderingMode(.alwaysOriginal)
    let leftButton = UIBarButtonItem(image: homeImg,
                                     style: .plain,
                                     target: self,
                                     action: #selector(leftButtonTapped))
    
    
    self.navigationController?.navigationBar.barTintColor = .white
    self.navigationController?.navigationBar.backgroundColor = .white
    self.navigationController?.navigationBar.isTranslucent = false
    
    self.navigationItem.leftBarButtonItem = leftButton
//    self.navigationItem.rightBarButtonItem = rightButton
  }
  
  @objc func leftButtonTapped(){
    dismiss(animated: true)
  }
}
