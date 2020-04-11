//
//  ContentView.swift
//  SwiftUI-FullModal
//
//  Created by Klemen Košir on 11/04/2020.
//  Copyright © 2020 Klemen Košir. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	@State var isPresented: Bool = false
	
	var body: some View {
		NavigationView {
			Button(action: {
				self.isPresented.toggle()
			}) {
				Text("Present")
			}
			.navigationBarTitle("Some title")
		}
		.present($isPresented, view: ContentView2(isPresented: $isPresented))
	}
}

struct ContentView2: View {
	
	@Binding var isPresented: Bool
	
	var body: some View {
		ZStack {
			Color.red.edgesIgnoringSafeArea(.all)
			NavigationView {
				Button(action: {
					self.isPresented.toggle()
				}) {
					Text("Dismiss")
				}
				.navigationBarTitle("Some title 2")
			}
		}
	}
}




struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
