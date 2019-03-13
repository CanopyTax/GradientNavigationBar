[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# GradientNavigationBar

GradientNavigationBar is a drop in subclass of UINavigationBar that easily allows you to set the background to be a gradient. It supports SafeAreaLayoutGuide so it looks great on iPhone X and 3rd generation iPad Pro devices.

## Requirements

- iOS 9.0+
- Xcode 10.0+
- Swift 4.2+

## Installation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate GradientNavigationBar into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "CanopyTax/GradientNavigationBar" ~> 0.1.5
```

Run `carthage update` to build the framework and drag the built `GradientNavigationBar.framework` into your Xcode project.

### CocoaPods

Coming Soon

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate GradientNavigationBar into your project manually.

---

## Usage

### Quick Start
Initialize GradientNavigationBar with a rootViewController:
```swift
let gradientNavigationController = GradientNavigationBar(rootViewController: ViewController())
// Set gradient colors
gradientNavigationController.gradientColors = [GradientNavigationBarColor(color: UIColor.blue, location: 0.0),
                                               GradientNavigationBarColor(color: UIColor.purple, location: 1.0)]
```

In most cases, you can interact with GradientNavigationBar in the same way you use UINavigationController
```swift
class MyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set a single title
        self.title = "My View Title"
        
        // Set a title with a header
        self.navigationItem.setTitle(title: "Title", header: "Header")

        // Create button items
        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        let randomBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(randomButtonPressed))

        // Set button items
        self.navigationItem.setRightBarButtonItems([addBarButtonItem, randomBarButtonItem], animated: true)
    }
    
    @objc func addButtonPressed() {
        navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    @objc func randomButtonPressed() {
        // ...
    }
}
```

---

## License

GradientNavigationBar is released under the MIT license. See LICENSE for details.
