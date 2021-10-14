//
//  TableViewController.swift
//  SeSAC_Week03
//
//  Created by ChanhoHwang on 2021/10/12.
//

import UIKit

// 테이블 뷰 컨트롤러
class TableViewController: UITableViewController {
    
    var list: [Memo] = [Memo]() {
        didSet {
            tableView.reloadData()
        }
    }

    @IBOutlet weak var seg: UISegmentedControl!
    @IBOutlet weak var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITableView.automaticDimension
    }
    
    // 등록
    @IBAction func buttonTapped(_ sender: UIButton) {
        if let text = memoTextView.text {
            
            let segIndex = seg.selectedSegmentIndex
            let segCate = Category(rawValue: segIndex) ?? .others
            let memo = Memo(content: text, category: segCate.rawValue)
            
            list.append(memo)
            // tableView.reloadData()
        } else {
            print("error")
        }
    }
    
    func loadData() {
        let userDefaults = UserDefaults.standard
        
        if let data = userDefaults.object(forKey: "momoList") as? [[String:Any]] { // 타입이 같니?
            var memo = [Memo]()
            
            for datum in data {
                guard let category = datum["category"] as? Int else {
                    // alert 오류발생 인지
                    return }
                guard let content = datum["content"] as? String else { return }
                
                let enumCategory = Category(rawValue: category) ?? .others
                
                // memo.append(Memo(content: content, category: enumCategory))
            }
        
            self.list = memo
        }
    }
    
    func saveData() {
        var memo: [[String:Any]] = []
        
        for i in list {
            let data: [String:Any] = [
                // "category": i.category.rawValue,
                "content": i.content
            ]
            
            memo.append(data)
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(memo, forKey: "memoList")
        
        tableView.reloadData()
    }
    
    // default = 1, 섹션 수: numberOfSections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // 섹션 타이틀: titleForHeaderInSection
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "섹션 타이틀"
    }
    
    // 셀의 갯수: numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section == 0 ? 2 : list.count
    }
    
    // 셀의 디자인 및 데이터처리: cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        
        // guard 옵셔널에서 자주 사용 Early Exit
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell") else {
            return UITableViewCell() // 빈 인스턴스
        }
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "첫번쨰 섹션입니다 - \(indexPath)"
            cell.textLabel?.textColor = .brown
            cell.imageView?.image = nil
            cell.detailTextLabel?.text = nil
        } else {
            
            let row = list[indexPath.row]
            
            cell.textLabel?.text = row.content
            cell.detailTextLabel?.text = row.category.description
            cell.detailTextLabel?.font = .boldSystemFont(ofSize: 15)
            cell.textLabel?.textColor = .blue
            cell.textLabel?.font = .boldSystemFont(ofSize: 13)
            
//            switch row.category {
//            case .business:
//                cell.imageView?.image = UIImage(systemName: "building.2")
//            case .personal:
//                cell.imageView?.image = UIImage(systemName: "person")
//            case .others:
//                cell.imageView?.image = UIImage(systemName: "square.and.pencil")
//            }
            
            cell.imageView?.tintColor = .red
        }
        
        return cell
    }
    
    // 셀의 높이: heightForRowAt default = 44 or storyboard
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // return indexPath.section == 0 ? 44 : 80
        return indexPath.row == 0 ? 44 : 80
    }
    
    // 셀의 편집상태 관리 (on/off 여부): canEditRowAt
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 0 ? false : true
    }
    
    // 셀 삭제시 동작 구현: editingStyle
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            // tableView.reloadData()
        }
    }
}
