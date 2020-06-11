//
//  ViewController.swift
//  button_custom
//
//  Created by Beegains on 16/12/17.
//  Copyright © 2017 Beegains. All rights reserved.
//

import UIKit
extension UIView {
    func rotate360DegreesClockwise(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2.0)
        rotateAnimation.duration = duration
        
        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate as? CAAnimationDelegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
    func rotate360DegreesAntiClockwise(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 2.0
        rotateAnimation.toValue = CGFloat(Double.pi * 0.0)
        rotateAnimation.duration = duration
        
        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate as? CAAnimationDelegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
}
extension UIButton{
    
    
    func getColourFromPoint(point:CGPoint)-> UIColor{
    
        let colorSpace:CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue:CGImageAlphaInfo.premultipliedLast.rawValue)
        var pixelData:[UInt8] = [0,0,0,0]
        let context = CGContext(data: &pixelData,width: 1,height: 1,bitsPerComponent: 8,bytesPerRow: 4,space: colorSpace,bitmapInfo: bitmapInfo.rawValue)
        context!.translateBy(x: -point.x,y: -point.y);
        self.layer.render(in: context!)
        let red:CGFloat = CGFloat(pixelData[0])/CGFloat(255.0)
        let green:CGFloat = CGFloat(pixelData[1])/CGFloat(255.0)
        let blue:CGFloat = CGFloat(pixelData[2])/CGFloat(255.0)
        let alpha:CGFloat = CGFloat(pixelData[2])/CGFloat(255.0)
        let color:UIColor = UIColor(red:red,green:green,blue:blue,alpha:alpha)
        
        return color
        
    
    }
    
    
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        if (!self.bounds.contains(point)) {
            
            
            return nil
            
            
        }
        else
        {
            let color : UIColor = self.getColourFromPoint(point: point)
            let alpha = color.cgColor.alpha;
            
            if  alpha <= 0.0
            {
                return nil
            }
            return self
            
            
        }
        
        
    }
    
    

}






class ViewController: UIViewController,UIGestureRecognizerDelegate {
    @IBAction func btn_panda_one(_ sender: Any) {
        
        lbl_status.text = "PANDA HIGH KICK"
        
    }
    @IBOutlet weak var view_to_rotate: UIView!
    @IBAction func btn_panda_two(_ sender: Any) {
        
                lbl_status.text = "PANDA CROUCH"
    }
    
    @IBAction func btn_panda_three(_ sender: Any) {
        lbl_status.text = "PANDA ON THE FLORE"
  
    }
    
    @IBAction func btn_panda_four(_ sender: Any) {
          lbl_status.text = "PANDA DISTANCE PUNCH"
   }
    @IBAction func btn_snake(_ sender: Any) {
      lbl_status.text = "SNAKE DANCE"
       // view_to_rotate.rotate360DegreesAntiClockwise()
    }
    @IBAction func btn_tortoise(_ sender: Any) {
      lbl_status.text = "TORTOISE LEADER"
       // view_to_rotate.rotate360DegreesClockwise()
    }
    @IBAction func btn_giant_snake(_ sender: Any) {
         lbl_status.text = "GIANT SNAKE"
  }
    @IBAction func black_snake(_ sender: Any) {
     lbl_status.text = "black SNAKE"
   }
    
    @IBOutlet weak var lbl_status: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
     view_to_rotate.layer.cornerRadius = view_to_rotate.frame.size.height/2
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

