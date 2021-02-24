import UIKit
import QuartzCore

@IBDesignable
class AnimatedMaskLabel: UIView {
  
  let gradientLayer: CAGradientLayer = {
    let gradientLayer = CAGradientLayer()
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    return gradientLayer
  }()
  
  @IBInspectable var text: String! {
    didSet {
      setNeedsDisplay()
    }
  }
  
  override func layoutSubviews() {
    layer.borderColor = UIColor.green.cgColor
  }
  
  override func didMoveToWindow() {
    super.didMoveToWindow()
    
  }
  
}
