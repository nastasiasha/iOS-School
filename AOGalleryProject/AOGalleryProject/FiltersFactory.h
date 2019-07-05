//
//  FiltersFactory.h
//  AOGalleryProject
//
//  Created by Анастасия Шахлан on 26/06/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GRPFilterModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface FiltersFactory : NSObject

/**
 Методы создания разных фильтров

 @return объект класса GRPFilterModel
 */
- (GRPFilterModel *)createSepiaFilter;
- (GRPFilterModel *)createBoxBlurFilter;
- (GRPFilterModel *)createDiscBlurFilter;
- (GRPFilterModel *)createGaussianBlurFilter;
- (GRPFilterModel *)createMedianBlurFilter;
- (GRPFilterModel *)createMotionBlurFilter;
- (GRPFilterModel *)createZoomBlurFilter;

@end

NS_ASSUME_NONNULL_END
