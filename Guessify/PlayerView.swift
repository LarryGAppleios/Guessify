import AVKit
import SwiftUI

struct PlayerView: View {
    let player: AVPlayer

    init() {
        let url = Bundle.main.url(forResource: "StarsView", withExtension: "hevc")!
        player = AVPlayer(url: url)
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
            player.seek(to: .zero)
            player.play()
        }
    }

    var body: some View {
        VideoPlayer(player: player)
            .onAppear {
                player.play()
                player.isMuted = true
            }
            .onDisappear {
                player.pause()
            }
    }
}