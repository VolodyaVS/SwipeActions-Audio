//
//  SwipeButtonView.swift
//  TestProject
//
//  Created by Vladimir Stepanchikov on 23.08.2021.
//

import SwiftUI

let buttonWidth: CGFloat = 80

struct SwipeButtonView: View {
    let data: SwipeActions
    let cellHeight: CGFloat

    func getView(for image: String) -> some View {
        VStack {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: cellHeight * 0.4)
        }
        .padding(5)
        .foregroundColor(.primary)
        .font(.headline)
        .frame(width: buttonWidth, height: cellHeight)
    }

    var body: some View {
        switch data {
        case .edit:
            getView(for: "pencil")
                .background(Color.yellow)
        case .delete:
            getView(for: "trash")
                .background(Color.red)
        case .save:
            getView(for: "square.and.arrow.down")
                .background(Color.blue)
        case .info:
            getView(for: "info.circle")
                .background(Color.green)
        }
    }
}
