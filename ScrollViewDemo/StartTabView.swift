//
// Created for ScrollViewDemo
// by  Stewart Lynch on 2023-07-30
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on Twitter: https://twitter.com/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import SwiftUI

struct StartTabView: View {
    var body: some View {
        TabView {
            Part1View()
                .tabItem {
                    Label("Part 1", systemImage: "1.circle.fill")
                }
            Part2View()
                .tabItem {
                    Label("Part 2", systemImage: "2.circle.fill")
                }
            Part3View()
                .tabItem {
                    Label("Part 3", systemImage: "3.circle.fill")
                }
            
        }
    }
}

#Preview {
    StartTabView()
}
