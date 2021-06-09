//
//  ViewController.swift
//  LadoTsivtsivadze_29
//
//  Created by Ladolado3911 on 6/9/21.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTapGesture()
        
        
    }

    func configTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        imgView.addGestureRecognizer(tap)
    }
}

extension MainController {
    @objc func tapAction(_ gesture: UITapGestureRecognizer) {
        print("did tap")
    }
}

