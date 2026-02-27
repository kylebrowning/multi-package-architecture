# Multi-Package Architecture

Companion code for the [Multi-Package Architecture](https://kylebrowning.com/posts/multi-package-architecture) blog post, the final part of the [Modularizing Swift Apps with SPM](https://kylebrowning.com/series/modularizing-swift-apps) series.

## Structure

```
CommonPackage/              # Shared foundation (zero external dependencies)
├── Sources/
│   ├── Env/                # Environment configuration
│   ├── Logger/             # Logging utilities
│   ├── Toolkit/            # Network client, protocols, utilities
│   └── DesignSystem/       # Shared UI components

LandmarksPackage/           # Landmarks vertical slice
├── Sources/
│   ├── LandmarksApi/       # API models + endpoints
│   ├── LandmarksDomain/    # Domain models, services, mocks
│   ├── LandmarksFeature/   # SwiftUI views
│   └── LandmarksPreviewApp/# Mini preview app

ReservationsPackage/        # Reservations vertical slice
├── Sources/
│   ├── ReservationsApi/    # API models + endpoints
│   ├── ReservationsDomain/ # Domain models, services, mocks
│   ├── ReservationsFeature/# SwiftUI views
│   └── ReservationsPreviewApp/

SocialPackage/              # Social vertical slice
├── Sources/
│   ├── SocialApi/          # API models + endpoints
│   ├── SocialDomain/       # Domain models, services, mocks
│   └── SocialFeature/      # SwiftUI views

MyApp/                      # Thin composition root
└── Sources/
    ├── MyApp.swift
    ├── ContentView.swift
    └── ServiceEnvironment.swift
```

## Building

```bash
cd CommonPackage && swift build
cd LandmarksPackage && swift build
cd ReservationsPackage && swift build
cd SocialPackage && swift build
```

## License

MIT
