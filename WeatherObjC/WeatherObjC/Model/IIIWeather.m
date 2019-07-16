//
//  IIIWeather.m
//  WeatherObjC
//
//  Created by Jonathan Ferrer on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeather.h"

@implementation IIIWeather

-(instancetype)initWithDictionary:(NSDictionary *)dictionary name:(NSString *)name
{

    NSString *iconName = [dictionary[@"weather"] objectAtIndex:0][@"icon"];
    UIImage *icon = [UIImage imageNamed:iconName];
    NSNumber *temp = dictionary[@"main"][@"temp"];

    return [self initWithName:name icon:icon temp:temp];
}

-(instancetype)initWithName:(NSString *)name icon:(UIImage *)icon temp:(NSNumber *)temp
{

    self = [super init];

    if (self ) {
        _name = name;
        _icon = icon;
        _temp = temp;
    }
    return self;
}
@end
