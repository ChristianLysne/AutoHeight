//
//  MockViewModelGenerator.swift
//  AutoHeight
//
//  Created by Christian Lysne on 12/07/2017.
//  Copyright © 2017 Christian Lysne. All rights reserved.
//

import Foundation

class MockViewModelGenerator {
    static var viewModels: [ViewModel] = [
        TextViewModel(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
        ImageViewModel(image: #imageLiteral(resourceName: "cover1")),
        TextViewModel(text: "Integer laoreet vestibulum metus, non iaculis purus ornare sed. Aliquam tempor sollicitudin erat, eget auctor est convallis nec. In ut enim ac ipsum facilisis pretium eu at felis. Integer tincidunt condimentum porta. Vestibulum viverra quis ex id aliquam. Donec convallis sagittis mi ac suscipit. Praesent sed dictum velit, vel hendrerit nunc. Morbi sed pretium ante. Donec convallis maximus eros, eget ornare erat pretium ut. Maecenas pharetra tempor enim vel tristique. Morbi euismod massa eu augue convallis posuere. Vestibulum sit amet justo in ligula pulvinar tempor auctor sit amet elit."),
        ImageViewModel(image: #imageLiteral(resourceName: "cover2")),
        TextViewModel(text: "Suspendisse vitae felis iaculis, semper orci ac, commodo neque. Morbi venenatis ante velit, et viverra eros sollicitudin maximus. Sed tempus, dolor vel efficitur eleifend, nibh neque tempus dolor, vulputate dictum lorem nisl nec erat. Donec in erat elit. Praesent iaculis venenatis molestie. Praesent sit amet risus quis erat sodales efficitur id rhoncus lorem. Sed massa lacus, interdum eget est non, suscipit finibus metus.")
    ]
}
