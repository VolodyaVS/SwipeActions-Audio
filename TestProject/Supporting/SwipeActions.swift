//
//  ButtonActions.swift
//  TestProject
//
//  Created by Vladimir Stepanchikov on 23.08.2021.
//

import Foundation

enum SwipeActions: Identifiable {
    case edit
    case delete
    case save
    case info

    var id: String {
        return "\(self)"
    }
}
