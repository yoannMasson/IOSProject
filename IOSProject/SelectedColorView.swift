//
//  SelectedColorView.swift
//  SwiftHSVColorPicker
//
//  Created by johankasperi on 2015-08-20.
//

import UIKit

class SelectedColorView: UIView {
    var color: UIColor!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        
        setViewColor(color)
    }
    
    func setViewColor(_ _color: UIColor) {
        color = _color
        setBackgroundColor()
        //Add by Yoann Masson on the 23rd of march 2017
        guard let vue = colorPickerViewController.getVue() else {
            return
        }
        vue.setBackground(color: color)
    }
    
    func setBackgroundColor() {
        backgroundColor = color
    }
}
