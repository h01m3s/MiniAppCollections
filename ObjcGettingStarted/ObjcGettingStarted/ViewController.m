//
//  ViewController.m
//  ObjcGettingStarted
//
//  Created by Weijie Lin on 4/9/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

#import "ViewController.h"
#import "Course.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray<Course *> *courses;

@end

@implementation ViewController

NSString *cellId = @"cellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCourses];
    [self fetchCoursesUsingJson];
    
    self.navigationItem.title = @"Courses";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:cellId];
}

- (void)fetchCoursesUsingJson {
    NSLog(@"Fetching Courses");
//    http://api.letsbuildthatapp.com/jsondecodable/courses
    
    NSString *urlString = @"https://api.letsbuildthatapp.com/jsondecodable/courses";
    NSURL *url = [NSURL URLWithString:urlString];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"finished fetching courses...");
        NSString *dummyString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Dummy String: %@", dummyString);
        
        NSError *err;
        NSArray *courseJson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        if (err) {
            NSLog(@"Failed to serialize into JSON: %@", err);
            return;
        }
        
        NSMutableArray<Course *> *courses = NSMutableArray.new;
        for (NSDictionary *courseDict in courseJson) {
            NSString *name = courseDict[@"name"];
            NSNumber *numberOflessons = courseDict[@"number_of_lessons"];
            Course *course = Course.new;
            course.name = name;
            course.numberOfLessons = numberOflessons;
            [courses addObject:course];
        }
        
//        NSLog(@"%@", courses);
        self.courses = courses;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }] resume];
}

- (void)setupCourses {
    self.courses = NSMutableArray.new;
    
    Course *course = Course.new;
    course.name = @"Instagram Firebase";
    course.numberOfLessons = @(49);
    //    Course *course = [[Course alloc] init];
    [self.courses addObject:course];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.courses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    
    Course *course = self.courses[indexPath.row];
    cell.textLabel.text = course.name;
    cell.detailTextLabel.text = course.numberOfLessons.stringValue;
    return cell;
}

@end
