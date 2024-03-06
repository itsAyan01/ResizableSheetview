//
//  CustomSheetView.swift
//  CustomSheetViewSDK
//
//  Created by Ayan Ansari on 06/03/24.
//

import SwiftUI

public func dismissCustomSheet() {
    NotificationCenter.default.post(name: .init(rawValue: NotificationKeys.dismissSheetKey), object: nil)
}

@available(iOS 15.0, *)
public struct ResizableSheetView<Content: View>: View {
    @Binding var isPresented: Bool
    var sheetTitle: String?
    var cancelButtonImage: Image = .xMarkSystemIcon
    var withoutRoundedCorner: Bool
    var showCancelButton: Bool = true
    var showDragBar: Bool = false
    var withBlurBG: Bool = false
    var maxHeight: CGFloat
    @ViewBuilder var content: Content
    
    @State var showBottomSheet: Bool = false
    @State private var dragOffset = CGSize.zero
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            backgroundView
            
            if showBottomSheet {
                bottomSheetView
                    .transition(.asymmetric(insertion: .move(edge: .bottom),
                                            removal: .move(edge: .bottom)))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onChange(of: isPresented, perform: onDismiss(_:))
        .onReceive(NotificationCenter.default.publisher(for: .init(rawValue: NotificationKeys.dismissSheetKey))) { _ in
            dismissSheet()
        }
        .navigationBarTitle("") // this must be empty
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

@available(iOS 15.0, *)
extension ResizableSheetView {
    
    @ViewBuilder
    private var backgroundView: some View {
        if withBlurBG {
            TransparentBlurView()
                .ignoresSafeArea()
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        showBottomSheet = true
                    }
                }
                .onTapGesture {
                    dismissSheet()
                }
        } else {
            Color.black.opacity(isPresented ? 0.5 : 0.0)
                .transition(.opacity)
                .ignoresSafeArea()
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        showBottomSheet = true
                    }
                }
                .onTapGesture {
                    dismissSheet()
                }
        }
    }
    
    @ViewBuilder
    private var bottomSheetView: some View {
        VStack {
            Spacer()
            
            VStack(spacing: .zero) {
                dismissButtonView
                
                // Content to show on sheet
                content
            }
            .frame(maxWidth: .infinity)
            .background {
                if withoutRoundedCorner {
                    Rectangle()
                        .fill(Color.white)
                        .ignoresSafeArea()
                } else {
                    RoundedCornerShape(corners: [.topLeft, .topRight], radius: 10)
                        .fill(.white)
                        .ignoresSafeArea()
                }
            }
        }
        .frame(maxHeight: maxHeight)
        .offset(y: dragOffset.height)
        .gesture(
            DragGesture(minimumDistance: 30)
                .onChanged(onChanges(newValue:))
                .onEnded(onEnd(newValue:))
        )
    }
    
    @ViewBuilder
    private var dismissButtonView: some View {
        if showCancelButton {
            HStack {
                Button {
                    dismissSheet()
                } label: {
                    cancelButtonImage
                        .padding(20)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                
                Spacer()
            }
        } else if showCancelButton == false && showDragBar {
            HStack {
                Spacer()
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.gray.opacity(0.6))
                    .frame(width: 100, height: 6)
                    .padding(10)
                
                Spacer()
            }
        }
    }
    
    private func onChanges(newValue: DragGesture.Value) {
        if (newValue.location.y - newValue.startLocation.y) > 0 {
            dragOffset = newValue.translation
        }
    }
    private func onEnd(newValue: DragGesture.Value) {
        if newValue.translation.height > 100 {
            dismissSheet()
        } else {
            withAnimation {
                self.dragOffset = .zero
            }
        }
    }
    
    private func onDismiss(_ newValue: Bool) {
        if newValue == false {
            dismissSheet()
        }
    }
    
    private func dismissSheet() {
        withAnimation(.easeOut(duration: 0.2)) {
            showBottomSheet = false
            isPresented = false
        }
    }
}

