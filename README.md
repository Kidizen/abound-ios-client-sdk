
# Abound Client SDK

The Abound Client SDK provides convenient access to embeddable UI components powered by [Abound's API](https://docs.withabound.com/) .

## Requirements 

- iOS 13.
- Swift 5.5+
- Xcode 13.0+

## Installation

The preferred way of installing the Abound iOS Client SDK is via the [Swift Package Manager](https://swift.org/package-manager/).

1. In Xcode, open your project and navigate to **File** → **Swift Packages** → **Add Package Dependency...**
2. Paste the repository URL (`https://github.com/withabound/abound-ios-client-sdk/`) and click **Next**.
3. For **Rules**, select **Branch** (with branch set to `master`).
4. Click **Finish**.
5. Open the Project settings, add **SwiftUI.framework** to the **Linked Frameworks and Libraries**, set **Status** to **Optional**.

<br>

### Getting Started

You can start to integrate the Abound Client SDK library into your solution as soon as you [create an account with Abound][developer-dashboard-signup], [obtain your API keys][developer-dashboard-keys], and create an access token.

### Usage
First we need to import the Abound namespace
```swift
import Abound
```

The Abound client must be configured with an `accessToken` requested from the [Abound API](https://docs.withabound.com/reference/createaccesstoken).

```swift
Abound.accessToken = "accessToken_testeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBfaWQiOiJhcHBJZF90ZXN0NDhlN2VhYTMxNzVhNjYzNTRlMDA2MjY1NDJkMiIsImNyZWF0ZWRfdGltZXN0YW1wIjoxNjU1MDk2NDAwMDAwLCJlbnZpcm9ubWVudCI6Imh0dHBzOi8vc2FuZGJveC1hcGkud2l0aGFib3VuZC5jb20vdjIiLCJleHBpcmF0aW9uX3RpbWVzdGFtcCI6MzI1MDM3MDE2MDAwMDAsInN0YXR1cyI6IkFjdGl2ZSIsInVzZXJfaWQiOiJ1c2VySWRfdGVzdDI0YjA1ZDc2MWZmNThiNTkzMWJkMDc3NzhjNjdiNGU4MThlNCIsImlhdCI6MTY1NTEzMDMxM30.dOUIyxTRV0QDmrFiy-GoyhKc8qru3pymIcPS5cGTaNk"
```

Then we can show the [Tax Profile](https://docs.withabound.com/docs/adding-a-tax-profile-drop-in-to-your-app)

```swift
TaxProfile()
```

or a [Tax  Document](https://docs.withabound.com/docs/adding-a-tax-documents-drop-in-to-your-app)

```swift
TaxDocuments(year: '2022')
```

Some properties for the design can be changed used [custom themes](https://docs.withabound.com/docs/custom-theming-for-drop-in-components), that can be passed as optional parameters for the TaxDocument / TaxProfile

```swift
AboundTheme(
    text:AboundThemeText(size:"16px"),
    color: AboundThemeColor(background: "#FFFF00"),
    shape:AboundThemeShape(componentCornerRadius: "16px"),
    button: AboundThemeButton(colorActiveBackground: "#655BEF")
)
```


[docs]: https://docs.withabound.com
[developer-dashboard]: https://dashboard.withabound.com
[developer-dashboard-keys]: https://dashboard.withabound.com/keys
[developer-dashboard-signup]: https://dashboard.withabound.com/signup
