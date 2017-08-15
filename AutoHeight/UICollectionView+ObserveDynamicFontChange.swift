//
//  AutoHeightCollectionView.swift
//  CellAutoHeight
//
//  Created by Christian Lysne on 26/06/2017.
//  Copyright © 2017 Christian Lysne. All rights reserved.
//

import UIKit


extension UICollectionView {
    func observeDynamicFontChange() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(userChangedTextSize),
            name: NSNotification.Name.UIContentSizeCategoryDidChange,
            object: nil
        )
    }

    @objc private func userChangedTextSize() {
        collectionViewLayout.invalidateLayout()
    }
}
