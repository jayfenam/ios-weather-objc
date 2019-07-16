//
//  IIIWeatherController.m
//  WeatherObjC
//
//  Created by Jonathan Ferrer on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherController.h"
#import "IIIWeather.h"

@implementation IIIWeatherController

- (void)searchForWeatherWithZipcode:(NSString *)zipcode completion:(void (^)(NSError *error))completion
{

    NSURL *baseURL = [NSURL URLWithString: baseURLString];

    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];

    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"zip" value:zipcode];
    NSURLQueryItem *unitsItem = [NSURLQueryItem queryItemWithName:@"units" value:@"imperial"];
    NSURLQueryItem *apiKeyItem = [NSURLQueryItem queryItemWithName:@"appid" value:apiKey];

    [components setQueryItems:@[searchItem, unitsItem, apiKeyItem]];

    NSURL *requestURL = components.URL;

    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:requestURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        if (error) {
            NSLog(@"error fetching data: %@", error);
            completion(error);
            return;
        }

        if (data == nil) {
            NSLog(@"No data returned form data task");
            completion([[NSError alloc] init]);
            return;
        }

        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

        // Check to make sure that the dictionary is actually s dictionary
        if (![jsonDictionary isKindOfClass:[NSDictionary class]]) {

            // if it's not actually a dictionary.
            NSLog(@"JSON was not a dictionary");
            completion([[NSError alloc] init]);
            return;
        }

        NSArray *list = jsonDictionary[@"list"];
        NSString *cityName = jsonDictionary[@"city"][@"name"];

        NSMutableArray *forecasts = [[NSMutableArray alloc] init];

        for (NSDictionary *result in list) {
            IIIWeather *weather = [[IIIWeather alloc] initWithDictionary:result name:cityName];

            [forecasts addObject:weather];

            self.forecasts = forecasts;
        }

        completion(nil);
    }];

    [dataTask resume];
}


-(instancetype)init
{
    self = [super init];

    if (self != nil) {

        _forecasts = [[NSArray alloc] init];
    }
    return self;
}

static NSString * const baseURLString = @"https://api.openweathermap.org/data/2.5/forecast";
static NSString * const apiKey = @"56bcc187faa19c38e9681fead12d06f8";

@end
