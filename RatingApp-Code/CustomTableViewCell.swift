//
//  CustomTableViewCell.swift
//  RatingApp-Code
//
//  Created by 정유진 on 2022/08/01.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    let myTitle = UILabel()
    let mySubTitle = UILabel()
    let myImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(myTitle)
        contentView.addSubview(mySubTitle)
        contentView.addSubview(myImageView)
        
        
        myTitle.frame = CGRect(x: 12,
                               y: 2,
                               width: 0,
                               height: 0)
        mySubTitle.frame = CGRect(x: 12, y: 24, width: 0, height: 0)
        
        mySubTitle.text = "Subtitle"
        mySubTitle.font = UIFont.systemFont(ofSize: 13)
        myImageView.frame = CGRect(x: contentView.frame.maxX - 50, y: contentView.frame.midY - 12, width: 80, height: 24)
      
        myImageView.contentMode = .scaleAspectFit
        
    }
    
    
    required  init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
