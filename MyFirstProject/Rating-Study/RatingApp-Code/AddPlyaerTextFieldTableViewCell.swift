//
//  AddPlyaerTextFieldTableViewCell.swift
//  RatingApp-Code
//
//  Created by 정유진 on 2022/08/03.
//

import UIKit

class AddPlyaerTextFieldTableViewCell: UITableViewCell {
    
    static let identifier = "AddPlayerTextFieldTableViewCell"
  let textField = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(textField)
        textField.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
    }
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
