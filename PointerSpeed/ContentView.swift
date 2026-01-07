//
//  ContentView.swift
//  PointerSpeed
//

import SwiftUI
import ServiceManagement

struct ContentView: View {
    @ObservedObject var hidUtil: HidUtil
    @State private var launchAtLogin = SMAppService.mainApp.status == .enabled

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Accélération souris")
                .font(.headline)

            HStack {
                Slider(value: $hidUtil.acceleration, in: 0...8, step: 0.5) { editing in
                    if !editing {
                        hidUtil.setAcceleration(hidUtil.acceleration)
                    }
                }
                .frame(width: 150)

                Text(String(format: "%.1f", hidUtil.acceleration))
                    .monospacedDigit()
                    .frame(width: 35)
            }

            Divider()

            HStack(spacing: 10) {
                Button("Off") {
                    hidUtil.disable()
                }
                Button("Reset (3.0)") {
                    hidUtil.reset()
                }
            }
            .buttonStyle(.bordered)

            Divider()

            Toggle("Lancer au démarrage", isOn: $launchAtLogin)
                .onChange(of: launchAtLogin) { _, newValue in
                    do {
                        if newValue {
                            try SMAppService.mainApp.register()
                        } else {
                            try SMAppService.mainApp.unregister()
                        }
                    } catch {
                        launchAtLogin = !newValue
                    }
                }

            Divider()

            Button("Quitter") {
                NSApplication.shared.terminate(nil)
            }
        }
        .padding()
        .frame(width: 220)
    }
}
