//
//  ImageCell.swift
//  AutoHeight
//
//  Created by Christian Lysne on 26/06/2017.
//  Copyright © 2017 Christian Lysne. All rights reserved.
//

import UIKit

struct ImageViewModel: ViewModel {
    let image: UIImage
}

class ImageCell: UICollectionViewCell, NibLoadableView {
    @IBOutlet weak var imageView: UIImageView!
}

extension ImageCell: ViewModelConfigurable {
    func configure(with viewModel: ViewModel) {
        let viewModel = viewModel as! ImageViewModel
        imageView.image = viewModel.image
    }
}
