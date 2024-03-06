//
//  RoundedCornerShape.swift
//  CustomSheetViewSDK
//
//  Created by Ayan Ansari on 06/03/24.
//

import SwiftUI

public struct RoundedCornerShape: Shape {
    let corners: UIRectCorner
    let radius: CGFloat
    
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

public struct Line: Shape {
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
