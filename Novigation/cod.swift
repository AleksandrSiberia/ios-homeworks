//
//  cod.swift
//  Novigation
//
//  Created by Александр Хмыров on 28.06.2022.
//

import UIKit

class cod: UIView {

//    private func frameAnimation() {
//        let screenMain = UIScreen.main.bounds
//
//        UIView.animateKeyframes(withDuration: 4.0,
//                                delay: 0,
//                                options: .calculationModeCubic) {
//
//            UIView.addKeyframe(withRelativeStartTime: 0.0,
//                               relativeDuration: 2.0) {
//                self.avatarImageView.center = CGPoint(x: screenMain.width / 2, y: screenMain.height / 2)
//            }
//
//
//            UIView.addKeyframe(withRelativeStartTime: 2.0,
//                               relativeDuration: 4.0) {
//                self.avatarImageView.center = CGPoint(x: screenMain.width / 2 + 150, y: screenMain.height / 2)
//            }
//        }
//    }
//
//    private func layerAnimation() {
//
//            CATransaction.begin()
//
//            CATransaction.setCompletionBlock {
//                self.avatarImageView.transform = CGAffineTransform(scaleX: 2, y: 2)
//            }
//
//            let startPosition = avatarImageView.center
//            let screen = UIScreen.main.bounds
//
//            let animation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
//            animation.fromValue = startPosition
//            animation.toValue = CGPoint(x: screen.width / 2, y: screen.height / 2)
//
//            animation.duration = 0.5
//            animation.repeatCount = 2
//            animation.isRemovedOnCompletion = true
//            animation.autoreverses = true
//            self.avatarImageView.layer.add(animation, forKey: #keyPath(CALayer.position))
//            CATransaction.commit()
//    }
//
//    private func animationPropertyAnimator() {
//        let startPosition = avatarImageView.center
//        let screen = UIScreen.main.bounds
//        let animation = UIViewPropertyAnimator(duration: 0.5, curve: .linear) {
//            self.avatarImageView.center = CGPoint(x: screen.width / 2, y: screen.height / 2)
//        }
//        animation.startAnimation(afterDelay: 1)
//    }


}
