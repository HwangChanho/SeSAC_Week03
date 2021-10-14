//
//  memo.swift
//  SeSAC_Week03
//
//  Created by ChanhoHwang on 2021/10/14.
//

import Foundation

enum Category: Int {
    case business, personal, others
    
    var description: String {
        switch self {
        case .business:
            return "업무"
        case .personal:
            return "개인"
        case .others:
            return "기타"
        }
    }
}

struct Memo {
    var content: String
    var category: Int
}
