//
//  MFTrackViewController.m
//  SiteInspector
//
//  Created by Ira Cooke on 5/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MFTrackViewController.h"
#import <ArcGIS/ArcGIS.h>

@implementation MFTrackViewController

@synthesize latLongText = _latLongText;
@synthesize accuracyText = _accuracyText;

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

/*    if ( self.gps ){
        AGSPoint *currentPoint = self.gps.currentPoint;
        self.latLongText.text=[NSString stringWithFormat:@"Lat:%f  Long:%f",currentPoint.y,currentPoint.x];
        
        self.accuracyText = [NSString stringWithFormat:@"Accurate to %f",(currentPoint.envelope.width+currentPoint.envelope.height)*0.5];
        
        
    }*/
    
    
}

- (void)viewDidUnload
{
    [self setLatLongText:nil];
    [self setAccuracyText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [_latLongText release];
    [_accuracyText release];
    [super dealloc];
}
@end
