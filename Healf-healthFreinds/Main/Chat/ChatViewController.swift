//
//  ChatViewController.swift
//  Healf-healthFreinds
//
//  Created by 최용헌 on 3/2/24.
//

import UIKit

final class ChatViewController: NaviHelper {
  private let searchBar = UISearchBar.createSearchBar(placeholder: "원하는 내용을 검색하세요.")
  
  private lazy var chatTableView: UITableView = {
    let tableView = UITableView()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(ChatCell.self, forCellReuseIdentifier: ChatCell.cellId)
    tableView.rowHeight = UITableView.automaticDimension
    
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    navigationItemSetting()
    
    setupLayout()
    makeUI()
  }
  
  override func navigationItemSetting() {
    redesignNavigation("ChatTitleImg")
  }
  
  func setupLayout(){
    [
      searchBar,
      chatTableView
    ].forEach {
      view.addSubview($0)
    }
  }
  
  func makeUI(){
    searchBar.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.leading.equalToSuperview().offset(20)
      $0.trailing.equalToSuperview().offset(-20)
    }
    
    chatTableView.snp.makeConstraints {
      $0.top.equalTo(searchBar.snp.bottom).offset(20)
      $0.leading.trailing.bottom.equalToSuperview()
//      $0.height.equalTo(120)
    }
  }
}


extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ChatCell.cellId,
                                             for: indexPath) as! ChatCell
    
    
    return cell
  }
  
}
