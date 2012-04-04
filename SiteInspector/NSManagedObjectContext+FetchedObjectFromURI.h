//
//  NSManagedObjectContext+NSManagedObjectContext_FetchedObjectFromURI.h
//  SiteInspector
//
//  Created by Ira Cooke on 5/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (FetchedObjectFromURI)
- (NSManagedObject *)objectWithURI:(NSURL *)uri;
@end
