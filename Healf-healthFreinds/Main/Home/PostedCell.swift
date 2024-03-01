
import UIKit

import SnapKit

final class PostedCell: UICollectionViewCell {
  
  static var id: String { NSStringFromClass(Self.self).components(separatedBy: ".").last ?? "" }

  private lazy var locationLabel: BasePaddingLabel = {
    let label = BasePaddingLabel(padding: UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8))
    label.text = "인천"
    label.layer.cornerRadius = 5
    label.font = .boldSystemFont(ofSize: 12)
    label.clipsToBounds = true
    return label
  }()
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 16)
    label.textColor = .black
    return label
  }()
  
  private lazy var profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 15
    imageView.image = UIImage(named: "PersonImg")
    imageView.contentMode = .left
    imageView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
    return imageView
  }()
  
  private lazy var countMemeberLabel: UILabel = {
    let label = UILabel()
    label.text = "/14"
    label.font = .boldSystemFont(ofSize: 14)
    return label
  }()
  
  // 성별 관련
  private lazy var genderImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "GenderMixImg")
    
    return imageView
  }()
  
  private lazy var genderLabel: UILabel =  {
    let label = UILabel()
    label.text = "/14"
    label.font = .boldSystemFont(ofSize: 14)
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setViewShadow(backView: self)
    addSubviews()
    
    configure()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  private func addSubviews() {
    [
      locationLabel,
      titleLabel,
      profileImageView,
      countMemeberLabel,
      genderImageView,
      genderLabel
    ].forEach {
      addSubview($0)
    }
  }
  
  private func configure() {
    locationLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(20)
      $0.leading.equalToSuperview().offset(20)
    }
    
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(locationLabel.snp.bottom).offset(10)
      $0.leading.equalTo(locationLabel)
    }
    
    profileImageView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(20)
      $0.leading.equalTo(titleLabel)
    }
    
    countMemeberLabel.snp.makeConstraints {
      $0.top.equalTo(profileImageView)
      $0.leading.equalTo(profileImageView.snp.trailing).offset(5)
    }
    
    genderImageView.snp.makeConstraints {
      $0.top.equalTo(profileImageView)
      $0.leading.equalTo(profileImageView.snp.trailing).offset(50)
    }
    
    genderLabel.snp.makeConstraints {
      $0.top.equalTo(profileImageView)
      $0.leading.equalTo(genderImageView.snp.trailing).offset(5)
    }
    
    
    backgroundColor = .white
    
    self.layer.borderWidth = 0.1
    self.layer.borderColor = UIColor.gray.cgColor
    self.layer.cornerRadius = 10
    
  }
  
  
  private func bind() {

  }
  
}


