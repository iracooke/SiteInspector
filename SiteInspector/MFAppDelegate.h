//
//  MFAppDelegate.h
//  SiteInspector
//
//  Created by Ira Cooke on 1/04/12.
//  Copyright (c) 2012 Mudflat Software. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AGSGPS;

@interface MFAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@property (strong, nonatomic) UINavigationController *sitesNavigationController;

@property (strong, nonatomic) UITableViewController *siteListViewController;

@property (readonly, nonatomic) AGSGPS *gps;

@end
