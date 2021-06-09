//
//  ViewController.swift
//  LadoTsivtsivadze_29
//
//  Created by Ladolado3911 on 6/9/21.
//

import UIKit

class MainController: UIViewController {
    
    @IBOutlet weak var uiPanGesture: NewLabel!
    @IBOutlet weak var uiLongPress: NewLabel!
    @IBOutlet weak var uiSwipeGesture: NewLabel!
    @IBOutlet weak var uiPinchGesture: NewLabel!
    
    lazy var nextController: SecondController = {
        let vc = getController(storyboardID: .main, controllerID: .second) as? SecondController
        return vc!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLabels()
        configTapGesture()
        //configPanGesture()
    }
    
    func configLabels() {
        uiPanGesture.isUserInteractionEnabled = true
        uiPanGesture.gestureType = .pan
        
        uiLongPress.isUserInteractionEnabled = true
        uiLongPress.gestureType = .longPress
        
        uiSwipeGesture.isUserInteractionEnabled = true
        uiSwipeGesture.gestureType = .swipe
        
        uiPinchGesture.isUserInteractionEnabled = true
        uiPinchGesture.gestureType = .pinch
    }

    func configTapGesture() {
        configTapGesture(label: uiPanGesture)
        configTapGesture(label: uiLongPress)
        configTapGesture(label: uiSwipeGesture)
        configTapGesture(label: uiPinchGesture)
    }
    
    func configTapGesture(label lbl: UILabel) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        lbl.addGestureRecognizer(tap)
    }
}

extension MainController {
    @objc func tapAction(_ gesture: UITapGestureRecognizer) {
        let type = (gesture.view as? NewLabel)!.gestureType!
        let vc = nextController
        vc.gesture = type
        pushController(from: self, to: nextController, method: .withBackItem)
    }
}

