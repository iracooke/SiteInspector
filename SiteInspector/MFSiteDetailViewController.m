//
//  MFSiteDetailViewController.m
//  SiteInspector
//
//  Created by Ira Cooke on 4/04/12.
//  Copyright (c) 2012 Mudflat Software. All rights reserved.
//

#import "MFSiteDetailViewController.h"
#import "MFSite.h"

@interface MFSiteDetailViewController ()

@end

@implementation MFSiteDetailViewController
@synthesize nameLabel;
@synthesize positionLabel;
@synthesize photosView;

- (id)initWithSite:(MFSite*) site
{
    self = [super initWithNibName:@"MFSiteDetailViewController" bundle:nil];
    if (self) {

        NSAssert(![[site objectID] isTemporaryID],@"Got a temporary site id when initializing SiteDetailViewController");
        
        _siteID=[[site objectID] retain];
        
        [nameLabel setText:[site name]];
        [positionLabel setText:[NSString stringWithFormat:@"Lat:%f  Long:%f",[site lattitude],[site longitude]]];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setNameLabel:nil];
    [self setPositionLabel:nil];
    [self setPhotosView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)addPhoto:(id)sender {
}
- (void)dealloc {
    [nameLabel release];
    [positionLabel release];
    [photosView release];
    [_siteID release];
    [super dealloc];
}
@end
