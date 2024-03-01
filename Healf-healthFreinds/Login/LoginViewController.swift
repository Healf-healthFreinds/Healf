//
//  ViewController.swift
//  Healf-healthFreinds
//
//  Created by 최용헌 on 2024/01/11.
//

import UIKit

import SnapKit
import Then

final class LoginViewController: UIViewController {
  let uihelper = UIHelper.shared
  
  private lazy var titleLabel = UILabel().then {
    $0.text = "나만을 위한 헬스 친구 찾기,\nHeal F 🏋🏻"
    $0.font = .boldSystemFont(ofSize: 16)
    $0.numberOfLines = 0
    $0.setLineSpacing(spacing: 10)
  }
  
  private lazy var emailTextField = uihelper.createLoginTextField("아이디 또는 이메일")
  private lazy var passwordTextField = uihelper.createLoginTextField("비밀번호")
  
  private lazy var loginButton = uihelper.createHealfButton("로그인", .mainBlue, .white)
  private lazy var kakaoLoginButton = uihelper.createHealfButton("카카오 로그인", .kakaoYellow, .black)
  private lazy var naverLoginButton = uihelper.createHealfButton("네이버 로그인", .naverGreen, .white)
  
  private lazy var signupButton = UIButton().then {
    $0.setTitle("이메일로 회원가입", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.setUnderline()
    $0.addAction(UIAction { _ in
      self.signupButtonTapped()
    }, for: .touchUpInside)
  }
  
  // MARK: - viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    setupLayout()
    makeUI()
  }
  
  // MARK: - setupLayout
  func setupLayout(){
    [
      titleLabel,
      emailTextField,
      passwordTextField,
      loginButton,
      kakaoLoginButton,
      naverLoginButton,
      signupButton
    ].forEach {
      view.addSubview($0)
    }
  }
  
  // MARK: - makeUI
  func makeUI(){
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(150)
      $0.leading.equalToSuperview().offset(20)
    }
    
    emailTextField.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(100)
      $0.leading.equalTo(titleLabel.snp.leading)
      $0.trailing.equalToSuperview().offset(-20)
    }
    
    passwordTextField.snp.makeConstraints {
      $0.top.equalTo(emailTextField.snp.bottom).offset(50)
      $0.leading.trailing.equalTo(emailTextField)
    }
    
    loginButton.snp.makeConstraints {
      $0.top.equalTo(passwordTextField.snp.bottom).offset(40)
      $0.leading.trailing.equalTo(emailTextField)
      $0.height.equalTo(48)
    }
    
    kakaoLoginButton.snp.makeConstraints {
      $0.top.equalTo(loginButton.snp.bottom).offset(60)
      $0.leading.trailing.equalTo(emailTextField)
      $0.height.equalTo(48)
    }
    
    naverLoginButton.snp.makeConstraints {
      $0.top.equalTo(kakaoLoginButton.snp.bottom).offset(20)
      $0.leading.trailing.equalTo(emailTextField)
      $0.height.equalTo(48)
    }
    
    signupButton.snp.makeConstraints {
      $0.top.equalTo(naverLoginButton.snp.bottom).offset(20)
      $0.centerX.equalTo(naverLoginButton)
    }
  }
  
  // MARK: - signupButtonTapped
  func signupButtonTapped(){
    print("1")
    let registerEmailVC = RegisterEmailViewController()
    let navigationVC = UINavigationController(rootViewController: registerEmailVC)
    navigationVC.modalPresentationStyle = .fullScreen
    
    self.present(navigationVC, animated: true, completion: nil)
  }
}

