//
//  ViewController.swift
//  LadoTsivtsivadze_29
//
//  Created by Ladolado3911 on 6/9/21.
//

import UIKit

class MainController: UIViewController {
    
    @IBOutlet weak var uiPanGesture: UILabel!
    @IBOutlet weak var uiLongPress: UILabel!
    @IBOutlet weak var uiSwipeGesture: UILabel!
    @IBOutlet weak var uiPinchGesture: UILabel!
    
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
        uiLongPress.isUserInteractionEnabled = true
        uiSwipeGesture.isUserInteractionEnabled = true
        uiPinchGesture.isUserInteractionEnabled = true
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
        pushController(from: self, to: nextController, method: .withBackItem)
    }
}

