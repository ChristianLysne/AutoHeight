//
//  ViewController.swift
//  AutoHeight
//
//  Created by Christian Lysne on 26/06/2017.
//  Copyright © 2017 Christian Lysne. All rights reserved.
//

import UIKit

enum CustomRowType: String, EnumCollection {
    case text
    case image

    var identifier: String {
        switch self {
        case .text: return TextCell.self.nibName
        case .image: return ImageCell.self.nibName
        }
    }

    static func row(for viewModel: ViewModel) -> CustomRowType {
        switch viewModel {
        case is TextViewModel: return .text
        case is ImageViewModel: return .image
        default: fatalError()
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate let viewModels = MockViewModelGenerator.viewModels

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.observeDynamicFontChange()
        collectionView.registerNibs(with: CustomRowType.allValues.map{ $0.identifier })
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel =  viewModels[indexPath.row]
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomRowType.row(for: viewModel).identifier,
            for: indexPath
        )

        if let cell = cell as? ViewModelConfigurable {
            cell.configure(with: viewModel)
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewModel = viewModels[indexPath.row]
        return collectionView.size(
            for: CustomRowType.row(for: viewModel).identifier,
            using: viewModel
        )
    }
}

