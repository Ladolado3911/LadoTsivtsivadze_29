//
//  SecondController.swift
//  LadoTsivtsivadze_29
//
//  Created by Ladolado3911 on 6/9/21.
//

import UIKit

class SecondController: UIViewController {
    
    @IBOutlet weak var imgView: newImage!
    @IBOutlet weak var coordinates: UILabel!
    
    var gesture: GestureType?
    var gestureObject: Gesture?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.isUserInteractionEnabled = true
        coordinates.isHidden = true
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let gesture = gesture {
            switch gesture {
            case .pan:
                gestureObject = Gesture(gestureType: gesture,
                                        controller: self,
                                        action: #selector(panAction))
                
                coordinates.isHidden = false
                imgView.addGestureRecognizer(gestureObject!.pan!)
                
            case .longPress:
                gestureObject = Gesture(gestureType: gesture,
                                        controller: self,
                                        action: #selector(longPressAction))

                imgView.addGestureRecognizer(gestureObject!.longPress!)
                
            case .swipe:
                gestureObject = Gesture(gestureType: gesture,
                                        controller: self,
                                        action: #selector(swipeAction))

                imgView.addGestureRecognizer(gestureObject!.swipe!)
                
                
            case .pinch:
                gestureObject = Gesture(gestureType: gesture,
                                        controller: self,
                                        action: #selector(pinchAction))

                imgView.addGestureRecognizer(gestureObject!.pinch!)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        switch gesture {
        case .pan:
            imgView.removeGestureRecognizer(gestureObject!.pan!)
        case .longPress:
            imgView.removeGestureRecognizer(gestureObject!.longPress!)
        case .swipe:
            imgView.removeGestureRecognizer(gestureObject!.swipe!)
        case .pinch:
            imgView.removeGestureRecognizer(gestureObject!.pinch!)
        case .none:
            break
        }
        
        coordinates.isHidden = true
    }
}

extension SecondController {
    @objc func panAction(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.view)
        UIView.animate(withDuration: 0.3) {
            switch gesture.state {
            case .changed:
                self.imgView.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
                self.coordinates.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
                self.coordinates.text = "x: \(translation.x), y: \(translation.y)"
            case .ended:
                self.imgView.transform = .identity
                self.coordinates.transform = .identity
            default:
                break
            }
        }
    }
    @objc func longPressAction(_ gesture: UILongPressGestureRecognizer) {
        print("longPress")
        //if gesture.press
    }
    @objc func swipeAction(_ gesture: UISwipeGestureRecognizer) {
        print("swipe")
    }
    @objc func pinchAction(_ gesture: UIPinchGestureRecognizer) {
        print("pinch")
    }
}
