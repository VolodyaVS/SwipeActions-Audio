//
//  SwipeContainerCell.swift
//  TestProject
//
//  Created by Vladimir Stepanchikov on 23.08.2021.
//

import SwiftUI

struct SwipeContainerCell: ViewModifier  {
    enum VisibleButton {
        case none
        case left
        case right
    }

    let leadingButtons: [SwipeActions]
    let trailingButton: [SwipeActions]

    let maxLeadingOffset: CGFloat
    let minTrailingOffset: CGFloat
    let onClick: (SwipeActions) -> Void

    @State private var offset: CGFloat = 0
    @State private var oldOffset: CGFloat = 0
    @State private var visibleButton: VisibleButton = .none

    init(leadingButtons: [SwipeActions], trailingButton: [SwipeActions], onClick: @escaping (SwipeActions) -> Void) {
        self.leadingButtons = leadingButtons
        self.trailingButton = trailingButton

        maxLeadingOffset = CGFloat(leadingButtons.count) * buttonWidth
        minTrailingOffset = CGFloat(trailingButton.count) * buttonWidth * -1
        
        self.onClick = onClick
    }

    func reset() {
        visibleButton = .none
        offset = 0
        oldOffset = 0
    }

    func body(content: Content) -> some View {
        ZStack {
            content
                .contentShape(Rectangle())
                .offset(x: offset)
                .gesture(DragGesture(minimumDistance: 15, coordinateSpace: .local)
                            .onChanged({ (value) in
                                let totalSlide = value.translation.width + oldOffset
                                if  (0...Int(maxLeadingOffset) ~= Int(totalSlide)) || (Int(minTrailingOffset)...0 ~= Int(totalSlide)) {
                                    withAnimation{
                                        offset = totalSlide
                                    }
                                }
                            })
                            .onEnded({ value in
                                withAnimation {
                                    if visibleButton == .left && value.translation.width < -20 {
                                        reset()
                                    } else if  visibleButton == .right && value.translation.width > 20 {
                                        reset()
                                    } else if offset > 25 || offset < -25 {
                                        if offset > 0 {
                                            visibleButton = .left
                                            offset = maxLeadingOffset
                                        } else {
                                            visibleButton = .right
                                            offset = minTrailingOffset
                                        }
                                        oldOffset = offset
                                    } else {
                                        reset()
                                    }
                                }
                            }))
            GeometryReader { proxy in
                HStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(leadingButtons) { buttonsData in
                            Button(action: {
                                withAnimation {
                                    reset()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.20) {
                                    onClick(buttonsData)
                                }
                            }, label: {
                                SwipeButtonView(data: buttonsData, cellHeight: proxy.size.height)
                            })
                        }
                    }.offset(x: (-1 * maxLeadingOffset) + offset)
                    Spacer()
                    HStack(spacing: 0) {
                        ForEach(trailingButton) { buttonsData in
                            Button(action: {
                                withAnimation {
                                    reset()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.20) {
                                    onClick(buttonsData)
                                }
                            }, label: {
                                SwipeButtonView(data: buttonsData, cellHeight: proxy.size.height)
                            })
                        }
                    }.offset(x: (-1 * minTrailingOffset) + offset)
                }
            }
        }
    }
}
