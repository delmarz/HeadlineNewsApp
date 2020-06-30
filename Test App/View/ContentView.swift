//
//  ContentView.swift
//  Test App
//
//  Created by Israel Mayor on 6/30/20.
//  Copyright © 2020 Istrael Mayor. All rights reserved.
//

import SwiftUI
import Combine
import SwiftUIRefresh
import KingfisherSwiftUI

struct ContentView: View {

	@ObservedObject	private var headlinesVM = HeadlinesViewModel()
	@State private var isShowing = false
	
    var body: some View {

			NavigationView {
					List (
						self.headlinesVM.headlines, id: \.url
					) { i in
									NavigationLink(destination:
												ShowWebView(url: i.url)
											.navigationBarTitle("Content", displayMode: .inline)){
												
												HStack(spacing: 15) {

																			 KFImage(URL(string: i.urlImage))
																			.resizable()
																			.aspectRatio(contentMode: .fill)
																			.frame(width: 110, height: 135)
																			.cornerRadius(13)
													
																			VStack(alignment: .leading, spacing: 10) {
																				Text(i.title).fontWeight(.heavy)
																				Text(i.description).lineLimit(2)
																				Text(i.publishedAt).font(.system(size: 12)).fontWeight(.thin)
																			}
																		}.padding(.vertical, 15)
																			.contextMenu {
																				Button(action: {
																				HeadlinesArticle.saveArticle(i.headline)
																						CoreDataManager.shared.saveContext()
																							print("save \(i.title)")
																							},
																							 label: {
																								Text("Add to favorite")
																								Image(systemName: "heart.fill")
																							})
																					}
						}
					}
					.pullToRefresh(isShowing: self.$isShowing, onRefresh: {
						self.headlinesVM.retrieveData()
						self.isShowing = false
					})
							.navigationBarTitle(Text("News"))
							.navigationBarItems(trailing: Button("Clear") {
							self.headlinesVM.removeData()
							print("remove")
				})
			}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


