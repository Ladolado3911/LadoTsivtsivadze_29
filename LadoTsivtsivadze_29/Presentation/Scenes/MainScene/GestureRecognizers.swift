//
//  GestureRecognizers.swift
//  LadoTsivtsivadze_29
//
//  Created by Ladolado3911 on 6/9/21.
//

import Foundation
import UIKit

enum GestureType {
    case pan
    case longPress
    case swipe
    case pinch
}

struct Gesture {
    var pan: UIPanGestureRecognizer?
    var longPress: UILongPressGestureRecognizer?
    var swipe: UISwipeGestureRecognizer?
    var pinch: UIPinchGestureRecognizer?
    
    init(gestureType type: GestureType, controller ctrl: SecondController, action act: Selector) {
        switch type {
        case .pan:
            pan = UIPanGestureRecognizer(target: ctrl, action: act)
        case .longPress:
            longPress = UILongPressGestureRecognizer(target: ctrl, action: act)
        case .swipe:
            swipe = UISwipeGestureRecognizer(target: ctrl, action: act)
        case .pinch:
            pinch = UIPinchGestureRecognizer(target: ctrl, action: act)
        }
    }
}
