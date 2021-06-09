//
//  SecondController.swift
//  LadoTsivtsivadze_29
//
//  Created by Ladolado3911 on 6/9/21.
//

import UIKit

class SecondController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    var gesture: GestureType?
    var gestureObject: Gesture?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let gesture = gesture {
            switch gesture {
            case .pan:
                gestureObject = Gesture(gestureType: gesture,
                                        controller: self,
                                        action: #selector(panAction))
            case .longPress:
                gestureObject = Gesture(gestureType: gesture,
                                        controller: self,
                                        action: #selector(longPressAction))
            case .swipe:
                gestureObject = Gesture(gestureType: gesture,
                                        controller: self,
                                        action: #selector(swipeAction))
            case .pinch:
                gestureObject = Gesture(gestureType: gesture,
                                        controller: self,
                                        action: #selector(pinchAction))
            }
        }
    }
}

extension SecondController {
    @objc func panAction(_ gesture: UIPanGestureRecognizer) {
        print("panAction")
    }
    @objc func longPressAction(_ gesture: UILongPressGestureRecognizer) {
        print("longPress")
    }
    @objc func swipeAction(_ gesture: UISwipeGestureRecognizer) {
        print("swipe")
    }
    @objc func pinchAction(_ gesture: UIPinchGestureRecognizer) {
        print("pinch")
    }
}
