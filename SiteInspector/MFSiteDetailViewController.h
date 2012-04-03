//
//  MFSiteDetailViewController.h
//  SiteInspector
//
//  Created by Ira Cooke on 4/04/12.
//  Copyright (c) 2012 Mudflat Software. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MFSite;

@interface MFSiteDetailViewController : UIViewController {
    NSManagedObjectID *_siteID;
}

@property (retain, nonatomic) IBOutlet UILabel *nameLabel;

@property (retain, nonatomic) IBOutlet UILabel *positionLabel;

@property (retain, nonatomic) IBOutlet UIImageView *photosView;

- (IBAction)addPhoto:(id)sender;

- (id)initWithSite:(MFSite*) site;


@end
