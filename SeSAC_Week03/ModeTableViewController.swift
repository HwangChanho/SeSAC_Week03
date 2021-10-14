//
//  ModeTableViewController.swift
//  SeSAC_Week03
//
//  Created by ChanhoHwang on 2021/10/12.
//

import UIKit

class ModeTableViewController: UITableViewController {
    
    let titleList = ["방해 금지 모드", "수면", "업무", "개인 시간"]
    let imageList = ["moon.fill", "bed.double.fill", "lanyardcard.fill", "person.fill"]
    let colorList = ["purple", "orange", "green", "blue"]

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        setUp()
    }
    
    func setUp() {
        titleLabel.text = "집중 모드"
        titleLabel.backgroundColor = .black
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 20)
    }

    
    // MARK: - Table view data source
    
    // default = 1, 섹션 수: numberOfSections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // 섹션 타이틀: titleForHeaderInSection
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "모드 설정" : " "
    }
    
    // 셀의 갯수: numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 4 : 1
    }
    
    // 셀의 디자인 및 데이터처리: cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.backgroundColor = .black
        tableView.separatorColor = .white
        
        // guard 옵셔널에서 자주 사용 Early Exit
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "doNotDisturb") else {
            return UITableViewCell() // 빈 인스턴스
        }

        
        if indexPath.section == 0 {
            cell.imageView?.image = UIImage(systemName: imageList[indexPath.row])
            cell.imageView?.backgroundColor = .darkGray
            cell.imageView?.tintColor = UIColor(named: colorList[indexPath.row])
            
            cell.textLabel?.text = titleList[indexPath.row]
            cell.textLabel?.textColor = .white
            cell.textLabel?.backgroundColor = .darkGray
            cell.textLabel?.font = .systemFont(ofSize: 10)
            
//            cell.detailTextLabel?.text = "켬"
//            cell.detailTextLabel?.textAlignment = .right
//            cell.detailTextLabel?.textColor = .white
            
            cell.backgroundColor = .darkGray
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
        } else {
            cell.textLabel?.text = "모든 기기에서 공유"
            cell.textLabel?.textColor = .white
            cell.textLabel?.backgroundColor = .darkGray
            cell.textLabel?.font = .systemFont(ofSize: 10)
            
            cell.backgroundColor = .darkGray
            cell.accessoryType = .disclosureIndicator
            cell.contentView.backgroundColor = UIColor.darkGray
            cell.selectionStyle = .none
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
        if indexPath.section == 0 && indexPath.row == 3 {
            performSegue(withIdentifier: "SetTable", sender: nil)
        }
    }
    
    
}
