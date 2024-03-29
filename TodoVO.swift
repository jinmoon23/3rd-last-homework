//
//  TodoVO.swift
//  Please last 3rd-Homework
//
//  Created by 최진문 on 2024/03/26.
//

import UIKit

class TodoVO {
    var todo: String
    var iscompleted: Bool
    init(todo: String, iscompleted: Bool) {
        self.todo = todo
        self.iscompleted = iscompleted
    }
}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
    func removeStrikethrough() -> NSAttributedString {
           let attributeString = NSMutableAttributedString(string: self)
           attributeString.removeStrikethrough()
           return attributeString
       }
}
extension NSMutableAttributedString {
    func removeStrikethrough() {
        removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSMakeRange(0, length))
    }
}
