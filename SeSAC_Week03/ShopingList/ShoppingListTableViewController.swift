//
//  ShoppingListTableViewController.swift
//  SeSAC_Week03
//
//  Created by ChanhoHwang on 2021/10/14.
//

import UIKit

class ShoppingListTableViewController: UITableViewController, ShoppingListTableViewCellDelegate {
    
    func selectedFavouriteBtn(index: Int) {
        if list[index].favourite {
            list[index].favourite = false
        } else {
            list[index].favourite = true
        }
        saveData()
    }
    
    func selectedCheckBtn(index: Int) {
        if list[index].buyCheck {
            list[index].buyCheck = false
        } else {
            list[index].buyCheck = true
        }
        saveData()
    }
    // let menuList = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    var list: [ListInfo] = [ListInfo]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    let textField = UITextField()
    let headerView = UIView()
    let insertButton = UIButton()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setup()
        loadData()
    }
    
    func setup() {
        titleLabel.text = "쇼핑"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.backgroundColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        textField.backgroundColor = .systemGray6
        textField.textColor = .systemGray2
        textField.font = .systemFont(ofSize: 15)
        textField.text = "무엇을 구매하실 건가요?"
        textField.layer.cornerRadius = 6
        textField.addLeftPadding()
        textField.clearsOnBeginEditing = true
        
        insertButton.setTitle("추가", for: .normal)
        insertButton.setTitleColor(.black, for: .normal)
        insertButton.backgroundColor = .systemGray5
        insertButton.layer.cornerRadius = 6
        insertButton.addTarget(self, action: #selector(add(_:)), for: .touchUpInside)
    }
    
    func loadData() {
        let userDefaults = UserDefaults.standard
        
        if let data = userDefaults.object(forKey: Constants.userDefaultKey.userInfo) as? [[String:Any]] { // 타입이 같니?
            var temp = [ListInfo]()
            
            for datum in data {
                guard let shoppingList = datum["shoppingList"] as? String else { return }
                guard let buyCheck = datum["buyCheck"] as? Bool else { return }
                guard let favourite = datum["favourite"] as? Bool else { return }
                
                temp.append(ListInfo(shoppingList: shoppingList, buyCheck: buyCheck, favourite: favourite))
            }
            self.list = temp
        }
    }
    
    func saveData() {
        var temp: [[String:Any]] = []

        for i in list {
            let data: [String:Any] = [
                "shoppingList": i.shoppingList,
                "buyCheck": i.buyCheck,
                "favourite": i.favourite
            ]
            
            temp.append(data)
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(temp, forKey: Constants.userDefaultKey.userInfo)
        
        tableView.reloadData()
    }
    
    @objc func add(_: Any) {
        if textField.text != nil {
            list.append(ListInfo(shoppingList: textField.text!, buyCheck: false, favourite: false))
            saveData()
        }
    }
    
    // MARK: - Table view data source
    
    // header view start
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerView.addSubview(textField)
        headerView.addSubview(insertButton)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: headerView.topAnchor),
            textField.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 10),
            textField.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            textField.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -10)
        ])
        
        insertButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            insertButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 15),
            insertButton.widthAnchor.constraint(equalToConstant: 50),
            insertButton.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -20),
            insertButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -15),
        ])
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    // header view end
    
    // default = 1, 섹션 수: numberOfSections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.backgroundColor = .white
        
        // 타입 캐스팅
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingView", for: indexPath) as? ShoppingListTableViewCell else { return UITableViewCell() }
        
        cell.index = indexPath.row
        cell.delegate = self       // 셀의 인덱스를 전달?
        
        cell.accessoryType = .none
        
        let row = list[indexPath.row]
        
        if row.buyCheck == true {
            cell.checkBoxButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            cell.checkBoxButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        cell.checkBoxButton.setTitle("", for: .normal)
        cell.checkBoxButton.tintColor = .black
        
        cell.textShowLabel.text = row.shoppingList
        cell.textShowLabel.textColor = .black
        cell.textShowLabel.font = .systemFont(ofSize: 10)
        cell.textShowLabel.sizeToFit()
        
        if row.favourite == true {
            cell.favouriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            cell.favouriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
        cell.favouriteButton.setTitle("", for: .normal)
        cell.favouriteButton.tintColor = .black
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 16
    }
    
    // 셀의 편집상태 관리 (on/off 여부): canEditRowAt
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // indexPath.section == 0 ? false : true
        return true
    }
    
    // 셀 삭제시 동작 구현: editingStyle
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        saveData()
    }
    
    // 특정 row 클릭시 액션
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 3 {
            performSegue(withIdentifier: "SetTable", sender: nil)
        }
    }
}

extension UITextField { // 왼쪽 값 패딩을 위해 사용
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height)) // 간격
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always // 텍스트필드 왼쪽의 안 보이는 뷰를 나타내줌
    }
}
