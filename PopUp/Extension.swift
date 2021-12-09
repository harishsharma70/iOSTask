//
//  Extension.swift
//  SocialApp
//
//  Created by Apple on 10/29/21.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: Double {
        get {
            self.layer.masksToBounds = false
            return Double(self.layer.cornerRadius)
        } set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }
    
    //MARK: viewId
    static var viewId: String {
        return String(describing: self)
    }
}


extension UITableView {
    public func register(_ cell: String) {
        self.register(UINib(nibName: cell, bundle: nil), forCellReuseIdentifier: cell)
    }
    
    public func registerHeaderView(_ header: String) {
        let headerNib = UINib.init(nibName: header, bundle: nil)
        self.register(headerNib, forHeaderFooterViewReuseIdentifier: header)
    }
    
    public func registerFooterView(_ header: String) {
        let headerNib = UINib.init(nibName: header, bundle: nil)
        self.register(headerNib, forHeaderFooterViewReuseIdentifier: header)
    }
    
    public func dequeueReusableCell<T: UITableViewCell>() -> T  {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }

    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(for section: Int) -> T  {
        print(T.reuseIdentifier)
        guard let cell = dequeueReusableHeaderFooterView(withIdentifier: "\(T.reuseIdentifier)") as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    public func getIndexPath(_ view: UIView)-> IndexPath? {
        let pointInTable = view.convert(view.bounds.origin, to: self)
        return self.indexPathForRow(at: pointInTable)
    }
}

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewHeaderFooterView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

//extension UIView {
//
//    @IBInspectable var startGradientColor: UIColor? {
//        get {
//            return UIColor(cgColor: self.layer.shadowColor!)
//        }
//        set {
//            self.layer.shadowColor = newValue?.cgColor
//        }
//    }
//
//    func applyGradient(colours: [UIColor]) {
//        applyGradient(colours: colours, locations: [0.0, 1.0])
//    }
//
//    func applyGradient(colours: [UIColor], locations: [NSNumber]?) {
//        let gradient: CAGradientLayer = CAGradientLayer()
//        gradient.frame = bounds
//        gradient.colors = colours.map { $0.cgColor }
//        gradient.locations = locations
//        //gradient.startPoint = CGPoint(x: 0.0, y: 0.8)
//        //gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
//        gradient.name = "gradientLayer"
//
//        for layer in layer.sublayers ?? [] {
//            if layer.name == "gradientLayer" {
//                layer.removeFromSuperlayer()
//            }
//        }
//
//        layer.insertSublayer(gradient, at: 0)
//    }
//}


@IBDesignable
public class Gradient: UIView {
    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}

    override public class var layerClass: AnyClass { CAGradientLayer.self }

    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }

    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? .init(x: 1, y: 0) : .init(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updatePoints()
        updateLocations()
        updateColors()
    }
}

@IBDesignable
public class GradientButton: UIButton {
    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}

    override public class var layerClass: AnyClass { CAGradientLayer.self }

    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }

    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? .init(x: 1, y: 0) : .init(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updatePoints()
        updateLocations()
        updateColors()
    }
}

extension UIViewController {
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Social Media", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
