//
//  ShowWebView.swift
//  Test App
//
//  Created by Israel Mayor on 6/30/20.
//  Copyright © 2020 Istrael Mayor. All rights reserved.
//

import SwiftUI
import WebKit

struct ShowWebView: UIViewRepresentable {
	var url: String

	func makeUIView(context: Context) -> WKWebView {
		guard let url = URL(string: self.url) else { return WKWebView() }
		let view = WKWebView()
		view.load(URLRequest(url: url))
		return view
	}
	
	func updateUIView(_ uiView: WKWebView, context: Context) {
	}
}
