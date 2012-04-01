//
//  MFMapViewController.m
//  SiteInspector
//
//  Created by Ira Cooke on 1/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MFMapViewController.h"

@interface MFMapViewController (Private)
    - (void) addWaypointWithName:(NSString*)wpName kind:(NSInteger) wpKind lat:(float) wpLat long:(float) wpLong;
@end

@implementation MFMapViewController

@synthesize mapView = _mapView,waypointsLayer=_waypointsLayer,waypointsView=_waypointsView;

#pragma mark -
#pragma mark Init/Dealloc

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Map", @"Map");
        self.tabBarItem.image = [UIImage imageNamed:@"map_tab_icon"];
    }
    return self;
}


- (void)dealloc {
	self.mapView = nil;
	
    [super dealloc];
}


#pragma mark -
#pragma mark UIViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	// set the delegate for the map view
	self.mapView.layerDelegate = self;
	
	//create an instance of a tiled map service layer
	AGSTiledMapServiceLayer *tiledLayer = [[AGSTiledMapServiceLayer alloc] initWithURL:[NSURL URLWithString:kTiledMapServiceURL]];
	
	//Add it to the map view
	UIView<AGSLayerView>* lyr = [self.mapView addMapLayer:tiledLayer withName:@"Tiled Layer"];
    
	//release to avoid memory leaks
	[tiledLayer release];
	
	// Setting these two properties lets the map draw while still performing a zoom/pan
	lyr.drawDuringPanning = YES;
	lyr.drawDuringZooming = YES;
    
    // Add a graphics layer to display the waypoints
    self.waypointsLayer = [AGSGraphicsLayer graphicsLayer];
    self.waypointsView	 = [self.mapView addMapLayer:self.waypointsLayer withName:@"Waypoints Layer"];
    
    [self addWaypointWithName:@"Home" kind:MFWaypointKindHome lat:-37.638362 long:145.186137];
    
	AGSSpatialReference *sr = [AGSSpatialReference spatialReferenceWithWKID:4326];
	double xmin, ymin, xmax, ymax;
    xmin=145.10;		
    xmax=145.25;
    ymin=-37.60;
    ymax=-37.69;
	
	// zoom to the start location
	AGSEnvelope *env = [AGSEnvelope envelopeWithXmin:xmin ymin:ymin xmax:xmax ymax:ymax spatialReference:sr];
	[self.mapView zoomToEnvelope:env animated:YES];
	
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


#pragma mark -
#pragma mark Waypoint Image Lookup

- (NSString*) imageNameForWaypointKind:(NSInteger)kind {
    NSString *imageName=nil;
    switch (kind) {
        case MFWaypointKindNone:
            imageName=@"waypoint_generic.png";
            break;
        case MFWaypointKindHome:
            imageName = @"waypoint_home.png";
            break;
        default:
            break;
    } 
    return imageName;
}

#pragma mark -
#pragma mark AGSMapViewLayerDelegate

-(void) mapViewDidLoad:(AGSMapView*)mapView {
    
	// comment to disable the GPS on start up
	[self.mapView.gps start];
}


#pragma mark -
#pragma mark Add/Remove Waypoints

- (void) addWaypointWithName:(NSString*)wpName kind:(NSInteger)wpKind lat:(float) wpLat long:(float) wpLong {

    
    AGSMarkerSymbol *wpSymbol=nil;
    NSMutableDictionary *wpAttributes=[NSMutableDictionary dictionaryWithObjectsAndKeys:wpName,@"Title",[NSNumber numberWithInt:wpKind],@"Kind", nil];

    switch (wpKind) {
        case MFWaypointKindNone:
            wpSymbol = [AGSSimpleMarkerSymbol simpleMarkerSymbol];
            break;
        case MFWaypointKindHome:
            wpSymbol = [AGSPictureMarkerSymbol pictureMarkerSymbolWithImageNamed:@"home.png"];
            break;
        default:
            break;
    }
    

    //Create an AGSPoint (which inherits from AGSGeometry) that defines where the Graphic will be drawn
    AGSPoint* wpPoint =
    [AGSPoint pointWithX:wpLong
                       y:wpLat
        spatialReference:self.mapView.spatialReference];

    AGSGraphic* wpGraphic =
    [AGSGraphic graphicWithGeometry:wpPoint
                             symbol:wpSymbol
                         attributes:wpAttributes
               infoTemplateDelegate:self];

    //Add the graphic to the Graphics layer
    [self.waypointsLayer addGraphic:wpGraphic];

    //Tell the layer to redraw itself
    [self.waypointsLayer dataChanged];
}


#pragma mark -
#pragma mark InfoTemplateDelegate

- (NSString *)titleForGraphic:(AGSGraphic *)graphic screenPoint:(CGPoint)screen mapPoint:(AGSPoint *)map {
    return [graphic.attributes objectForKey:@"Title"];
}

- (NSString *)detailForGraphic:(AGSGraphic *)graphic screenPoint:(CGPoint)screen mapPoint:(AGSPoint *)map {
    return [NSString stringWithFormat:@"Lat:%f  Long:%f",map.y,map.x];
}

- (UIImage *)imageForGraphic:(AGSGraphic *) graphic screenPoint:(CGPoint) screen mapPoint:(AGSPoint *) mapPoint {  
    return [UIImage imageNamed:[self imageNameForWaypointKind:[[[graphic attributes] objectForKey:@"Kind"] intValue]]];	
}

#pragma mark -
#pragma mark CalloutDelegate


- (void) mapView: (AGSMapView *) mapView didClickCalloutAccessoryButtonForGraphic: (AGSGraphic *) graphic {
    // Edit waypoint. Look it up in the database and display in an editable view.
}


@end
