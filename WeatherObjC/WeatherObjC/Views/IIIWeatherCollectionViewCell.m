//
//  IIIWeatherCollectionViewCell.m
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "IIIWeatherCollectionViewCell.h"
#import "IIIWeather.h"

@implementation IIIWeatherCollectionViewCell

- (void)updateViews
{
    if (self.weather) {

        self.temperatureLabel.text = [NSString stringWithFormat:@"%@ degrees",  self.weather.temp];
        self.weatherImageView.image = self.weather.icon;
    }
    
}

@end
