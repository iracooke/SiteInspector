//
//  MFTrackViewController.m
//  SiteInspector
//
//  Created by Ira Cooke on 5/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MFTrackViewController.h"

@interface MFTrackViewController ()

@end

@implementation MFTrackViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Track", @"Track");
        self.tabBarItem.image = [UIImage imageNamed:@"sites_tab_icon"];
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
