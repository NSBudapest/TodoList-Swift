# TodoList-Swift

Swift app for NSBudapest UI testing workshop.

Start with forking this repository to make sure you have your own version.

## Install

Use Carthage for updating dependencies. If you don't have [Carthage](https://github.com/Carthage/Carthage) installed on your machine, run:

`brew update && brew install carthage`

Then go to your project's root and run:

`carthage bootstrap --platform iOS`

to have your dependencies installed.

## If you're not on Xcode 7.3

Please go to your main target and remove KIF.framework from your embedded framework section of Build phases. Also, please remove the Run script phase called `Copy Carthage frameworks`.

Read more about this issue at [KIF's GitHub page](https://github.com/kif-framework/KIF/issues/822#issuecomment-202524287).

## Run

Press play in Xcode and see your app running.
