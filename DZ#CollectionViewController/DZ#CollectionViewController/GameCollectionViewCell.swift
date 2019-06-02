//
//  GameCollectionViewCell.swift
//  DZ#CollectionViewController
//
//  Created by Анастасия Шахлан on 02/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    var imageView : UIImageView!
    var imageViewBack : UIImageView!
    var faceSide : Bool = true
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        imageView = UIImageView()
        imageView.frame = contentView.frame
        contentView.addSubview(imageView)
        
        imageViewBack = UIImageView()
        imageViewBack.frame = contentView.frame
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func flipAnimation(_ compl: @escaping (()->())) {
        
        UIView.transition(with: self.contentView , duration: 1.5, options: .transitionFlipFromRight, animations: {
            
            if self.faceSide {
                
                self.imageView.removeFromSuperview()
                self.contentView.addSubview(self.imageViewBack)
                
            } else {
                
                self.imageViewBack.removeFromSuperview()
                self.contentView.addSubview(self.imageView)
                
            }

            self.faceSide = !self.faceSide

        }, completion: {(finished:Bool) in
            compl()
        })

    }

    
}
