//
//  ViewController.swift
//  SwiftBlurEffect
//
//  Created by Kiran Patel on 18/07/14.
//  KiranPatel-iOS

import UIKit

class ViewController: UIViewController , UIGestureRecognizerDelegate{

    var blurEffectExtraLight : UIBlurEffect?
    var blurEffectLight : UIBlurEffect?
    var blurEffectDark : UIBlurEffect?

    var blurViewExtraLight : UIVisualEffectView?
    var blurViewLight : UIVisualEffectView?
    var blurViewDark : UIVisualEffectView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //Set Extra Light Blur View
        blurEffectExtraLight = UIBlurEffect(style: UIBlurEffectStyle.ExtraLight)
        blurViewExtraLight = UIVisualEffectView(effect: blurEffectExtraLight!)
        blurViewExtraLight!.frame = CGRectMake(10, 70, 300, 100)
        view.addSubview(blurViewExtraLight!)
        
        
        //Set Light Blur View
        blurEffectLight = UIBlurEffect(style: UIBlurEffectStyle.Light)
        blurViewLight = UIVisualEffectView(effect: blurEffectLight!)
        blurViewLight!.frame = CGRectMake(10, 220, 300, 100)
        view.addSubview(blurViewLight!)

        //Set Dark Blur View
        blurEffectDark = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        blurViewDark = UIVisualEffectView(effect: blurEffectDark!)
        blurViewDark!.frame = CGRectMake(10, 370, 300, 100)
        view.addSubview(blurViewDark!)
        
        //Adding Pan gesture on all blur view
        addPanGesture(blurViewExtraLight!)
        addPanGesture(blurViewLight!)
        addPanGesture(blurViewDark!)
        
        //Adding Information lable on all blur view
        addInfoLabel("iOS8 Extra Light Blur", blurViewToAdd: blurViewExtraLight!)
        addInfoLabel("iOS8 Light Blur", blurViewToAdd: blurViewLight!)
        addInfoLabel("iOS8 Dark Blur", blurViewToAdd: blurViewDark!)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
/*-------------------------------------------- Custom Functions -------------------------------------------------*/
    
    //Function : Add Pan gesture on all blur view
    func addPanGesture(blurViewToAdd:UIVisualEffectView) {
        // Adding Pan gesture on blurview
        var panGesture : UIPanGestureRecognizer?
        panGesture = UIPanGestureRecognizer(target: self, action: "handlePan:")
        panGesture!.delegate = self
        blurViewToAdd.addGestureRecognizer(panGesture!)
    }
    //Function : Pan Gesture Handler
    func handlePan(recognizer:UIPanGestureRecognizer) {
        view.bringSubviewToFront(recognizer.view!)
        let translation = recognizer.translationInView(self.view)
        recognizer.view!.center = CGPoint(x:recognizer.view!.center.x + translation.x,
            y:recognizer.view!.center.y + translation.y)
        recognizer.setTranslation(CGPointZero, inView: self.view)
    }
    
    //Function : Add Information lable on all blur view
    func addInfoLabel(sText:String , blurViewToAdd:UIVisualEffectView) {
        var labelExtraLight = UILabel(frame: CGRectMake(0, 0, 300, 100))
        labelExtraLight.font = UIFont.systemFontOfSize(20)
        labelExtraLight.text = sText
        labelExtraLight.textColor = UIColor.redColor()
        labelExtraLight.textAlignment = NSTextAlignment.Center
        blurViewToAdd.contentView.addSubview(labelExtraLight)
    }
/*-------------------------------------------- Custom Functions -------------------------------------------------*/

}

