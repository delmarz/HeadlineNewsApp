//
//  LocalArticle.swift
//  Test App
//
//  Created by Israel Mayor on 6/30/20.
//  Copyright © 2020 Istrael Mayor. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct LocalHeadlineRow: View {
    let headline: HeadlinesArticle
    
    var body: some View {

										NavigationLink(destination:
											ShowWebView(url: headline.url!)
													.navigationBarTitle("Content", displayMode: .inline)){

																			ZStack(alignment: .bottom) {
																					KFImage(URL(string: headline.urlToImage ?? ""))
																							.renderingMode(.original)
																							.resizable()
																							.scaledToFill()
																							.frame(width: UIScreen.main.bounds.width - 32,
																										 height: 250,
																										 alignment: .center)
																					
																							Rectangle()
																							.foregroundColor(.black)
																							.opacity(0.3)
																					
																					headlineInfo
																			}
																			.cornerRadius(8)
																			.padding([.leading, .trailing], 16)
																			.padding([.top, .bottom], 8)
																			.contextMenu {
																						Button(
																							action: {
															                    CoreDataManager.shared.managedObjectContext.delete(self.headline)
															                    CoreDataManager.shared.saveContext()
																							},
																							label: {
																								Text("Remove from favorites")
																								Image(systemName: "heart.slash.fill")
																							}
																					)}
						}
    }
    
	private var headlineInfo: some View {
			VStack(spacing: 10) {
            Text(verbatim: headline.title ?? "")
							.foregroundColor(.white)
                .font(.subheadline)
                .lineLimit(nil)
                .padding([.leading, .trailing])
                .frame(width: UIScreen.main.bounds.width - 55,
                       alignment: .bottomLeading)
            

				Text(verbatim: headline.author ?? "")
												 .foregroundColor(.white)
													.font(.headline).fontWeight(.thin)
												 .lineLimit(nil)
												 .padding([.leading, .bottom, .trailing])
												 .frame(width: UIScreen.main.bounds.width - 55,
																alignment: .bottomLeading)
			
        }
    }
}
