//
//  AudioButton.swift
//  TestProject
//
//  Created by Vladimir Stepanchikov on 01.09.2021.
//


import SwiftUI
import AVKit

struct AudioButton: View {
    @State var audioPlayer: AVAudioPlayer!
    let nameButton: String
    @State private var isPressed = false

    var body: some View {
        Button { } label: {
            Text(nameButton)
        }
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged({ _ in
                    isPressed = true
                    audioPlayer.play()
                })
                .onEnded({ _ in
                    isPressed = false
                    audioPlayer.pause()
                })
        )
        .onAppear {
            let sound = Bundle.main.path(forResource: "song", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
    }
}

struct AudioButton_Previews: PreviewProvider {
    static var previews: some View {
        AudioButton(nameButton: "Hello World")
    }
}
