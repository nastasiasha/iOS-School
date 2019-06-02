//
//  MyCollectionViewController.swift
//  CollectionViewLection
//
//  Created by Анастасия Шахлан on 30/05/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

import UIKit

class MyCollectionViewController: UIViewController {
    
    var collectionView : UICollectionView!
    
    var items = [Item]()
    
    let reuseID = "reuseID"
    
    var button : UIButton!
    var deleteButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
//        layout.minimumLineSpacing = 1
//        layout.minimumInteritemSpacing = 0
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: reuseID)
        
        items = [Item(name: "hello", color: .red), Item(name: "it's", color: .blue), Item(name: "me", color: .gray), Item(name: "ana", color: .green), Item(name: "sta", color: .yellow), Item(name: "sia", color: .brown)]
        
        button = UIButton(type: .contactAdd)
        button.addTarget(self, action: #selector(addCell), for: .touchUpInside)
        button.center = CGPoint(x: self.view.frame.maxX - 60, y: self.view.frame.maxY - 60)
        view.addSubview(button)
        
        self.view.addSubview(collectionView)
        view.addSubview(button)
        
        deleteButton = UIButton(type: .system)
        deleteButton.setTitle("❌", for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteCell), for: .touchUpInside)
        deleteButton.sizeToFit()
        deleteButton.center = CGPoint(x: self.view.frame.maxX - 60, y: self.view.frame.maxY - 100)
        view.addSubview(deleteButton)
        
        collectionView.allowsMultipleSelection = true
        
    }
    
    
    @objc func addCell () {
        let item = Item(name: "item \(items.count)", color: .blue)
        items.append(item)
        let indexPath = IndexPath(item: items.count-1, section: 0)
        collectionView.insertItems(at: [indexPath])
        
    }
    
    @objc func deleteCell () {

        guard let indexPaths = collectionView.indexPathsForSelectedItems else { return}
        let indexesToDelete = indexPaths.map {(indexPath) -> Int in
            indexPath.item
        }.sorted().reversed()
        
        for indexToDel in indexesToDelete {
            items.remove(at: indexToDel)
        }
        
        collectionView.deleteItems(at: indexPaths)
        
    }


}

extension MyCollectionViewController : UICollectionViewDelegate {
   
}
extension MyCollectionViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  reuseID, for: indexPath) as! MyCollectionViewCell
        let item = items[indexPath.item]
        
        cell.contentView.backgroundColor = item.color
        cell.text = item.name
        
        return cell
    }
    
    
}
