# mobile-webdriverio-bdd
Native Mobile Test Automation with WebDriver.IO using Cucumber Framework

# Ensuring the latest NODE / NPM is installed

```bash
npm cache clean -f
brew update
brew install node
brew upgrade node
npm install -g latest
npm -v
```

# Get Started with the WebDriver.IO
```bash
npm init -y
npm install --save-dev @types/webdriverio
npm install --save-dev @wdio/cli @wdio/appium-service @wdio/cucumber-framework appium
npx wdio config
```
On the Wizard, select these suggested options presented in the terminal:

```bash
? What type of testing would you like to do?
    ❯ E2E Testing - of Web or Mobile Applications

? Where is your automation backend located?
    ❯ On my local machine

? Which environment you would like to automate?
    ❯ Mobile - native, hybrid and mobile web apps, on Android or iOS

? Which mobile environment you would like to automate?
    ❯ iOS - applications on iOS, iPadOS, and tvOS > using XCTest (https://appium.github.io/appium-xcuitest-driver)

? Which framework do you want to use?
    ❯ Cucumber (https://cucumber.io/)

? Do you want to use Typescript to write tests?
    ❯ Yes

? Do you want WebdriverIO to autogenerate some test files?
    ❯ Yes

? What should be the location of your feature files? 
    ❯ (/Users/hudsonssrosa/git-projects/mobile-webdriverio-bdd/features/**/*.feature)

? What should be the location of your step definitions?
    ❯ (/Users/hudsonssrosa/git-projects/mobile-webdriverio-bdd/features/step-definitions/steps.ts)

? Do you want to use page objects (https://martinfowler.com/bliki/PageObject.html)?
    ❯ Yes

? Where are your page objects located? 
    ❯ (/Users/hudsonssrosa/git-projects/mobile-webdriverio-bdd/features/pageobjects/**/*.ts)

? Which reporter do you want to use?
    ❯ allure

? Do you want to add a plugin to your test setup?
    ❯ wait-for: utilities that provide functionalities to wait for certain conditions till a defined task is complete.
   > https://www.npmjs.com/package/wdio-wait-for

? Would you like to include Visual Testing to your setup? For more information see https://webdriver.io/docs/visual-testing!
    ❯ Yes

? Do you want to add a service to your test setup?
    ❯ visual / novus-visual-regression

? Do you want me to run `npm install`?
    ❯ Yes
```

---------
# APPIUM
You can start by isntalling Appium globally as a minimum requirement:
```bash
npm install -g appium
npm install -g appium-doctor
appium -v
```

## Appium installer
To setup advanced options for Appium, from this command below, use the Wizard to help achieve a better setup:
```bash
npx appium-installer

    ❯ Install Appium Server 
        ❯ Select latest Server version
    
    ❯ Install Appium Drivers
        ❯ xcuitest
            ❯ latest

    ❯ Install Appium Plugin
        ❯ appium-device-farm
            ❯ npm

    ❯ Need help setting up iOS Environment to run your Appium test?
        ❯ Both
```

Open Appium from the command:

```bash
appium
```
-----------------------
# ANDROID STUDIO Setup
If you are using Android on your project, make sure you have all the requirements satisfied with Appium Drivers.
Initially, install UIAutomator2 and run the Appium Doctor to have an initial analysis about your environment and further needs.

## Appium Doctor for Android
```bash
appium driver install uiautomator2
appium driver list
appium-doctor --android
```

## 1. Find the SDK Location
If you have Android Studio installed, the default location is usually:

- macOS: ~/Library/Android/sdk
- Linux: ~/Android/Sdk
- Windows: C:\Users\<YourUsername>\AppData\Local\Android\Sdk

## 2. Set the Environment Variable:
For macOS/Linux, open your terminal and run:

```bash
echo 'export ANDROID_HOME=$HOME/Library/Android/sdk' >> ~/.bash_profile
echo 'export PATH=$PATH:$ANDROID_HOME/emulator' >> ~/.bash_profile
echo 'export PATH=$PATH:$ANDROID_HOME/tools' >> ~/.bash_profile
echo 'export PATH=$PATH:$ANDROID_HOME/tools/bin' >> ~/.bash_profile
echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> ~/.bash_profile
source ~/.bash_profile
```

For Windows:
- Right-click on "This PC" or "My Computer" and choose "Properties."
- Click on "Advanced system settings."
- In the System Properties window, click on "Environment Variables."
- Under System variables, click "New" and enter:
- Variable name: ANDROID_HOME
- Variable value: (path to your Android SDK, e.g., C:\Users\<YourUsername>\AppData\Local\Android\Sdk)
- Add the SDK's platform-tools and tools directories to the Path variable.

## 3. Set JAVA_HOME Environment Variable
This variable points to your Java Development Kit (JDK) installation.

Find the JDK Installation. The default locations are usually:
- macOS: /Library/Java/JavaVirtualMachines/jdk<version>.jdk/Contents/Home
- Linux: /usr/lib/jvm/java-<version>-openjdk
- Windows: C:\Program Files\Java\jdk<version>

### 4. Set the Environment Variable:
For macOS/Linux, open your terminal and run:

```bash
echo 'export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk<version>.jdk/Contents/Home' >> ~/.bash_profile
source ~/.bash_profile
```

For Windows:
Follow the same steps as for ANDROID_HOME, but this time use JAVA_HOME as the variable name and the path to your JDK as the variable value.

## 5. Re-run Appium Doctor
After installing the necessary tools and setting up the environment variables, run the following command again to verify everything is correctly configured:
```bash
appium-doctor --android
```

--------------
# XCODE Setup

## 1. Appium Doctor for iOS
Run Appium Doctor to check all the missed requirements for XCode:
```bash
appium-doctor --ios
```

## 2. Install XCode
```bash
brew install --cask xcode
xcode-select --install
```

Then, check the path:
```bash
xcode-select -p
```
It should return a path like /Applications/Xcode.app/Contents/Developer. If it doesn't, you can set it manually with:
```bash
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
```

If Xcode is already installed but still causing issues, consider reinstalling it from the Mac App Store or clearing out any incomplete installations.

## 3. Install Carthage
Carthage is a dependency manager for Cocoa projects. Install it using Homebrew:
```bash
brew install carthage
carthage version
```

## 4. Install Missing Tools and Libraries
You have several optional dependencies that are recommended for better functionality with Appium. 
For example, install these ones using Homebrew:

```bash
brew install ffmpeg
npm install -g mjpeg-consumer
brew install set-simulator-location
npm install -g idb-companion
brew install applesimutils
npm install -g ios-deploy
```

## 5. Re-run Appium Doctor
After installing the necessary tools and setting up the environment variables, run the following command again to verify everything is correctly configured:
```bash
appium-doctor --ios
```

--------------------
# Running the tests
```bash
npm run wdio
```

---------------
# Further info
If you have chosen Typescript as a main language for writing you tests, but you also wanted to maintain Javascript as part of the implementation, make sure your `tsconfig.json` contains this following line:
```bash
    "allowJs": true
```