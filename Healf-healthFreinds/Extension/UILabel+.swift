//
//  UILabel+.swift
//  Healf-healthFreinds
//
//  Created by 최용헌 on 2024/02/26.
//

import UIKit

extension UILabel {
  func setLineSpacing(spacing: CGFloat) {
    guard let text = text else { return }
    
    let attributeString = NSMutableAttributedString(string: text)
    let style = NSMutableParagraphStyle()
    style.lineSpacing = spacing
    attributeString.addAttribute(.paragraphStyle,
                                 value: style,
                                 range: NSRange(location: 0, length: attributeString.length))
    attributedText = attributeString
  }
  
}
