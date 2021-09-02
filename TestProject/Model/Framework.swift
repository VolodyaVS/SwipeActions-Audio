//
//  Framework.swift
//  TestProject
//
//  Created by Vladimir Stepanchikov on 23.08.2021.
//

import Foundation

struct Framework: Identifiable, Hashable {
    let name: String
    let availability: String
    let id = UUID()
}
