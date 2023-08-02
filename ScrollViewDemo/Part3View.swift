//
// Created for ScrollViewDemo
// by  Stewart Lynch on 2023-07-31
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on Twitter: https://twitter.com/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import SwiftUI

struct Part3View: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                    ForEach(ImageAsset.all) { asset in
                        Image(asset.name)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 225)
                            .scrollTransition { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1.0 : 0.3)
                                    .scaleEffect(phase.isIdentity ? 1.0 : 0.3)
                            }
                }
            }
            .contentMargins(.top, 40, for: .scrollIndicators)
            .contentMargins(.trailing, 10, for: .scrollContent)
            .scrollIndicatorsFlash(onAppear: true)
            .navigationTitle("ScrollView Animation")
        }
    }
}

#Preview {
    Part3View()
}
