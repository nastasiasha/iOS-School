//
//  Item.swift
//  DZ#CollectionViewController
//
//  Created by Анастасия Шахлан on 02/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

import Foundation
import UIKit

class Item {
    
    public var image: UIImage?
    public var imageBack: UIImage?

    init(image: UIImage?) {
        
        self.image = image
        self.imageBack = UIImage(named:"back")
        
    }
}
