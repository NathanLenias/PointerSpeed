//
//  HidUtil.swift
//  PointerSpeed
//

import Foundation
import Combine

class HidUtil: ObservableObject {
    @Published var acceleration: Double = 3.0

    init() {
        refresh()
    }

    func refresh() {
        if let value = getAcceleration() {
            acceleration = value
        }
    }

    private func runHidutil(_ args: [String]) -> String? {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/hidutil")
        process.arguments = args

        let pipe = Pipe()
        process.standardOutput = pipe
        process.standardError = pipe

        do {
            try process.run()
            process.waitUntilExit()
            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            return String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines)
        } catch {
            return nil
        }
    }

    func getAcceleration() -> Double? {
        guard let output = runHidutil(["property", "--get", "HIDMouseAcceleration"]),
              let value = Double(output) else { return nil }
        return value / 65536.0
    }

    func setAcceleration(_ value: Double) {
        let rawValue = Int(value * 65536)
        let json = "{\"HIDMouseAcceleration\": \(rawValue)}"
        _ = runHidutil(["property", "--set", json])
        acceleration = value
    }

    func disable() {
        setAcceleration(-1)
    }

    func reset() {
        setAcceleration(3.0)
    }
}
