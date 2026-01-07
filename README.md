# PointerSpeed

A simple macOS menu bar app to control mouse acceleration.

![macOS](https://img.shields.io/badge/macOS-13.0+-blue)
![Swift](https://img.shields.io/badge/Swift-5-orange)

## Features

- Adjust mouse acceleration (0 to 8) with a slider
- Disable acceleration completely
- Reset to default (3.0)
- Launch at login option
- Lives in the menu bar (no Dock icon)

## Screenshot

```
┌─────────────────────────┐
│ Accélération souris     │
│ ━━━━━━━━━●━━━━━ 2.5    │
│                         │
│ [Off]  [Reset (3.0)]    │
│ ─────────────────────── │
│ ☐ Lancer au démarrage   │
│ ─────────────────────── │
│ Quitter                 │
└─────────────────────────┘
```

## How it works

Uses `hidutil` under the hood to modify `HIDMouseAcceleration` in real-time (no logout required).

## Installation

### Download (recommended)

1. Download `PointerSpeed.app.zip` from [Releases](https://github.com/NathanLenias/PointerSpeed/releases)
2. Unzip and drag `PointerSpeed.app` to `/Applications`
3. Launch it — the app lives in your menu bar

### Build from source

1. Clone this repository
2. Open `PointerSpeed.xcodeproj` in Xcode
3. Build and run (⌘R)

## Requirements

- macOS 13.0 or later

## License

MIT License - see [LICENSE](LICENSE)
