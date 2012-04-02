// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MFSite.m instead.

#import "_MFSite.h"

const struct MFSiteAttributes MFSiteAttributes = {
	.lattitude = @"lattitude",
	.longitude = @"longitude",
	.name = @"name",
	.type = @"type",
};

const struct MFSiteRelationships MFSiteRelationships = {
};

const struct MFSiteFetchedProperties MFSiteFetchedProperties = {
};

@implementation MFSiteID
@end

@implementation _MFSite

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Site" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Site";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Site" inManagedObjectContext:moc_];
}

- (MFSiteID*)objectID {
	return (MFSiteID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"lattitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"lattitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"longitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"longitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"typeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"type"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic lattitude;



- (float)lattitudeValue {
	NSNumber *result = [self lattitude];
	return [result floatValue];
}

- (void)setLattitudeValue:(float)value_ {
	[self setLattitude:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveLattitudeValue {
	NSNumber *result = [self primitiveLattitude];
	return [result floatValue];
}

- (void)setPrimitiveLattitudeValue:(float)value_ {
	[self setPrimitiveLattitude:[NSNumber numberWithFloat:value_]];
}





@dynamic longitude;



- (float)longitudeValue {
	NSNumber *result = [self longitude];
	return [result floatValue];
}

- (void)setLongitudeValue:(float)value_ {
	[self setLongitude:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveLongitudeValue {
	NSNumber *result = [self primitiveLongitude];
	return [result floatValue];
}

- (void)setPrimitiveLongitudeValue:(float)value_ {
	[self setPrimitiveLongitude:[NSNumber numberWithFloat:value_]];
}





@dynamic name;






@dynamic type;



- (int32_t)typeValue {
	NSNumber *result = [self type];
	return [result intValue];
}

- (void)setTypeValue:(int32_t)value_ {
	[self setType:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveTypeValue {
	NSNumber *result = [self primitiveType];
	return [result intValue];
}

- (void)setPrimitiveTypeValue:(int32_t)value_ {
	[self setPrimitiveType:[NSNumber numberWithInt:value_]];
}










@end
