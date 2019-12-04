# SurveyBox iOS App
#
> SurveyBox is a lightweight, cloud-based mobile application that will allow users to create, view and share surveys to their targeted audience. Users can create survey templates from scratch and also use premade survey templates to fit their needs. Both types of templates are completely customizable to allow creators to retrieve all the necessary data in gathering requirements from their audience. Non-users are allowed to view surveys and fill them out, while members are allowed to create a profile that saves the history for every form that has been created, filled or are currently in use. Metrics will be provided along with the history for the creator of that particular survey.

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)  
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

Upon opening the app the user will be directed to the login page with an option to create a new account. Once the user is logged in, the user will be directed to the main page where surveys can be created and viewed. The create survey page would allow the user to create a custom survey. On the view survey page, the user can view past surveys that have been created. To filter the results on the page, the user can search for each survey and pull up the most relevant results. This will display some data and metric feedback from the surveys.

![](header.png)

## Features

- [x] Signup SurveyBox Account
- [x] Sign In to SurveyBox
- [x] Create Survey
- [x] Mange Survey
- [x] Share Survey

## Requirements

- iOS 8.0+
- Xcode 7.3

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `YourLibrary` by adding it to your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!
pod 'YourLibrary'
```

#### Google's Firbase Database
Install Firbase locally  [Firbase](https://firebase.google.com/) to install `Firbase` by adding it to your `Podfile`:

```Firbase

pod install
```

To get the full benefits import `YourLibrary` wherever you import UIKit

``` swift
import UIKit
import YourLibrary
```


```
github "yourUsername/yourlibrary"
```
#### Manually
1. Download and drop ```YourLibrary.swift``` in your project.  
2. Congratulations!  

## Usage example

```swift
import EZSwiftExtensions
ez.detectScreenShot { () -> () in
    print("User took a screen shot")
}
```

## Contributors
#### Abraham Tesfay
#### Johnny Phenglavong
#### Mohammad Al-Ramahi





Distributed under the SurveyBox license. See ``LICENSE`` for more information.

[https://github.com/atesfay/SurveyBox_iOSApp](https://github.com/dbader/)

[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
