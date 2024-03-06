//
//  TransparentBlurView.swift
//  CustomSheetViewSDK
//
//  Created by Ayan Ansari on 06/03/24.
//

import SwiftUI

import SwiftUI

public struct TransparentBlurView: UIViewRepresentable {
    
    var removeAllFilter: Bool = false
    
    public func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        
        return view
    }
    
    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        DispatchQueue.main.async {
            if let backdropLayer = uiView.layer.sublayers?.first {
                if removeAllFilter {
                    backdropLayer.filters = []
                } else {
                    backdropLayer.filters?.removeAll(where: { filter in
                        String(describing: filter) != "gaussianBlur"
                    })
                }
            }
        }
    }
    
}
