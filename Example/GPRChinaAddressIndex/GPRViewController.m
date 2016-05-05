//
//  GPRViewController.m
//  GPRChinaAddressIndex
//
//  Created by anthann on 05/05/2016.
//  Copyright (c) 2016 anthann. All rights reserved.
//

#import "GPRViewController.h"
#import "GPRChinaAddressIndex.h"

@interface GPRViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (copy, nonatomic) NSArray <GPRAddressModel *>*province;
@property (copy, nonatomic) NSArray <GPRAddressModel *>*city;
@property (copy, nonatomic) NSArray <GPRAddressModel *>*town;

@end

@implementation GPRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setupViews];
}

- (void)setupViews {
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
}

#pragma mark - GPRChinaAddressIndex

- (void)loadData {
    self.province = [[GPRChinaAddressIndex sharedInstance] getProvince];
    self.city = [[GPRChinaAddressIndex sharedInstance] getCityByProvinceID:self.province.firstObject.identifier];
    self.town = [[GPRChinaAddressIndex sharedInstance] getTownByCityID:self.city.firstObject.identifier];
}

#pragma mark - UIPickerViewDelegate, UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.province.count;
    } else if (component == 1) {
        return self.city.count;
    } else{
        return self.town.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return self.province[row].name;
    } else if (component == 1) {
        return self.city[row].name;
    } else {
        return self.town[row].name;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    return screenWidth / 3;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        self.city = [[GPRChinaAddressIndex sharedInstance] getCityByProvinceID:self.province[row].identifier];
        if (self.city.count) {
            self.town = [[GPRChinaAddressIndex sharedInstance] getCityByProvinceID:self.city.firstObject.identifier];
        }
        [pickerView reloadComponent:1];
        [pickerView reloadComponent:2];
    }
    
    if (component == 1) {
        self.town = [[GPRChinaAddressIndex sharedInstance] getCityByProvinceID:self.city[row].identifier];
        [pickerView selectRow:0 inComponent:2 animated:NO];
        [pickerView reloadComponent:2];
    }
}

@end
