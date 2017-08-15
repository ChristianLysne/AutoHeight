//
//  AutoHeightCells.swift
//  AutoHeight
//
//  Created by Christian Lysne on 12/07/2017.
//  Copyright © 2017 Christian Lysne. All rights reserved.
//

import UIKit

protocol AutoHeightCells {
    func registerNibs(with identifiers: [String])
    func size(for identifier: String, using viewModel: ViewModel, fixedWidth: CGFloat?, fixedHeight: CGFloat?) -> CGSize
}

fileprivate class SizingCellRegistry {
    static var cachedCells: [String: UICollectionViewCell] = [:]
}

extension AutoHeightCells where Self: UICollectionView {
    fileprivate var initialHeight: CGFloat {
        return 50
    }

    fileprivate var defaultWidth: CGFloat {
        return floor(frame.width - contentInset.left - contentInset.right)
    }

    func registerNibs(with identifiers: [String]) {
        identifiers.forEach { (identifier) in
            let nib = UINib(nibName: identifier, bundle: nil)
            register(nib, forCellWithReuseIdentifier: identifier)
        }
    }

    fileprivate func cachedCell(from identifier: String) -> UICollectionViewCell? {
        return SizingCellRegistry.cachedCells[identifier]
    }

    fileprivate func cellFromNib(with identifier: String) -> UICollectionViewCell? {
        return Bundle.main.loadNibNamed(identifier, owner: self, options: nil)?.first as? UICollectionViewCell
    }

    fileprivate func cell(from identifier: String) -> UICollectionViewCell? {
        guard let cell = cachedCell(from: identifier) else {
            let cell = cellFromNib(with: identifier)
            SizingCellRegistry.cachedCells[identifier] = cell
            return cell
        }
        return cell
    }

    func size(for identifier: String, using viewModel: ViewModel, fixedWidth: CGFloat? = nil, fixedHeight: CGFloat? = nil) -> CGSize {
        guard let cell = cell(from: identifier) else { return .zero }

        let initialSize = CGSize(width: fixedWidth ?? defaultWidth, height: fixedHeight ?? initialHeight)
        cell.frame = CGRect(origin: .zero, size: initialSize)

        if let cell = cell as? ViewModelConfigurable {
            cell.configure(with: viewModel)
        }

        cell.updateConstraintsIfNeeded()
        cell.layoutIfNeeded()

        defer {
            cell.prepareForReuse()
        }

        return cell.systemLayoutSizeFitting(
            initialSize,
            withHorizontalFittingPriority: UILayoutPriorityRequired,
            verticalFittingPriority: fixedHeight != nil ? UILayoutPriorityRequired : UILayoutPriorityDefaultLow
        )
    }
}
