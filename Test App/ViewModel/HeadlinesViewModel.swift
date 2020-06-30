//
//  HeadlinesViewModel.swift
//  Test App
//
//  Created by Israel Mayor on 6/30/20.
//  Copyright © 2020 Istrael Mayor. All rights reserved.
//

import Foundation

class HeadlinesViewModel: ObservableObject {
	@Published var headlines = [NewsViewModel]()
	
	init() {
		retrieveData()
	}
	
	func removeData() {
		headlines = []
	}
	
	func retrieveData() {
		if headlines.count == 0 {
			NetwokrManager().getHeadlines { h in
				guard let headline = h else { return }
				self.headlines = headline.map(NewsViewModel.init)
			}
		}
	}
}

struct NewsViewModel {

	var headline: Headline
	
	init(headline: Headline) {
		self.headline = headline
	}
	
	var sourceID: String {
		return headline.source?.id ?? ""
	}
	
	var sourceName: String {
		return headline.source?.name ?? ""
	}
	 
	var author: String {
		return headline.author ?? ""
	}
	
	var title: String {
		return headline.author ?? ""
	}
	
	var description: String {
		return headline.description ?? ""
	}
	
	var url: String {
		return headline.url ?? ""
	}
	
	var urlImage: String {
		return headline.urlToImage ?? ""
	}
	
	var publishedAt: String {
		return String().toDate(strDate: headline.publishedAt ?? "").timeAgo(numericDates: true)
	}
	
	var content: String {
		return headline.content ?? ""
	}
}

