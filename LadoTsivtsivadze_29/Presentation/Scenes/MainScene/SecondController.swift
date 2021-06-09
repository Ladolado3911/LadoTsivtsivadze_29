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
    
    var timer: Timer?
    var counter: Double = 0.0

    
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
                gestureObject!.longPress!.minimumPressDuration = 0.1
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
                swipeUp.direction = .up
                imgView.addGestureRecognizer(swipeUp)
                
                
                let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
                swipeDown.direction = .down
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
        switch gesture.state {
        case .began:
            //timer starts
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
                self.counter += 0.1
                print(self.counter)
            }
        case .ended:
            //timer finished
            timer!.invalidate()
            print("counter = \(counter)")
            if counter < 1 {
                popController(from: self, method: .withBackItem)
            }
            else {
                print("Normal Long Press")
            }
            counter = 0.0
        default:
            break
        }
    }
    
    @objc func swipeAction(_ gesture: UISwipeGestureRecognizer) {
        let increment = CGFloat(50)
        let duration = 0.2
        switch gesture.direction {
        case .right:
            UIView.animate(withDuration: duration) { [self] in
                let newRect = CGRect(x: imgView.frame.minX + increment,
                                     y: imgView.frame.minY,
                                     width: imgView.frame.width,
                                     height: imgView.frame.height)
                imgView.frame = newRect
            }

        case .left:
            UIView.animate(withDuration: duration) { [self] in
                let newRect = CGRect(x: imgView.frame.minX - increment,
                                     y: imgView.frame.minY,
                                     width: imgView.frame.width,
                                     height: imgView.frame.height)
                imgView.frame = newRect
            }
        case .up:
            UIView.animate(withDuration: duration) { [self] in
                let newRect = CGRect(x: imgView.frame.minX,
                                     y: imgView.frame.minY - increment,
                                     width: imgView.frame.width,
                                     height: imgView.frame.height)
                imgView.frame = newRect
            }
            
        case .down:
            UIView.animate(withDuration: duration) { [self] in
                let newRect = CGRect(x: imgView.frame.minX,
                                     y: imgView.frame.minY + increment,
                                     width: imgView.frame.width,
                                     height: imgView.frame.height)
                imgView.frame = newRect
            }
            
        default:
            break
        }
    }
    @objc func pinchAction(_ gesture: UIPinchGestureRecognizer) {
        UIView.animate(withDuration: 0.3) {
            switch gesture.state {
            case .changed:
                self.imgView.transform = CGAffineTransform(scaleX: gesture.scale, y: gesture.scale)
                if self.imgView.frame.width > self.view.frame.width || self.imgView.frame.height > self.view.frame.height {
                    self.imgView.transform = .identity
                }
            default:
                break
            }
        }
    }
}
