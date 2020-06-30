//
//  NetworkManager.swift
//  Test App
//
//  Created by Israel Mayor on 6/30/20.
//  Copyright © 2020 Istrael Mayor. All rights reserved.
//

import Foundation

class NetwokrManager {
	
	func getHeadlines(completion: @escaping ([Headline]?) -> ()) {
			guard let url = URL(string: "http://newsapi.org/v2/top-headlines?country=us&apiKey=c8764da40b594b6289eb3bb4d52f5a3b") else { return }
		
		URLSession.shared.dataTask(with: url) { (data, _, err) in
			guard let data = data, err == nil else {
				DispatchQueue.main.async {
					print("Error: \(String(describing: err?.localizedDescription))")
					 completion(nil)
				}
					return
			}
			let headlines = try? JSONDecoder().decode(Data.self, from: data)
					DispatchQueue.main.async {
						completion(headlines?.articles ?? [])
					}
		}.resume()
	}
}

