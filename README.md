# Abound Client SDK

The Abound Client SDK provides convenient access to embeddable UI components powered by [Abound's API](https://docs.withabound.com/) .

## Requirements

-   iOS 13.
-   Swift 5.5+
-   Xcode 13.0+

## Installation

The preferred way of installing the Abound iOS Client SDK is via the [Swift Package Manager](https://swift.org/package-manager/).

1. In Xcode, open your project and navigate to **File** → **Swift Packages** → **Add Package Dependency...**
2. Paste the repository URL (`https://github.com/withabound/abound-ios-client-sdk/`) and click **Next**.
3. For **Rules**, select **Branch** (with branch set to `main`).
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
Abound.accessToken = "accessToken_sampleeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2OTY5ODczNTcsImV4cCI6MTY5Njk4NzY1NywiYXVkIjoiYXBwSWRfc2FtcGxlcU5oVmNkWVFZVSIsImlzcyI6Imh0dHBzOi8vc2FuZGJveC1hcGkud2l0aGFib3VuZC5jb20vdjQiLCJzdWIiOiJ1c2VySWRfc2FtcGxlWEdNRm5oT3BlUiJ9.-NrPVQvsnM8vJouyuP5yeFGlYb1xGgR-gS3v87p5BQk"
```

Then we can show the [Tax Profile](https://docs.withabound.com/docs/tax-profile-drop-in-w-9-substitute)

```swift
TaxProfile()
```

we can also add Custom Text Content for Tax Profile, for specific states.
Currently you can set the values for

submitButton (Defaults to 'Submit')
loadingButton (Defaults to 'Loading...')
loadingPrompt (Defaults to 'This should take less than 10 seconds.')
errorMessage (Defaults to 'Invalid')

```swift
    AboundCustomTextContent(
        submitButton:"Submit Button",
        loadingButton:"Loading Button",
        loadingPrompt: "Loading Prompt...",
        errorMessage: "Someething went wrong"
    );
```

or a [Tax Document](https://docs.withabound.com/docs/tax-documents-drop-in)

```swift
TaxDocuments(year: '2022')
```

Some properties for the design can be changed used [custom themes](https://docs.withabound.com/docs/white-label-theming), that can be passed as optional parameters for the TaxDocument / TaxProfile

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
