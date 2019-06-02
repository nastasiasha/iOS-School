//
//  GameViewController.swift
//  DZ#CollectionViewController
//
//  Created by Анастасия Шахлан on 02/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    // уровень сложности
    var level : Level! = nil
    
    // идентификатор для ячеек
    let reuseId = "reuseId"
    
    // массив с объектами, содержащими инф-ю для ячеек
    var items : [Item] = []
    
    
    var collectionView: UICollectionView!
    
    // количество ячеек в зависимости от уровня сложности
    var itemsCountInHardLevel : Int {
        if level == .light {
            return 12
        } else {
            return 24
        }
    }
    
    // в массиве хранятся индексы выбранных ячеек
    var selectedItemsByIndexPath : [IndexPath] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // настраиваем лейаут
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.scrollDirection = .vertical
        
        // настраиваем collectionView
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(GameCollectionViewCell.self, forCellWithReuseIdentifier: reuseId)
        collectionView.delegate = self
        collectionView.dataSource = self
        self.view.addSubview(collectionView)
        collectionView.allowsMultipleSelection = true
        collectionView.backgroundColor = .white
        
        // заполняем массив объектов
        makeItems()
        
    }
    
    func makeItems() {
        
        // заполняем по 2 объекта сразу
        for i in 1...itemsCountInHardLevel/2 {
            let image = UIImage(named: "\(i)")
            items.append(Item(image: image))
            items.append(Item(image: image))
        }
        
        // перемешиваем
        items = items.shuffled()
        
    }
    
}

extension GameViewController : UICollectionViewDelegate {
    
}
extension GameViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return items.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // создаем ячейку
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! GameCollectionViewCell
        
        cell.imageView.image = items[indexPath.item].image
        cell.imageViewBack.image = items[indexPath.item].imageBack

        // делаем ячейку неактивной
        cell.isUserInteractionEnabled = false
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        (collectionView.cellForItem(at: indexPath) as? GameCollectionViewCell)?.flipAnimation{
            
            // заносим ячейку в число выбранных
            if indexPath != self.selectedItemsByIndexPath.first {
                self.selectedItemsByIndexPath.append(indexPath)
            }
            
            // если выбрано две ячейки
            if self.selectedItemsByIndexPath.count == 2 {
                // проверяем выбраны ли ячейки с одинаковыми картинкам
                self.areSelectedItemsEqual()
                // в любом случае, теперь обе ячейки будут невыбранными
                self.selectedItemsByIndexPath.removeAll()
            }
        }
        

    }
    
    func areSelectedItemsEqual() {
        
        // берем две выбранные ячейки
        let itemOne = collectionView.cellForItem(at: selectedItemsByIndexPath[0]) as? GameCollectionViewCell
        let itemTwo = collectionView.cellForItem(at: selectedItemsByIndexPath[1])  as? GameCollectionViewCell
        
        // проверяем, равны ли изображения на них
        if itemOne?.imageView.image == itemTwo?.imageView.image {

            // равны, значит делаем ячейки неактивными больше
            setDisableItems(one: itemOne, two: itemTwo)
            //setDisableItems(one: &itemOne, two: &itemTwo)
            
        } else {
            // не равны, значит переворачиваем обратно
            turnItems(one: itemOne, two: itemTwo)
        }
    }
    func setDisableItems (one: GameCollectionViewCell?, two: GameCollectionViewCell?) {
        
        one?.isUserInteractionEnabled = false
        one?.imageView.alpha = 0.5
        
        two?.isUserInteractionEnabled = false
        two?.imageView.alpha = 0.5
    }
    
//    func setDisableItems(one: inout GameCollectionViewCell?, two: inout GameCollectionViewCell?) {
//
//        one?.isUserInteractionEnabled = false
//        one?.imageView.alpha = 0.5
//
//        two?.isUserInteractionEnabled = false
//        two?.imageView.alpha = 0.5
//
//    }
    
    func turnItems (one: GameCollectionViewCell?, two: GameCollectionViewCell?) {
        one?.flipAnimation{}
        two?.flipAnimation{}
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        // чтобы не замирал интерфейс:
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
            for cell in self.collectionView.visibleCells as! [GameCollectionViewCell] {
                cell.flipAnimation{}
                // делаем ячейку активной
                cell.isUserInteractionEnabled = true
            }
        })
    }
    
    

}
