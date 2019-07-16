//
//  IIIWeatherCollectionViewCell.h
//  WeatherObjC
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IIIWeather;

NS_ASSUME_NONNULL_BEGIN

@interface IIIWeatherCollectionViewCell : UICollectionViewCell

- (void)updateViews;

@property (strong, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (strong, nonatomic) IBOutlet UILabel *temperatureLabel;

@property IIIWeather *weather;

@end

NS_ASSUME_NONNULL_END
