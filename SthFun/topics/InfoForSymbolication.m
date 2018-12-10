//
//  InfoForSymbolication.m
//  SthFun
//
//  Created by Qi,Simeng on 2018/11/29.
//  Copyright © 2018 Qi,Simeng. All rights reserved.
//

#import "InfoForSymbolication.h"
#import <mach-o/ldsyms.h>
#import <mach-o/dyld.h>
#import <mach-o/arch.h>
#import <dlfcn.h>

@implementation InfoForSymbolication

+ (NSString *)phoneArchitecture
{
    NSString *arch;
    const NXArchInfo *info = NXGetLocalArchInfo();
    arch = [NSString stringWithUTF8String:info->description];
    NSLog(@"arch: %@", arch);
    // arch: ARM64E
    return arch;
}

+ (NSString *)executableUUID
{
    NSString *UUID;
    const uint8_t *command = (const uint8_t *)(&_mh_execute_header + 1);
    for (uint32_t idx = 0; idx < _mh_execute_header.ncmds; ++idx) {
        if (((const struct load_command *)command)->cmd == LC_UUID) {
            command += sizeof(struct load_command);
            UUID = [NSString stringWithFormat:@"%02X%02X%02X%02X-%02X%02X-%02X%02X-%02X%02X-%02X%02X%02X%02X%02X%02X",
                    command[0], command[1], command[2], command[3],
                    command[4], command[5],
                    command[6], command[7],
                    command[8], command[9],
                    command[10], command[11], command[12], command[13], command[14], command[15]];
            break;
        } else {
            command += ((const struct load_command *)command)->cmdsize;
        }
    }
    NSLog(@"UUID: %@", UUID);
    // UUID: 1A8CBA8C-AF07-3869-8632-CAEE1767E523
    return UUID;
}

NSString *binaryImageAddress(void)
{
    NSString *address;
    uint32_t count = _dyld_image_count();
    for(uint32_t i = 0; i < count; i++)
    {
        const struct mach_header *header = _dyld_get_image_header(i);
        Dl_info image_info;
        dladdr(header, &image_info);
        const char *image_name = image_info.dli_fname;
        unsigned long slength = strlen(image_name);
        unsigned long j;
        for(j = slength - 1; j >= 0; --j) {
            if(image_name[j] == '/') {
                break;
            }
        }
        char *name = strndup(image_name + j + 1, slength - j - 1);
        NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey];
        NSString *strName = [NSString stringWithUTF8String:name];
        if ([appName isEqualToString:strName]) {
            address = [NSString stringWithFormat:@"0x%lx", (long)header];
            free(name);
            break;;
        }
        free(name);
    }
    NSLog(@"address: %@", address);
    // address: 0x10f9cd000
    return address;
}

@end
