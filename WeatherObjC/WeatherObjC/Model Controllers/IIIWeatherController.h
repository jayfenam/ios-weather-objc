//
//  IIIWeatherController.h
//  WeatherObjC
//
//  Created by Jonathan Ferrer on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIWeatherController : NSObject

- (void)searchForWeatherWithZipcode:(NSString *)zipcode completion:(void (^)(NSError *error))completion;

@property NSArray *forecasts;

@end

NS_ASSUME_NONNULL_END
