//
//  ViewController.swift
//  CollectionViewLection
//
//  Created by Анастасия Шахлан on 30/05/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var scrollView : UIScrollView!
    var imageView : UIImageView!
    var button : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        
        scrollView = UIScrollView()
        imageView = UIImageView(image: #imageLiteral(resourceName: "mtns"))
        
        scrollView.addSubview(imageView)
        self.view.addSubview(scrollView)
        
        scrollView.contentSize = imageView.frame.size
        scrollView.frame = self.view.frame
        
        scrollView.maximumZoomScale = 2
        scrollView.minimumZoomScale = 0.04
        scrollView.delegate = self
        
        button = UIButton(type: .system)
        button.setTitle("Button", for: .normal)
        button.frame = CGRect(x: 20, y: 420, width: 40, height: 20)
        button.sizeToFit()
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: scrollView.contentSize)
        scrollView.zoom(to: rect, animated: false)
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 2) {
            self.scrollView.contentInset = UIEdgeInsets(top: 100, left: 20, bottom: 100, right: 20)
        }
    }



}

extension FirstViewController : UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return imageView
    }
}
