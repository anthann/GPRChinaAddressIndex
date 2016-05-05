//
//  GPRAddressModel.h
//  Pods
//
//  Created by anthann on 16/5/5.
//
//

#import <Foundation/Foundation.h>

@interface GPRAddressModel : NSObject

@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSString *identifier;

- (instancetype)initWithName:(NSString *)name identifier:(NSString *)identifier;

@end
