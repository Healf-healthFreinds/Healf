//
//  UIHelper.swift
//  Healf-healthFreinds
//
//  Created by 최용헌 on 2024/02/26.
//

import UIKit

import Then

final class UIHelper {
  static let shared = UIHelper()
  
  func createHealfButton(_ title: String, _ color: UIColor,
                         _ titleColor: UIColor) -> UIButton {
   let button = UIButton()
    button.setTitle(title, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 15)
    button.setTitleColor(titleColor, for: .normal )
    button.backgroundColor = color
    button.layer.cornerRadius = 10
  
    return button
  }
  
  func createLoginTextField(_ placeHolder: String) -> UITextField {
    let textField = UITextField()
    textField.placeholder = placeHolder
    textField.font = .systemFont(ofSize: 15)
    textField.addBottomLine(withColor: .underlineGray, height: 1)
    
    return textField
  }
}
