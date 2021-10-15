//
//  SetTableViewController.swift
//  SeSAC_Week03
//
//  Created by ChanhoHwang on 2021/10/12.
//

import UIKit

class SetTableViewController: UITableViewController {
    
    let titleList = ["공지사항", "실험실", "버전 정보"]
    let titleList2 = ["개인/보안", "알림", "채팅", "멀티프로필"]
    let titleList3 = ["고객센터/도움말"]

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        setUp()
        
    }
    
    func setUp() {
        titleLabel.text = "설정"
        titleLabel.backgroundColor = .black
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 20)
    }

    // MARK: - Table view data source

    // default = 1, 섹션 수: numberOfSections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // 섹션 타이틀: titleForHeaderInSection
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionTitle = ""
        
        switch section {
        case 0:
            sectionTitle = "전체 설정"
        case 1:
            sectionTitle = "개인 설정"
        case 2:
            sectionTitle = "기타"
        default:
            print("error")
        }
        return sectionTitle
    }
    
    // 셀의 갯수: numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 4
        case 2:
            return 1
        default:
            print("error")
        }
        return 0
    }
    
    // 셀의 디자인 및 데이터처리: cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.backgroundColor = .black
        tableView.separatorColor = .white
        
        // guard 옵셔널에서 자주 사용 Early Exit
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "setTableView") else {
            return UITableViewCell() // 빈 인스턴스
        }

        if indexPath.section == 0 {
            cell.textLabel?.text = titleList[indexPath.row]
            cell.textLabel?.textColor = .white
            cell.textLabel?.backgroundColor = .black
            cell.textLabel?.font = .systemFont(ofSize: 10)
            
//            cell.detailTextLabel?.text = "켬"
//            cell.detailTextLabel?.textAlignment = .right
//            cell.detailTextLabel?.textColor = .white
        
            cell.backgroundColor = .black
        } else if indexPath.section == 1 {
            cell.textLabel?.text = titleList2[indexPath.row]
            cell.textLabel?.textColor = .white
            cell.textLabel?.backgroundColor = .black
            cell.textLabel?.font = .systemFont(ofSize: 10)
            
            cell.backgroundColor = .black
        } else {
            cell.textLabel?.text = titleList3[indexPath.row]
            cell.textLabel?.textColor = .white
            cell.textLabel?.backgroundColor = .black
            cell.textLabel?.font = .systemFont(ofSize: 10)
            
            cell.backgroundColor = .black
        }
        
        return cell
    }

    
    // 셀의 높이: heightForRowAt default = 44 or storyboard
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // return indexPath.section == 0 ? 44 : 80
        return 44
    }
    
    // 셀의 편집상태 관리 (on/off 여부): canEditRowAt
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // indexPath.section == 0 ? false : true
        return true
    }
    
    // 셀 삭제시 동작 구현: editingStyle
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        //        if editingStyle == .delete {
        //            list.remove(at: indexPath.row)
        //            tableView.reloadData()
        //        }
    }
    
    // 특정 row 클릭시 액션
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.section == 0 && indexPath.row == 3 {
//            performSegue(withIdentifier: "SetTable", sender: nil)
//        }
    }

}
