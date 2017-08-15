//
//  TextCell.swift
//  CellAutoHeight
//
//  Created by Christian Lysne on 26/06/2017.
//  Copyright © 2017 Christian Lysne. All rights reserved.
//

import UIKit

struct TextViewModel: ViewModel {
    let text: String
}

class TextCell: UICollectionViewCell, NibLoadableView {
    @IBOutlet weak var titleLabel: UILabel!
}

extension TextCell: ViewModelConfigurable {
    func configure(with viewModel: ViewModel) {
        let viewModel = viewModel as! TextViewModel
        let font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        titleLabel.attributedText = NSAttributedString(string: viewModel.text, attributes: [NSFontAttributeName: font])
    }
}
