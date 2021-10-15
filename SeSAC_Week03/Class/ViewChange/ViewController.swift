//
//  ViewController.swift
//  SeSAC_Week03
//
//  Created by ChanhoHwang on 2021/10/12.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked(_:)))
        
        // navigationItem.leftBarButtonItem = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(closeButtonClicked(_:)))
        
    }
    
    // present - Dismiss
    @IBAction func memoButtonClicked(_ sender: UIButton) {
        
        // 1. 스토리보드 특정
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2. 스토리보드 내 많은 뷰 컨트롤러 중 전환하고자 하는 뷰컨트롤러 가저오기
        let vc = storyBoard.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController // 강제해제 연산자를 통해 매칭
        
        // 2-1. 네비게이션 컨트롤러 임베드
        let nav = UINavigationController(rootViewController: vc)
        
        // 옵션
        // vc.modalTransitionStyle = .partialCurl
        nav.modalPresentationStyle = .fullScreen
        
        // 3. present
        // present(vc, animated: true, completion: nil)
        self.present(nav, animated: true, completion: nil)
    }
    
    // push - pop
    @IBAction func boxOfficeButtonClicked(_ sender: UIButton) {
        // 1. 스토리보드 특정
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2. 스토리보드 내 많은 뷰 컨트롤러 중 전환하고자 하는 뷰컨트롤러 가저오기
        // 동일 스토리뷰일떄
        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "BoxOfficeTabelViewController") as! BoxOfficeTabelViewController
        let vc = storyBoard.instantiateViewController(withIdentifier: "BoxOfficeTabelViewController") as! BoxOfficeTabelViewController // 강제해제 연산자를 통해 매칭
        
        // Push: 스토리보드에서 네비게이션 컨트롤러가 임베드 되어 있는 지 확인!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func closeButtonClicked(_: Any) { // push 코드
        self.navigationController?.popViewController(animated: true)
    }
}

