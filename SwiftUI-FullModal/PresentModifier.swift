//
//  PresentModifier.swift
//  SwiftUI-FullModal
//
//  Created by Klemen Košir on 11/04/2020.
//  Copyright © 2020 Klemen Košir. All rights reserved.
//

import SwiftUI

fileprivate struct FullModal<PresentedView: View>: ViewModifier {
	
	@Binding var isPresented: Bool
	let presentedView: PresentedView
	
	func body(content: Content) -> some View {
		GeometryReader { geometry in
			ZStack {
				ZStack {
					content
				}
				ZStack {
					Color.white.edgesIgnoringSafeArea(.all)
					self.presentedView
				}
				.offset(x: 0, y: self.isPresented ? 0 : self.viewHeight(geometry))
			}
		}
	}
	
	private func viewHeight(_ proxy: GeometryProxy) -> CGFloat {
		proxy.size.height + proxy.safeAreaInsets.top + proxy.safeAreaInsets.bottom
	}
	
}

extension View {
	
	func present<Content: View>(_ isPresented: Binding<Bool>, view: Content) -> some View {
			self.modifier(FullModal(isPresented: isPresented, presentedView: view))
				.animation(.easeInOut)
	}
	
}
