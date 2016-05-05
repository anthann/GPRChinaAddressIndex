//
//  GPRChinaAddressIndex.m
//  Pods
//
//  Created by anthann on 16/5/5.
//
//

#import <FMDB/FMDB.h>

#import "GPRChinaAddressIndex.h"

@interface GPRChinaAddressIndex()

@property (strong, nonatomic) FMDatabaseQueue *queue;

@end

@implementation GPRChinaAddressIndex

+ (instancetype)sharedInstance {
    static GPRChinaAddressIndex *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[GPRChinaAddressIndex alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"china_address" ofType:@"db"];
        _queue = [[FMDatabaseQueue alloc] initWithPath:path];
    }
    return self;
}

- (GPRAddressModel *)getAddressByID:(NSString *)identifier {
    __block GPRAddressModel *model;
    [self.queue inDatabase:^(FMDatabase *db) {
        NSString *sql = @"SELECT name, id FROM china_address WHERE id = ?";
        FMResultSet *result = [db executeQuery:sql, identifier];
        while ([result next]) {
            NSString *name = [result stringForColumn:@"name"];
            NSString *identifier = [result stringForColumn:@"id"];
            model = [[GPRAddressModel alloc] initWithName:name identifier:identifier];
            break;
        }
        [result close];
    }];
    return model;
}

- (NSArray <GPRAddressModel *>*)getProvince {
    __block NSMutableArray <GPRAddressModel *>*arr = [NSMutableArray array];
    [self.queue inDatabase:^(FMDatabase *db) {
        NSString *sql = @"SELECT name, id FROM china_address WHERE father_id = ?";
        FMResultSet *result = [db executeQuery:sql, @"0"];
        while ([result next]) {
            NSString *name = [result stringForColumn:@"name"];
            NSString *identifier = [result stringForColumn:@"id"];
            GPRAddressModel *province = [[GPRAddressModel alloc] initWithName:name identifier:identifier];
            [arr addObject:province];
        }
        [result close];
    }];
    return arr;
}

- (NSArray <GPRAddressModel *>*)getCityByProvinceID:(NSString *)provinceID {
    __block NSMutableArray <GPRAddressModel *>*arr = [NSMutableArray array];
    [self.queue inDatabase:^(FMDatabase *db) {
        NSString *sql = @"SELECT name, id FROM china_address WHERE father_id = ?";
        FMResultSet *result = [db executeQuery:sql, provinceID];
        while ([result next]) {
            NSString *name = [result stringForColumn:@"name"];
            NSString *identifier = [result stringForColumn:@"id"];
            GPRAddressModel *city = [[GPRAddressModel alloc] initWithName:name identifier:identifier];
            [arr addObject:city];
        }
        [result close];
    }];
    return arr;
}

- (NSArray <GPRAddressModel *>*)getTownByCityID:(NSString *)cityID {
    __block NSMutableArray <GPRAddressModel *>*arr = [NSMutableArray array];
    [self.queue inDatabase:^(FMDatabase *db) {
        NSString *sql = @"SELECT name, id FROM china_address WHERE father_id = ?";
        FMResultSet *result = [db executeQuery:sql, cityID];
        while ([result next]) {
            NSString *name = [result stringForColumn:@"name"];
            NSString *identifier = [result stringForColumn:@"id"];
            GPRAddressModel *town = [[GPRAddressModel alloc] initWithName:name identifier:identifier];
            [arr addObject:town];
        }
        [result close];
    }];
    return arr;
}

@end
