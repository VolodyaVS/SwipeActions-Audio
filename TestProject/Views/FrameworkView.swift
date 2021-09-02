//
//  FrameworkView.swift
//  TestProject
//
//  Created by Vladimir Stepanchikov on 23.08.2021.
//

import SwiftUI
import AVKit

struct FrameworkView: View {
    @StateObject private var frameworkViewModel = FrameworkViewViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(frameworkViewModel.frameworks, id: \.self) { framework in
                        let index = frameworkViewModel.frameworks.firstIndex(of: framework)
                        VStack {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(framework.name).font(.headline)
                                    Text("availability: " + framework.availability).font(.footnote)
                                }
                                Spacer()
                            }.padding()
                            Divider()
                                .padding(.leading)
                        }
                        .addSwipeButtonActions(
                            leadingButtons: frameworkViewModel.chooseSwipeButton(for: index ?? 0),
                            trailingButton:  [.delete],
                            onClick: { button in
                                print("clicked: \(button)")
                                if button == .delete {
                                    frameworkViewModel.frameworks.remove(at: index ?? 0)
                                }
                            }
                        )
                    }
                }
                .background(Color(.gray).opacity(0.2))
            }
            .navigationTitle("Frameworks")
            .navigationBarItems(trailing: AudioButton(nameButton: "Hello Music"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkView()
    }
}
