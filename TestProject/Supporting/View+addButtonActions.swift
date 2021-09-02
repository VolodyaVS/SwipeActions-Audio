//
//  View+addSwipeButtonActions.swift
//  TestProject
//
//  Created by Vladimir Stepanchikov on 23.08.2021.
//

import SwiftUI

extension View {
    func addSwipeButtonActions(leadingButtons: [SwipeActions],
                          trailingButton: [SwipeActions],
                          onClick: @escaping (SwipeActions) -> Void) -> some View {
        modifier(SwipeContainerCell(leadingButtons: leadingButtons,
                                    trailingButton: trailingButton,
                                    onClick: onClick))
    }
}
