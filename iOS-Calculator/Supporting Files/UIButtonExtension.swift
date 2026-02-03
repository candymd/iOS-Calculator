import UIKit

extension UIButton {

    func bounce() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { completion in
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = .identity
            })
        }
    }
    
    func shine() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) { completion in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
        }
    }
}

