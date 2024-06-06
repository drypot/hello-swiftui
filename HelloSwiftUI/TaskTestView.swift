//
//  TaskTestView.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 6/6/24.
//

import SwiftUI

@MainActor
func onMainActor(_ mark: String) {
    print("on main \(mark)")
}

func someAsync() async {
    print("on some async")
    await onMainActor("s") // use await
}

struct TaskTestView: View {
    @State var counter = Counter()
    var body: some View {
        Button("Task Test") {
            print(counter.increment())
            Task {
                onMainActor("a") // need not await
                await someAsync()
                onMainActor("b")
            }
            onMainActor("c")
        }
        .padding()
    }
}

#Preview {
    TaskTestView()
}
