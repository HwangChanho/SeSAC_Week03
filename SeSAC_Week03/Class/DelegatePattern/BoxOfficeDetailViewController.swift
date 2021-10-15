//
//  BoxOfficeDetailViewController.swift
//  SeSAC_Week03
//
//  Created by ChanhoHwang on 2021/10/15.
//

import UIKit

class BoxOfficeDetailViewController: UIViewController, UITextViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var overViewTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TextField InputView
        let dateView = UIPickerView()
        dateView.delegate = self
        dateView.dataSource = self
        titleTextField.inputView = dateView

        overViewTextView.delegate.self
        
        
        // 텍스트뷰 플레이스 홀더: 글자, 글자 색상
        
        overViewTextView.text = "이 곳에 줄거리를 남겨보세요"
        overViewTextView.textColor = .lightGray
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "test"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            overViewTextView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
    }
    
    
    
}
