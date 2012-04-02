// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MFSite.h instead.

#import <CoreData/CoreData.h>


extern const struct MFSiteAttributes {
	 NSString *lattitude;
	 NSString *longitude;
	 NSString *name;
	 NSString *type;
} MFSiteAttributes;

extern const struct MFSiteRelationships {
} MFSiteRelationships;

extern const struct MFSiteFetchedProperties {
} MFSiteFetchedProperties;







@interface MFSiteID : NSManagedObjectID {}
@end

@interface _MFSite : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MFSiteID*)objectID;




@property (nonatomic, retain) NSNumber *lattitude;


@property float lattitudeValue;
- (float)lattitudeValue;
- (void)setLattitudeValue:(float)value_;

//- (BOOL)validateLattitude:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *longitude;


@property float longitudeValue;
- (float)longitudeValue;
- (void)setLongitudeValue:(float)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSString *name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *type;


@property int32_t typeValue;
- (int32_t)typeValue;
- (void)setTypeValue:(int32_t)value_;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;






@end

@interface _MFSite (CoreDataGeneratedAccessors)

@end

@interface _MFSite (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber *)primitiveLattitude;
- (void)setPrimitiveLattitude:(NSNumber *)value;

- (float)primitiveLattitudeValue;
- (void)setPrimitiveLattitudeValue:(float)value_;




- (NSNumber *)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber *)value;

- (float)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(float)value_;




- (NSString *)primitiveName;
- (void)setPrimitiveName:(NSString *)value;




- (NSNumber *)primitiveType;
- (void)setPrimitiveType:(NSNumber *)value;

- (int32_t)primitiveTypeValue;
- (void)setPrimitiveTypeValue:(int32_t)value_;




@end
