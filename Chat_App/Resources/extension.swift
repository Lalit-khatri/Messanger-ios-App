//
//  extension.swift
//  Chat_App
//
//  Created by Lalit kumar on 29/12/22.
//

import Foundation
import UIKit

extension UIView {
    
    var width: CGFloat {
        return self.frame.size.width
    }
    
    var height: CGFloat {
        return self.frame.size.height
    }
    
    var left: CGFloat {
        return self.frame.origin.x
    }
    
    var right: CGFloat {
        return self.frame.size.width + self.left
    }
    
    var top: CGFloat {
        return self.frame.origin.y
    }
    
    var bottom: CGFloat {
        return self.height + self.top
    }
}
