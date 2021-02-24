import UIKit
import QuartzCore

@IBDesignable
class AnimatedMaskLabel: UIView {
  
  let gradientLayer: CAGradientLayer = {
    let gradientLayer = CAGradientLayer()
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    let colors = [UIColor.black.cgColor,
                  UIColor.white.cgColor,
                  UIColor.black.cgColor]
    gradientLayer.colors = colors
    let locations: [NSNumber] = [0.25, 0.5, 0.75]
    gradientLayer.locations = locations
    return gradientLayer
  }()

  let textAttributes: [NSAttributedString.Key: Any] = {
    let style = NSMutableParagraphStyle()
    style.alignment = .center
    return [.font: UIFont(name: "HelveticaNeue-Thin",size: 28.0)!,
            .paragraphStyle: style]
  }()
  
  @IBInspectable var text: String! {
    didSet {
      setNeedsDisplay()
    }
  }
  
  override func layoutSubviews() {
    layer.borderColor = UIColor.green.cgColor
    gradientLayer.frame = CGRect(x: -bounds.size.width,
                                 y: bounds.origin.y,
                                 width: 3 * bounds.size.width,
                                 height: bounds.size.height)
    layer.addSublayer(gradientLayer)
  }
  
  override func didMoveToWindow() {
    super.didMoveToWindow()
    let gradientAnimation = CABasicAnimation(keyPath: "locations")
    gradientAnimation.fromValue = [0.0, 0.0, 0.25]
    gradientAnimation.toValue = [0.75, 1.0, 1.0]
    gradientAnimation.duration = 3.0
    gradientAnimation.repeatCount = Float.infinity
    gradientLayer.add(gradientAnimation, forKey: nil)
  }
  
}
