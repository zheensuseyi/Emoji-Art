//
//  Emoji_ArtApp.swift
//  Emoji Art
//
//  Created by Zheen Suseyi on 3/5/25.
//

import SwiftUI

@main
struct Emoji_ArtApp: App {
    @StateObject var defaultDocument = EmojiArtDocument()
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: defaultDocument)
        }
    }
}
