//
//  MyCollectionViewCell.swift
//  CollectionViewLection
//
//  Created by Анастасия Шахлан on 30/05/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    private var label : UILabel!
    var text : String? {
        didSet {
            label.text = text
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label = UILabel()
        contentView.addSubview(label)
        label.frame = contentView.frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.contentView.layer.borderWidth = 4
                self.contentView.layer.borderColor = UIColor.white.cgColor
            } else {
                self.contentView.layer.borderWidth = 0
            }
        }
        
    }
    
}
