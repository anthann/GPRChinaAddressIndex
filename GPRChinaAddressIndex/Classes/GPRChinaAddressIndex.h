//
//  GPRChinaAddressIndex.h
//  Pods
//
//  Created by anthann on 16/5/5.
//
//

#import <Foundation/Foundation.h>
#import "GPRAddressModel.h"

@interface GPRChinaAddressIndex : NSObject

+ (instancetype)sharedInstance;
- (GPRAddressModel *)getAddressByID:(NSString *)identifier;
- (NSArray <GPRAddressModel *>*)getProvince;
- (NSArray <GPRAddressModel *>*)getCityByProvinceID:(NSString *)provinceID;
- (NSArray <GPRAddressModel *>*)getTownByCityID:(NSString *)cityID;

@end
