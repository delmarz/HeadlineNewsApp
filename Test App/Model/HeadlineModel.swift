//
//  HeadlineModel.swift
//  Test App
//
//  Created by Israel Mayor on 6/30/20.
//  Copyright © 2020 Istrael Mayor. All rights reserved.
//

import Foundation

struct Data: Decodable {
	let articles: [Headline]?
}

struct Headline: Decodable {
	let source: Source?
	let author, title, description, url,
	urlToImage, publishedAt, content: String?
}

struct Source: Decodable {
	let id, name: String?
}
