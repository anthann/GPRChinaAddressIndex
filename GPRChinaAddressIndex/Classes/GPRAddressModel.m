//
//  GPRAddressModel.m
//  Pods
//
//  Created by anthann on 16/5/5.
//
//

#import "GPRAddressModel.h"

@interface GPRAddressModel()

@property (strong, nonatomic, readwrite) NSString *name;
@property (strong, nonatomic, readwrite) NSString *identifier;

@end

@implementation GPRAddressModel

- (instancetype)initWithName:(NSString *)name identifier:(NSString *)identifier{
    self = [super init];
    if (self) {
        _name = [name copy];
        _identifier = [identifier copy];
    }
    return self;
}

@end
