//
//  registerEmailViewController.swift
//  Healf-healthFreinds
//
//  Created by 최용헌 on 2024/02/05.
//

import UIKit

import SnapKit
import Then

import FirebaseAuth

final class RegisterEmailViewController: NaviHelper {
  
  private lazy var titleLabel = UIHelper.shared.createSingleLineLabel("사용하실 아이디를 입력해주세요.")
  private lazy var emailTextField = UIHelper.shared.createLoginTextField("이메일을 입력해주세요.")
  private lazy var passwordTextField = UIHelper.shared.createLoginTextField("비밀번호를 입력해주세요.")
  private lazy var nextButton = UIHelper.shared.createHealfButton("다음", .unableGray, .white)
  
  // MARK: - viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    navigationItemSetting()
    
    setupLayout()
    makeUI()
  }
  
  override func leftButtonTapped(_ sender: UIBarButtonItem) {
    dismiss(animated: true)
  }
  
  // MARK: - setupLayout
  func setupLayout(){
    [
      titleLabel,
      emailTextField,
      passwordTextField,
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
    
    passwordTextField.snp.makeConstraints {
      $0.top.equalTo(emailTextField.snp.bottom).offset(10)
      $0.leading.trailing.equalTo(emailTextField)
    }
    
    nextButton.addAction(UIAction { _ in
      self.completeSignup()
    }, for: .touchUpInside)
    nextButton.snp.makeConstraints {
      $0.top.equalTo(passwordTextField.snp.bottom).offset(50)
      $0.leading.equalToSuperview().offset(30)
      $0.trailing.equalToSuperview().offset(-30)
      $0.height.equalTo(48)
    }
  }
  
  func completeSignup(){
    guard let email = emailTextField.text,
          let password = passwordTextField.text else { return }
    
    print("이메일: \(email)")
    print("비밀번호: \(password)")
    
    Auth.auth().createUser(withEmail: email,
                           password: password) { result, error in
      if let error = error { print(error) }
      if let result = result {
        print(result)
        
        let completeVC = CompleSignupViewController()
        self.navigationController?.pushViewController(completeVC, animated: true)
      }
    }
  }
}
