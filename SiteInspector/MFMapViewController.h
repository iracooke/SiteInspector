//
//  MFMapViewController.h
//  SiteInspector
//
//  Created by Ira Cooke on 1/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ArcGIS/ArcGIS.h>

//contants for data layers
#define kTiledMapServiceURL @"http://server.arcgisonline.com/ArcGIS/rest/services/ESRI_StreetMap_World_2D/MapServer"


enum MFWaypointKind {
    MFWaypointKindNone=0,
    MFWaypointKindHome = 1,
    MFWaypointKinAnbinik = 2
};

@interface MFMapViewController : UIViewController<AGSMapViewLayerDelegate,AGSInfoTemplateDelegate,AGSMapViewCalloutDelegate> {
	
	//container for map layers
	AGSMapView *_mapView;
	
    AGSGraphicsLayer *_waypointsLayer;
    UIView *_waypointsView;
}

//map view is an outlet so we can associate it with UIView
//in IB
@property (nonatomic, retain) IBOutlet AGSMapView *mapView;
@property (nonatomic, retain) AGSGraphicsLayer *waypointsLayer;
@property (nonatomic, retain) UIView *waypointsView;

@end