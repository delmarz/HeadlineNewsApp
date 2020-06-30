//
//  HeadlinesArticle.swift
//  Test App
//
//  Created by Israel Mayor on 6/30/20.
//  Copyright © 2020 Istrael Mayor. All rights reserved.
//

import Foundation
import CoreData

class HeadlinesArticle: NSManagedObject {
    
    @nonobjc class func fetchRequest() -> NSFetchRequest<HeadlinesArticle> {
        return NSFetchRequest<HeadlinesArticle>(entityName: "HeadlinesArticle")
    }

    @NSManaged var title: String?
    @NSManaged var desp: String?
    @NSManaged var author: String?
    @NSManaged var url: String?
    @NSManaged var urlToImage: String?
	  @NSManaged var publishedAt: String?
    @NSManaged var savingDate: Date?

    
    static func saveArticle(_ article: Headline) {
        let localHeadline = HeadlinesArticle(context: CoreDataManager.shared.managedObjectContext)
        
				localHeadline.title = article.title
				localHeadline.author = article.author
				localHeadline.desp = article.description
				localHeadline.publishedAt = article.publishedAt
				localHeadline.urlToImage = article.urlToImage
				localHeadline.url = article.url
				localHeadline.savingDate = Date()
    }
}
