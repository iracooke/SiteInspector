//
//  MFTrackViewController.h
//  SiteInspector
//
//  Created by Ira Cooke on 5/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AGSGPS;

@interface MFTrackViewController : UIViewController 

@property (retain, nonatomic) IBOutlet UILabel *latLongText;
@property (retain, nonatomic) IBOutlet UILabel *accuracyText;

@end
