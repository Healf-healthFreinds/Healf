//
//  registerEmailViewController.swift
//  Healf-healthFreinds
//
//  Created by 최용헌 on 2024/02/05.
//

import UIKit

import SnapKit
import Then

final class RegisterEmailViewController: NaviHelper {
  let uihelper = UIHelper.shared
  
  private lazy var titleLabel = UILabel().then {
    $0.text = "사용하실 아이디를 입력해주세요."
    $0.font = .boldSystemFont(ofSize: 20)
  }
  private lazy var emailTextField = uihelper.createLoginTextField("아이디를 입력해주세요.")
  private lazy var nextButton = uihelper.createHealfButton("다음", .unableGray, .white)
  
  // MARK: - viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    navigationItemSetting()
    
    setupLayout()
    makeUI()
  }
  
  // MARK: - setupLayout
  func setupLayout(){
    [
      titleLabel,
      emailTextField,
      nextButton
    ].forEach {
      view.addSubview($0)
    }
  }
  
  // MARK: - makeUI
  func makeUI(){
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(50)
      $0.centerX.equalToSuperview()
    }
    
    emailTextField.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(70)
      $0.leading.equalToSuperview().offset(30)
      $0.trailing.equalToSuperview().offset(-30)
    }
    
    nextButton.snp.makeConstraints {
      $0.top.equalTo(emailTextField.snp.bottom).offset(50)
      $0.leading.equalToSuperview().offset(30)
      $0.trailing.equalToSuperview().offset(-30)
      $0.height.equalTo(48)
    }
  }
}
