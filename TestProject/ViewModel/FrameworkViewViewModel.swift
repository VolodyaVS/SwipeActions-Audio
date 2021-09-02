//
//  ContentViewViewModel.swift
//  TestProject
//
//  Created by Vladimir Stepanchikov on 23.08.2021.
//

import Foundation

class FrameworkViewViewModel: ObservableObject {
    @Published var frameworks = [
        Framework(name: "AppKit", availability: "macOS 10.0+"),
        Framework(name: "ARKit", availability: "iOS 11.0+"),
        Framework(name: "AudioDriverKit", availability: "DriverKit 21.0+"),
        Framework(name: "CarPlay", availability: "iOS 12.0+"),
        Framework(name: "ClockKit", availability: "watchOS 2.0+"),
        Framework(name: "Combine", availability: "iOS 13.0+"),
        Framework(name: "Core Animation", availability: "iOS 2.0+"),
        Framework(name: "Core Data", availability: "iOS 3.0+"),
        Framework(name: "EventKit", availability: "iOS 4.0+"),
        Framework(name: "HomeKit", availability: "iOS 8.0+"),
        Framework(name: "MapKit", availability: "iOS 3.0+"),
        Framework(name: "PhotoKit", availability: "iOS 8.0+")
    ]

    func chooseSwipeButton(for index: Int) -> [SwipeActions] {
        let swipeButtons: [SwipeActions]
        if index.isMultiple(of: 2) {
            swipeButtons = [.save, .edit, .info]
        } else {
            swipeButtons = [.info]
        }
        return swipeButtons
    }
}
