//
//  CustomListDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/25/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/group/init(sections:transform:)
// https://developer.apple.com/documentation/swiftui/group/init(subviews:transform:)

struct CustomListDemo: View {

    struct Part: Identifiable, Hashable, IDHashable {
        let id = UUID()
        let name: String
    }

    struct Product: Identifiable, Hashable, IDHashable {
        let id = UUID()
        let name: String
        let parts: [Part]
    }

    static let products = [
        Product(name: "Product 1", parts: [Part(name: "P1"), Part(name: "P2"), Part(name: "P3")]),
        Product(name: "Product 2", parts: [Part(name: "P4"), Part(name: "P5"), Part(name: "P6")]),
        Product(name: "Product 3", parts: [Part(name: "P7"), Part(name: "P8"), Part(name: "P9")]),
    ]

    var body: some View {
        HStack {

            CustomList {
                ForEach(Self.products) { product in
                    Section(product.name) {
                        ForEach(product.parts) { part in
                            Text(part.name)
                        }
                    }
                }
                Section("Extra") {
                    Text("P10")
                    Text("P11")
                    Text("P12")
                }
            }

            CustomListWithSection {
                ForEach(Self.products) { product in
                    Section(product.name) {
                        ForEach(product.parts) { part in
                            Text(part.name)
                        }
                    }
                }
                Section("Extra") {
                    Text("P10")
                    Text("P11")
                    Text("P12")
                }
            }

        }
    }


    struct CustomList<Content: View>: View {
        @ViewBuilder var content: Content
        var body: some View {
            VStack {
                Group(subviews: content) { subviews in
                    if let first = subviews.first {
                        first
                            .font(.largeTitle)
                    }
                    if subviews.count >= 4 {
                        subviews[1...3]
                            .font(.headline)
                    }
                    subviews[4...]
                }
            }
        }
    }

    struct CustomListWithSection<Content: View>: View {
        @ViewBuilder var content: Content
        var body: some View {
            VStack {
                Group(sections: content) { sections in
                    ForEach(sections) { section in
                        section.header
                            .font(.headline)
                        ForEach(section.content) { subview in
                            subview
                        }
                        section.footer
                    }
                }
            }
        }
    }

}

#Preview {
    CustomListDemo()
}
