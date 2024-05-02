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

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .background(.red)
            .offset(x: 100, y: 100)
    }
}


#Preview {
    ContentView()
}
