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
        imgView.isUserInteractionEnabled = true
        //configTapGesture()
        configPanGesture()
        
        
    }

    func configTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        imgView.addGestureRecognizer(tap)
    }
    
    func configPanGesture() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panAction))
        view.addGestureRecognizer(pan)
    }
}

extension MainController {
    @objc func tapAction(_ gesture: UITapGestureRecognizer) {
        print("did tap")
    }
    
    @objc func panAction(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.view)

        switch gesture.state {
        case .began:
            print("begin")
        case .changed:
            self.imgView.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
        case .ended:
            UIView.animate(withDuration: 0.3) {
                self.imgView.transform = .identity
            }
        default:
            break
        }
    }
}

