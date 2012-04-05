//
//  MFAppDelegate.m
//  SiteInspector
//
//  Created by Ira Cooke on 1/04/12.
//  Copyright (c) 2012 Mudflat Software. All rights reserved.
//

#import "MFAppDelegate.h"

#import "MFMapViewController.h"

#import "MFSiteListViewController.h"

#import "MFTrackViewController.h"

#import "MagicalRecordHelpers.h"
// Only imported for debugging
#import "MFSite.h" 

@implementation MFAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController,sitesNavigationController,siteListViewController;

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Setup the core data stack
   [MagicalRecordHelpers setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"Database"];
 //   [MagicalRecordHelpers setupCoreDataStackWithInMemoryStore];
    
    // For debugging. Populate the database with a few sites of interest.
    //
    if ( [[MFSite numberOfEntities] intValue]==0 ){
        MFSite *island=[MFSite createEntity];
        MFSite *jetty=[MFSite createEntity];
        MFSite *mudflats=[MFSite createEntity];
        
        // Immediately get permanent ids
        NSError *err=nil;
        [[mudflats managedObjectContext] obtainPermanentIDsForObjects:[NSArray arrayWithObjects:island,jetty,mudflats, nil] error:&err];
        if ( err ){
            NSLog(@"%@",err);
        }
        
        [island setLattitude:[NSNumber numberWithFloat:-12.382303]];
        [island setLongitude:[NSNumber numberWithFloat:130.837577]];
        [island setName:@"Island"];
        [island setType:[NSNumber numberWithInteger:MFWaypointKindSite]];
        
        [jetty setLattitude:[NSNumber numberWithFloat:-12.378614]];
        [jetty setLongitude:[NSNumber numberWithFloat:130.841997]];
        [jetty setName:@"Jetty"];
        [jetty setType:[NSNumber numberWithInteger:MFWaypointKindSite]];
        
        [mudflats setLattitude:[NSNumber numberWithFloat:-12.389093]];
        [mudflats  setLongitude:[NSNumber numberWithFloat:130.839937]];
        [mudflats setName:@"Mudflats"];
        [mudflats setType:[NSNumber numberWithInteger:MFWaypointKindSite]];

    }
    
    
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    UIViewController *mapViewController,*trackViewController;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        mapViewController = [[[MFMapViewController alloc] initWithNibName:@"MFMapViewController_iPhone" bundle:nil] autorelease];
        trackViewController = [[[MFTrackViewController alloc] initWithNibName:@"MFTrackViewController" bundle:nil] autorelease];
        
        self.siteListViewController = [[[MFSiteListViewController alloc] initWithStyle:UITableViewStylePlain] autorelease];
    } else {
        mapViewController = [[[MFMapViewController alloc] initWithNibName:@"MFMapViewController_iPad" bundle:nil] autorelease];
        trackViewController = [[[MFTrackViewController alloc] initWithNibName:@"MFTrackViewController" bundle:nil] autorelease];
        self.siteListViewController = [[[MFSiteListViewController alloc] initWithStyle:UITableViewStylePlain] autorelease];
    }
    
    self.sitesNavigationController=[[[UINavigationController alloc] initWithRootViewController:self.siteListViewController] autorelease];
    self.sitesNavigationController.delegate=self;
    
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:mapViewController, self.sitesNavigationController,trackViewController, nil];

    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if (viewController == self.sitesNavigationController) {
        [self.sitesNavigationController popToRootViewControllerAnimated:NO];
    }
    
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

#pragma mark -
#pragma mark UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    [CATransaction begin];
    
    if ( [viewController isKindOfClass:[UITableViewController class]] ){
        self.tabBarController.tabBar.hidden=NO;
    } else {
        self.tabBarController.tabBar.hidden=YES;
        
        
//        CGRect smallRect=self.tabBarController.view.frame;
  //      smallRect.size.height+=30;
    //    smallRect.origin.y+=30;
        
      //  self.tabBarController.view.frame=smallRect;
    }
    
    [CATransaction commit];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [CATransaction begin];
    
    if ( [viewController isKindOfClass:[UITableViewController class]] ){

    } else {
 
//        CGRect smallRect=navigationController.view.frame;
  //      smallRect.size.height+=30;
    //    smallRect.origin.y+=30;
        
      //  navigationController.view.frame=smallRect;
    }
    
    [CATransaction commit];
    
}


@end
