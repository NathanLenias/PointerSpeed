//
//  PointerSpeedApp.swift
//  PointerSpeed
//

import SwiftUI

@main
struct PointerSpeedApp: App {
    @StateObject private var hidUtil = HidUtil()

    var body: some Scene {
        MenuBarExtra {
            ContentView(hidUtil: hidUtil)
        } label: {
            Image(systemName: "computermouse.fill")
        }
        .menuBarExtraStyle(.window)
    }
}
