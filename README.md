# ReSizableSheet View in SwiftUI

## A simple half sheet view which will adjust it's height according to the view paased to it.

You can use this to present a small sheet or a half sheet on your swiftui view. this solves the issue for half sheet in iOS 15 as we know that in iOS 16 apple introduces the "presentationDetents" view modifier on sheet by which we can set the height of the default sheet but what for iOS 15 
here i present the ReSizableSheet view for you which will work for not only in iOS 15 but you can use this in iOS 16, 17 also.
this sheet view will adjust it's size according to the passed view.

Some exciting features are follownig :-
1. present the sheet view with fixed height you want.
2. change background of sheet view with beautiful blur effect.
3. set the max height for the sheet.

```
dependencies: [
    .package(url: "https://github.com/itsAyan01/ResizableSheetview.git")
]
```
