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

struct Part1View: View {
    @State private var numItems: Int = 10
    var body: some View {
        NavigationStack {
            Form {
                Section("Clip Shape & flashing scroll indicator") {
                    Text("Clip the shape of scrolling content and flash to show indicators on content change")
                        .font(.caption)
                    ScrollView(.horizontal) {
                        HScrollContent(color: .red, numItems: $numItems)
//                            .clipShape(RoundedRectangle(cornerRadius: 10))
//                            .clipShape(.rect(cornerRadius: 10))
                            .clipShape(.ellipse)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                    }
                    .scrollIndicatorsFlash(trigger: numItems)
//                    .border(.red)
                }
                Section("Content Margins") {
                    Text("Add margin to the content of a scoll container")
                        .font(.caption)
                    ScrollView(.horizontal) {
                        HScrollContent(color: .green, numItems: $numItems)
                    }
                    .border(.green)
                    .contentMargins(.horizontal, 10, for: .scrollContent)
                    .contentMargins(.bottom, 10, for: .scrollContent)
                }
                Section("Default Scroll Anchor") {
                    Text("Specify the default scroll position when the scrollview loads")
                        .font(.caption)
                    ScrollView(.horizontal) {
                        HScrollContent(color: .blue, numItems: $numItems)
                    }
                    .contentMargins(.bottom, 10, for: .scrollContent)
                    .defaultScrollAnchor(.center)
                }
                Section("Scroll ClipView") {
                    Text("To clip or not clip the content in a scroll view")
                        .font(.caption)
                    ScrollView(.horizontal) {
                        HScrollContent(color: .cyan, numItems: $numItems, shadowRadius: 5)
                    }
                    .scrollIndicators(.hidden)
//                    .contentMargins(5, for: .scrollContent)
                    .scrollClipDisabled()
                    .border(.red)
                }
            }
            .navigationTitle("ScrollView")
            .toolbar {
                Button {
                    numItems += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
        }
    }
}

#Preview {
    Part1View()
}

struct HScrollContent: View {
    let color: Color
    @Binding var numItems: Int
    let shadowRadius: CGFloat?
    init(color: Color, numItems: Binding<Int>, shadowRadius: CGFloat? = nil) {
        self.color = color
        self._numItems = numItems
        self.shadowRadius = shadowRadius
    }
    var body: some View {
        HStack {
            ForEach(1 ..< numItems, id: \.self) { i in
                Rectangle().fill(color.gradient)
                    .shadow(color: .primary, radius: shadowRadius ?? 0)
                    .frame(width: 50, height: 50)
                    .overlay {
                        Text(String(i))
                            .foregroundStyle(.white)
                    }
            }
        }
    }
}
