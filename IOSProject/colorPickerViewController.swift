//
//  colorPickerViewController.swift
//  IOSProject
//
//  Created by Yoann MASSON on 22/03/2017.
//  Copyright © 2017 Yoann MASSON. All rights reserved.
//

import UIKit

class colorPickerViewController: ColorViewController {
    
    private static var vue : colorPickerViewController?
    private static var backgroundColor : UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        let colorPicker = SwiftHSVColorPicker(frame: CGRect(origin: CGPoint(x: 100,y :100), size: CGSize(width: 500, height: 500))  )
        self.view.addSubview(colorPicker)
        colorPicker.setViewColor(UIColor.red)
        colorPickerViewController.vue = self
        // Do any additional setup after loading the view.
    }
    
    class func getVue() -> colorPickerViewController? {
        return colorPickerViewController.vue
    }
    
    class func getColor() -> UIColor? {
        return colorPickerViewController.backgroundColor
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setBackground(color: UIColor){
        
        colorPickerViewController.backgroundColor = color
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
