//
//  MFSiteDetailViewController.m
//  SiteInspector
//
//  Created by Ira Cooke on 4/04/12.
//  Copyright (c) 2012 Mudflat Software. All rights reserved.
//

#import "MFSiteDetailViewController.h"
#import "MFSite.h"
#import <MobileCoreServices/UTCoreTypes.h>

@interface MFSiteDetailViewController ()

@end

@implementation MFSiteDetailViewController
@synthesize nameLabel;
@synthesize positionLabel;
@synthesize photosView;
@synthesize siteID;

- (id)initWithSite:(MFSite*) site
{
    self = [super initWithNibName:@"MFSiteDetailViewController" bundle:nil];
    if (self) {

        NSAssert(![[site objectID] isTemporaryID],@"Got a temporary site id when initializing SiteDetailViewController");
        
        self.siteID=[[site objectID] retain];
        
        
        
    }
    return self;
}

// TODO: Use safely fetch object not "objectWithID"
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    MFSite *site = (MFSite*)[[NSManagedObjectContext MR_defaultContext] objectWithID:self.siteID];
    
    [nameLabel setText:[site name]];
    [positionLabel setText:[NSString stringWithFormat:@"Lat:%f  Long:%f",[[site lattitude] floatValue],[[site longitude] floatValue]]];

    
}

- (void)viewDidUnload
{
    [self setNameLabel:nil];
    [self setPositionLabel:nil];
    [self setPhotosView:nil];
    [self setSiteID:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [nameLabel release];
    [positionLabel release];
    [photosView release];
    [siteID release];
    [super dealloc];
}

#define Add Photo

- (IBAction)addPhoto:(id)sender {
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == NO){
        NSLog(@"Can't take picture. No camera");
        return;
    }
    
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    // Displays a control that allows the user to choose picture or
    // movie capture, if both are available:
//    cameraUI.mediaTypes =[UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    
    
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    cameraUI.allowsEditing = NO;
    
    cameraUI.delegate = self;
    
    [self presentViewController:cameraUI animated:YES completion:NULL];
    
}

#define UIImagePickerDelegate

// For responding to the user tapping Cancel.
- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    [picker release];
}

// For responding to the user accepting a newly-captured picture or movie
- (void) imagePickerController: (UIImagePickerController *) picker
 didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave;
    
    // Handle a still image capture
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0)
        == kCFCompareEqualTo) {
        
        editedImage = (UIImage *) [info objectForKey:
                                   UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:
                                     UIImagePickerControllerOriginalImage];
        
        if (editedImage) {
            imageToSave = editedImage;
        } else {
            imageToSave = originalImage;
        }
        
        // Save the new image (original or edited) to the Camera Roll
        UIImageWriteToSavedPhotosAlbum (imageToSave, nil, nil , nil);
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    [picker release];
}


@end
