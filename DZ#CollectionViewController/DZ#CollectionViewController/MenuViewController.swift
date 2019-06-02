//
//  ViewController.swift
//  DZ#CollectionViewController
//
//  Created by Анастасия Шахлан on 02/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var buttonLightLevel: UIButton!
    var buttonHardLevel : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        
    }
    
    func prepareUI() {

        self.view.backgroundColor = .white
        
        buttonLightLevel = UIButton(type: .system)
        buttonLightLevel.setTitle("Легкий уровень", for: .normal)
        buttonLightLevel.sizeToFit()
        buttonLightLevel.center = CGPoint(x: view.center.x, y: view.center.y - 30)
        buttonLightLevel.accessibilityIdentifier = "buttonLightLevel"
        buttonLightLevel.addTarget(self, action: #selector(openGame(sender:)), for: .touchUpInside)
        view.addSubview(buttonLightLevel)
        
        buttonHardLevel = UIButton(type: .system)
        buttonHardLevel.setTitle("Сложный уровень", for: .normal)
        buttonHardLevel.sizeToFit()
        buttonHardLevel.center = CGPoint(x: view.center.x, y: view.center.y + 30)
        buttonHardLevel.accessibilityIdentifier = "buttonHardLevel"
        buttonHardLevel.addTarget(self, action: #selector(openGame(sender:)), for: .touchUpInside)
        view.addSubview(buttonHardLevel)
        
    }
    
    @objc
    func openGame(sender: UIButton) {
        let vc = GameViewController()
        
        if sender.accessibilityIdentifier == "buttonLightLevel" {
            vc.level = .light
        } else {
            vc.level = .hard
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}

