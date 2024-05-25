//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Héctor Manuel Sandoval Landázuri on 29/04/24.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        Text("Hello, World!")
//            .padding(20)
//            .background(.red)
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        VStack(alignment: .leading) {
//            ForEach(0..<10) { position in
//                Text("Number \(position)")
//                    .alignmentGuide(.leading) { _ in Double(position) * -10 }
//            }
//        }
//        .background(.red)
//        .frame(width: 400, height: 400)
//        .background(.blue)
//    }
//}

//extension VerticalAlignment {
//    struct MidAccountAndName: AlignmentID {
//        static func defaultValue(in context: ViewDimensions) -> CGFloat {
//            context[.top]
//        }
//    }
//
//    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
//}

//struct ContentView: View {
//    var body: some View {
//        HStack(alignment: .midAccountAndName) {
//            VStack {
//                Text("@hector")
//                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
//                Image(.canada)
//                    .resizable()
//                    .frame(width: 64, height: 64)
//            }
//
//            VStack {
//                Text("Full name:")
//                Text("Héctor Sandoval")
//                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
//                    .font(.largeTitle)
//            }
//        }
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        Text("Hello, world!")
//            .background(.red)
//            .offset(x: 100, y: 100)
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        HStack {
//            Text("IMPORTANT")
//                .frame(width: 200)
//                .background(.blue)
//
//            GeometryReader { proxy in
//                Image(.canada)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: proxy.size.width * 0.8)
//                    .frame(width: proxy.size.width, height: proxy.size.height)
//            }
//        }
//        
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            GeometryReader { proxy in
//                Text("Hello, World!")
//                    .frame(width: proxy.size.width * 0.9,height: 40)
//                    .background(.red)
//            }
//            .background(.green)
//            Text("More text")
//                .background(.blue)
//        }
//    }
//}

//struct OuterView: View {
//    var body: some View {
//        VStack {
//            Text("Top")
//            InnerView()
//                .background(.green)
//            Text("Bottom")
//        }
//    }
//}
//
//struct InnerView: View {
//    var body: some View {
//        HStack {
//            Text("Left")
//            GeometryReader { proxy in
//                Text("Center")
//                    .background(.blue)
//                    .onTapGesture {
//                        print("Global center: \(proxy.frame(in: .global).midX) x \(proxy.frame(in: .global).midY)")
//                        print("Custom center: \(proxy.frame(in: .named("Custom")).midX) x \(proxy.frame(in: .named("Custom")).midY)")
//                        print("Local center: \(proxy.frame(in: .local).midX) x \(proxy.frame(in: .local).midY)")
//                    }
//            }
//            .background(.orange)
//            Text("Right")
//        }
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        OuterView()
//            .background(.red)
//            .coordinateSpace(name: "Custom")
//    }
//}

//struct ContentView: View {
//    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
//
//    var body: some View {
//        GeometryReader { fullView in
//            ScrollView {
//                ForEach(0..<50) { index in
//                    GeometryReader { proxy in
//                        Text("Row #\(index)")
//                            .font(.title)
//                            .frame(maxWidth: .infinity)
//                            .background(colors[index % 7])
//                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
//                    }
//                    .frame(height: 40)
//                }
//            }
//        }
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 0) {
//                ForEach(1..<20) { num in
//                    GeometryReader { proxy in
//                        Text("Number \(num)")
//                            .font(.largeTitle)
//                            .padding()
//                            .background(.red)
//                            .rotation3DEffect(.degrees(-proxy.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
//                            .frame(width: 200, height: 200)
//                    }
//                    .frame(width: 200, height: 200)
//                }
//            }
//        }
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 0) {
//                ForEach(1..<20) { num in
//                    Text("Number \(num)")
//                        .font(.largeTitle)
//                        .padding()
//                        .background(.red)
//                        .frame(width: 200, height: 200)
//                        .visualEffect { content, proxy in
//                            content
//                                .rotation3DEffect(.degrees(-proxy.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
//                        }
//
//                }
//            }
//        }
//    }
//}

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    let fadeOutFromTopThreshold: CGFloat = 200
    let scaleUpToBottomThreshold: CGFloat = 2
    let scaleUpToTopThreshold: CGFloat = 0.5
    
    func getOpacityOfView(yAxis: CGFloat) -> Double {
        return yAxis < fadeOutFromTopThreshold ? yAxis / fadeOutFromTopThreshold : 1
    }
    
    func getScaleOfView(midYAxis: CGFloat, globalMidY: CGFloat) -> CGFloat {
        var newScale = midYAxis / globalMidY
        
        if newScale > scaleUpToBottomThreshold {
            newScale = scaleUpToBottomThreshold
        } else if newScale < scaleUpToTopThreshold {
            newScale = scaleUpToTopThreshold
        }
        
        return newScale
    }
    
    func rad2deg(_ number: Double) -> Double {
        return number * 180 / .pi
    }
    
    func getHueOfView(minYAxis: CGFloat, globalHeight: CGFloat) -> Double {
        let rate = minYAxis / globalHeight
        return rate > 1 ? 1 : rate
    }
    
    let caount: Double = 180 / .pi
    

    
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: getHueOfView(minYAxis: geo.frame(in: .global).minY, globalHeight: fullView.size.height), saturation: 1, brightness: 1))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(getOpacityOfView(yAxis: geo.frame(in: .global).minY))
                            .scaleEffect(getScaleOfView(midYAxis: geo.frame(in: .global).midY, globalMidY: fullView.frame(in: .global).midY))
                            .onTapGesture {
                                print(getHueOfView(minYAxis: geo.frame(in: .global).minY, globalHeight: fullView.size.height))
                            }
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
