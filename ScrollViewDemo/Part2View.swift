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

struct Part2View: View {
    @State private var scrollID: Int?
    var body: some View {
        NavigationStack {
            ScrollView { // This is only here because of the tabView
                VStack(alignment: .leading) {
                    Text("Paging").padding(.horizontal)
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(ImageAsset.all) { asset in
                                Image(asset.name)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 225)
                            }
                        }
                    }
                    .contentMargins(.horizontal, 10, for: .scrollContent)
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.paging)
                    Divider()
                    
                    Text("ViewAligned").padding(.horizontal)
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(ImageAsset.all) { asset in
                                Image(asset.name)
                                    .resizable()
                                    .scaledToFit()
//                                    .frame(width: 300, height: 225)
                                    .containerRelativeFrame(.horizontal)
                                    .scrollTransition { content, phase in
                                        content
                                            .rotation3DEffect(.degrees(phase.value * -30), axis: (x: 0, y: 1, z: 0))
                                            .opacity(phase.isIdentity ? 1.0 : 0.3)
                                    }
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .contentMargins(.horizontal, 10, for: .scrollContent)
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.viewAligned)
                    .scrollPosition(id: $scrollID)
                    // Button HStack
                    HStack {
                        Spacer()
                        Button("First") {
                            withAnimation {
                                if !ImageAsset.all.isEmpty {
                                    scrollID = ImageAsset.all[0].id
                                }
                            }
                        }
                        if let scrollID {
                            Text(ImageAsset.name(scrollID))
                        }
                        Button("Last") {
                            withAnimation {
                                if !ImageAsset.all.isEmpty {
                                    scrollID = ImageAsset.all[ImageAsset.all.count-1].id
                                }
                            }
                        }
                        Spacer()
                    }
                    .buttonStyle(.borderedProminent)
                    Spacer()
                }
                .onAppear {
                    if !ImageAsset.all.isEmpty {
                        scrollID = ImageAsset.all[0].id
                    }
                }
            }
            .navigationTitle("Part 2")
        }
    }
}

#Preview {
    Part2View()
}


struct ImageAsset: Identifiable {
    var id:Int
    var name: String
    
    static var all: [ImageAsset] {
        [
            .init(id: 11, name: "Haleakela"),
            .init(id: 12, name: "Monkey"),
            .init(id: 13, name: "Flowers"),
            .init(id: 14, name: "Crop Rows"),
            .init(id: 15, name: "Respite Pond"),
            .init(id: 16, name: "Hoover Dam"),
            .init(id: 17, name: "Wailaia"),
            .init(id: 18, name: "Gyro Beach"),
            .init(id: 19, name: "Palm Springs"),
            .init(id: 20, name: "Elephant Mountain"),
            .init(id: 21, name: "Borrego Springs"),
            .init(id: 10, name: "Desert Hills"),
        ]
    }
    
    static func name(_ id: Int) -> String {
        ImageAsset.all.first { $0.id == id }?.name ?? ""
    }
}
