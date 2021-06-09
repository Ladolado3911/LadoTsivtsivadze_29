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
                gestureObject!.longPress!.minimumPressDuration = 1
                imgView.addGestureRecognizer(gestureObject!.longPress!)
                
            case .swipe:
                gestureObject = Gesture(gestureType: gesture,
                                        controller: self,
                                        action: #selector(swipeAction))
                
                gestureObject!.swipe!.direction = .right
                imgView.addGestureRecognizer(gestureObject!.swipe!)
                
                let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
                swipeLeft.direction = .left
                imgView.addGestureRecognizer(swipeLeft)
                
                let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
                swipeLeft.direction = .up
                imgView.addGestureRecognizer(swipeUp)
                
                
                let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
                swipeLeft.direction = .down
                imgView.addGestureRecognizer(swipeDown)
         
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
        imgView.gestureRecognizers!.forEach(imgView.removeGestureRecognizer(_:))
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
    }
    
    @objc func swipeAction(_ gestureRight: UISwipeGestureRecognizer) {
        print(gestureRight.direction)
    }
    @objc func pinchAction(_ gesture: UIPinchGestureRecognizer) {
        print("pinch")
    }
}
