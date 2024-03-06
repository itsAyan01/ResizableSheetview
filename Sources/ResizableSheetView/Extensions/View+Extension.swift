//
//  View+Extension.swift
//  CustomSheetViewSDK
//
//  Created by Ayan Ansari on 06/03/24.
//

import Foundation
import SwiftUI

extension View {
    
    /// Show Custom Sheet
    @available(iOS 15.0, *)
    /// call this modifier on the most outer view of your UI which covers the whole screen
    /// - Parameters:
    ///   - isPresented: paas the binding of the show sheet varibale
    ///   - withoutRoundedCorners: pass true if you want rounded corner sheet
    ///   - withCancelButton: add a default cancel button to top of the sheet
    ///   - withBlurBG: make blur background of sheet
    ///   - maxHeight: the max height of a sheet
    ///   - contentView: pass the view that you want to show on the sheet
    /// - Returns:
    public func showResizableSheet<V: View>(isPresented: Binding<Bool>,
                                     withoutRoundedCorners: Bool = false,
                                     withCancelButton: Bool = true,
                                     withBlurBG: Bool = false,
                                     maxHeight: CGFloat = UIScreen.main.bounds.height * 0.75,
                                     @ViewBuilder contentView: () -> V) -> some View {
        modifier(SheetViewModifier(isPresented: isPresented,
                                   withoutRoundedCorner: withoutRoundedCorners,
                                   withCancelButton: withCancelButton,
                                   showDragBar: false,
                                   withBlurBG: withBlurBG,
                                   maxHeight: maxHeight,
                                   sheetView: contentView()))
    }
    
    @available(iOS 15.0, *)
    /// call this modifier on the most outer view of your UI which covers the whole screen
    /// - Parameters:
    ///   - isPresented: paas the binding of the show sheet varibale
    ///   - withoutRoundedCorners: pass true if you want rounded corner sheet
    ///   - withCancelButton: add a default cancel button to top of the sheet
    ///   - withBlurBG: make blur background of sheet
    ///   - maxHeight: the max height of a sheet
    ///   - contentView: pass the view that you want to show on the sheet
    /// - Returns:
    public func showResizableSheet<V: View>(isPresented: Binding<Bool>,
                                     withoutRoundedCorners: Bool = false,
                                     withCancelButton: Bool = true,
                                     withBlurBG: Bool = false,
                                     _maxHeight: CGFloat,
                                     @ViewBuilder contentView: () -> V) -> some View {
        modifier(SheetViewModifier(isPresented: isPresented,
                                   withoutRoundedCorner: withoutRoundedCorners,
                                   withCancelButton: withCancelButton,
                                   showDragBar: false,
                                   withBlurBG: withBlurBG,
                                   maxHeight: _maxHeight,
                                   sheetView: contentView()))
    }
    
    @available(iOS 15.0, *)
    // Sheet with drag bar on top
    /// call this modifier on the most outer view of your UI which covers the whole screen
    /// - Parameters:
    ///   - isPresented: paas the binding of the show sheet varibale
    ///   - withoutRoundedCorners: pass true if you want rounded corner sheet
    ///   - showDragBar: present a drag indicator bar on top of the sheet
    ///   - withBlurBG: make blur background of sheet
    ///   - maxHeight: the max height of a sheet
    ///   - contentView: pass the view that you want to show on the sheet
    /// - Returns:
    public func showResizableSheet<V: View>(isPresented: Binding<Bool>,
                                     withoutRoundedCorners: Bool = false,
                                     showDragBar: Bool,
                                     withBlurBG: Bool = false,
                                     maxHeight: CGFloat = UIScreen.main.bounds.height * 0.75,
                                     @ViewBuilder contentView: () -> V) -> some View {
        modifier(SheetViewModifier(isPresented: isPresented,
                                   withoutRoundedCorner: withoutRoundedCorners,
                                   withCancelButton: false,
                                   showDragBar: showDragBar,
                                   withBlurBG: withBlurBG,
                                   maxHeight: maxHeight,
                                   sheetView: contentView()))
    }

    
}
