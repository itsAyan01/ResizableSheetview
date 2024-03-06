//
//  SheetViewModifier.swift
//  CustomSheetViewSDK
//
//  Created by Ayan Ansari on 06/03/24.
//

import SwiftUI

// MARK: Custom Sheet View Modifier
@available(iOS 14.0, *)
@available(iOS 15.0, *)
public struct SheetViewModifier<T: View>: ViewModifier {
    @Binding var isPresented: Bool
    var withoutRoundedCorner: Bool
    var withCancelButton: Bool
    var showDragBar: Bool
    var withBlurBG: Bool
    var maxHeight: CGFloat
    let sheetView: T
    
    public func body(content: Content) -> some View {
        content
            .overlay {
                if isPresented {
                    ResizableSheetView(isPresented: $isPresented,
                                       withoutRoundedCorner: withoutRoundedCorner,
                                       showCancelButton: withCancelButton,
                                       showDragBar: showDragBar,
                                       withBlurBG: withBlurBG,
                                       maxHeight: maxHeight) {
                        sheetView
                    }
                }
            }
    }
}
