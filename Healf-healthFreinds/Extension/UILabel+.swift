//
//  UILabel+.swift
//  Healf-healthFreinds
//
//  Created by 최용헌 on 2024/02/26.
//

import UIKit

class BasePaddingLabel: UILabel {
  private var padding = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
  convenience init(padding: UIEdgeInsets) {
    self.init()
    self.padding = padding
  }
  override func drawText(in rect: CGRect) {
    super.drawText(in: rect.inset(by: padding))
  }
  
  override var intrinsicContentSize: CGSize {
    var contentSize = super.intrinsicContentSize
    contentSize.height += padding.top + padding.bottom
    contentSize.width += padding.left + padding.right
    
    return contentSize
  }
}

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
