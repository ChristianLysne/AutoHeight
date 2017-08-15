//
//  ReusableView.swift
//  CellAutoHeight
//
//  Created by Christian Lysne on 26/06/2017.
//  Copyright © 2017 Christian Lysne. All rights reserved.
//

import UIKit

protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

extension NibLoadableView where Self: UICollectionViewCell {
    static func cell() -> Self? {
        return Bundle.main.loadNibNamed(Self.nibName, owner: self, options: nil)?[0] as? Self
    }
}

extension UICollectionView {
    func registerCell<T: UICollectionViewCell>(_: T.Type) where T: NibLoadableView {
        register(T.self, forCellWithReuseIdentifier: T.nibName)
    }

    func registerNib<T: UICollectionViewCell>(_: T.Type) where T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)

        register(nib, forCellWithReuseIdentifier: T.nibName)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(_: T.Type, for indexPath: IndexPath) -> T where T: NibLoadableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.nibName, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.nibName)")
        }
        return cell
    }
}
