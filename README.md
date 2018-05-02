# Kio
Kio is a personal toolset I usually incorporate into projects. This toolset is the result of various iOS blog posts I've come across and found useful.

It contains many convenience tools to handle conventional iOS application boiler plate code such as UICollectionViewDataSource setup,
defining specific UIColors, setting UIViews up for AutoLayout, adding Selectors to UIControls, etc.

Kio also contains Coordinators to facilitate the use of the Coordinator design pattern and thread-safe collections via the SyncrhonizedArray and SynchronizedDictionary

## Requirements
Kio requires iOS 10.0 or higher and Swift 4.x

## Installation
1. Add the following to your [Podfile](http://guides.cocoapods.org/using/the-podfile.html):

```ruby
pod 'Kio', :git => 'https://github.com/hooliooo/Kio.git'
```
2. Integrate your dependencies using frameworks: add `use_frameworks!` to your Podfile. 
3. Run `pod install`.
