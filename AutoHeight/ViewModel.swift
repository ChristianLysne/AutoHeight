//
//  ViewModel.swift
//  AutoHeight
//
//  Created by Christian Lysne on 12/07/2017.
//  Copyright © 2017 Christian Lysne. All rights reserved.
//

import Foundation

protocol ViewModel {}
protocol ViewModelConfigurable {
    func configure(with viewModel: ViewModel)
}
