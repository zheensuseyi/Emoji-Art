//
//  EmojiArtDocument .swift
//  Emoji Art
//
//  Created by Zheen Suseyi on 3/5/25.
//

import Foundation
import SwiftUI
class EmojiArtDocument: ObservableObject {
    typealias Emoji = EmojiArt.Emoji
    @Published private var emojiArt = EmojiArt()
    init() {
        emojiArt.addEmoji("🚲", at: .init(x: -200, y: -150), size: 200)
        emojiArt.addEmoji("🔥", at: .init(x: 250, y: 100), size: 80)
    }
    
    var emojis: [Emoji] {
        emojiArt.emojis
    }
    var background: URL? {
        emojiArt.background
    }
    
    // MARK: Intents
    func setBackground(_ url: URL?) {
        emojiArt.background = url
    }
    
    func addEmoji(_ emoji: String, at position: Emoji.Position, size: CGFloat) {
        emojiArt.addEmoji(emoji, at: position, size: Int(size))
    }
}

extension EmojiArt.Emoji {
    var font: Font {
        Font.system(size: CGFloat(size))
    }
}

// FIXME: ?
extension EmojiArt.Emoji.Position {
    // takes a geometry proxy, returns a CGPoint (coordinate?)
    func `in`(_ geometry: GeometryProxy) -> CGPoint {
        // finding center
        let center = geometry.frame(in: .local).center
        // offset by whatever the emojis position is relative to the center?
        return CGPoint(x:center.x + CGFloat(x), y: center.y - CGFloat(y))
    }
}
