Shionix
===============
[![Language: Swift 5](https://img.shields.io/badge/Swift-5-red.svg?style=flat-square)](https://swift.org)
[![CocoaPods](https://img.shields.io/badge/pod-v1.7.5-blue)]()

<img src="ionix.jpg">

Building the code
-----------------
1. Install the latest [Xcode developer tools](https://developer.apple.com/xcode/downloads/) from Apple.
1. Install [Pods](https://cocoapods.org/)
    ```shell
    sudo gem install cocoapods
    ```
1. Clone the repository:
    ```shell
    git clone https://github.com/Pr0gmaT1k/Shionix
    ```
1. Pull in the project dependencies:
    ```shell
    cd Shionix
    pod install
    ```
1. Open `Shionix.xcworkspace` in Xcode.


Tools:
-----------------
The `Realm` `Codable` Object are generated from `Tools/DataModel.xcdatamodel` with Gyro.
Gyro is a tool to generate Realm model classes, for both Android (Java & Kotlin) and iOS/macOS (Swift), from an `.xcdatamodel` file.
1. Go to [Gyro](https://github.com/NijiDigital/gyro) directory:
    ```shell
    cd Tools
    ```    

1. Modify the data model in `Tools/DataModel.xcdatamodel` and then regenerate with gyro:
    ```shell
    sudo ./gyro.sh
    ```

## Networking:
* **[Moya](https://github.com/Moya/Moya):** Network abstraction layer written in Swift.

## Model & Decode:
* **[RealmSwift](https://github.com/realm/realm-cocoa):** Realm is a mobile database that runs directly inside phones, tablets or wearables. This repository holds the source code for the iOS, macOS, tvOS & watchOS versions of Realm Swift & Realm Objective-C.
* **[Codable](https://developer.apple.com/documentation/swift/codable):** A type that can convert itself into and out of an external representation.

## UI:
* **[Reusable](https://github.com/AliSoftware/Reusable):** A Swift mixin to use UITableViewCells, UICollectionViewCells and UIViewControllers in a type-safe way, without the need to manipulate their String-typed reuseIdentifiers.
* **[Toaster](https://github.com/devxoul/Toaster):** Android-like toast with very simple interface. (formerly JLToast)

## Coding Tools:
* **[SwiftLint](https://github.com/realm/SwiftLint):** A tool to enforce Swift style and conventions, loosely based on GitHub's Swift Style Guide.
* **[SwiftGen](https://github.com/SwiftGen/SwiftGen):** SwiftGen is a tool to auto-generate Swift code for resources of your projects, to make them type-safe to use.

## Gitflow
This project follow Gitflow's rules.
Gitflow Workflow is a Git workflow design that was first published and made popular by Vincent Driessen at nvie. The Gitflow Workflow defines a strict branching model designed around the project release. This provides a robust framework for managing larger projects.  
### Documentation:
[EN](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) [ES](https://gfourmis.co/gitflow-sin-morir-en-el-intento/)
