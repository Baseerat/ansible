#! /bin/sh -ve

# Please make sure that you update the path to the current OVS directory.
DIR=~/ovs/utilities

$DIR/ovs-ofctl --protocols=OpenFlow15 del-flows br0

# Add baseerat headers
$DIR/ovs-ofctl --protocols=OpenFlow15 add-flow br0 "table=0,priority=32768,ipv4__dstAddr=0xC0A8380B \
                           actions=add_header:bitmap_hdr0_, \
                                   set_field:0x11223344->bitmap_hdr0__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr0__bitmap, \
                                   add_header:bitmap_hdr1_, \
                                   set_field:0x22334455->bitmap_hdr1__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr1__bitmap, \
                                   add_header:bitmap_hdr2_, \
                                   set_field:0x33445566->bitmap_hdr2__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr2__bitmap, \
                                   add_header:bitmap_hdr3_, \
                                   set_field:0x44556677->bitmap_hdr3__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr3__bitmap, \
                                   add_header:bitmap_hdr4_, \
                                   set_field:0x55667788->bitmap_hdr4__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr4__bitmap, \
                                   add_header:bitmap_hdr5_, \
                                   set_field:0x66778899->bitmap_hdr5__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr5__bitmap, \
                                   add_header:bitmap_hdr6_, \
                                   set_field:0x77889900->bitmap_hdr6__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr6__bitmap, \
                                   add_header:bitmap_hdr7_, \
                                   set_field:0x88990011->bitmap_hdr7__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr7__bitmap, \
                                   add_header:bitmap_hdr8_, \
                                   set_field:0x99001122->bitmap_hdr8__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr8__bitmap, \
                                   add_header:bitmap_hdr9_, \
                                   set_field:0x00112233->bitmap_hdr9__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr9__bitmap, \
                                   add_header:bitmap_hdr10_, \
                                   set_field:0x11223344->bitmap_hdr10__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr10__bitmap, \
                                   add_header:bitmap_hdr11_, \
                                   set_field:0x22334455->bitmap_hdr11__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr11__bitmap, \
                                   add_header:bitmap_hdr12_, \
                                   set_field:0x33445566->bitmap_hdr12__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr12__bitmap, \
                                   add_header:bitmap_hdr13_, \
                                   set_field:0x44556677->bitmap_hdr13__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr13__bitmap, \
                                   add_header:bitmap_hdr14_, \
                                   set_field:0x55667788->bitmap_hdr14__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr14__bitmap, \
                                   add_header:default_bitmap_, \
                                   set_field:0x1F2F3F4F5F6F->default_bitmap__bitmap, \
                                   deparse, \
                                   output:3"

$DIR/ovs-ofctl --protocols=OpenFlow15 add-flow br0 "table=0,priority=32768,ipv4__dstAddr=0xC0A8380C \
                           actions=add_header:bitmap_hdr0_, \
                                   set_field:0x11223344->bitmap_hdr0__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr0__bitmap, \
                                   add_header:bitmap_hdr1_, \
                                   set_field:0x22334455->bitmap_hdr1__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr1__bitmap, \
                                   add_header:bitmap_hdr2_, \
                                   set_field:0x33445566->bitmap_hdr2__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr2__bitmap, \
                                   add_header:bitmap_hdr3_, \
                                   set_field:0x44556677->bitmap_hdr3__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr3__bitmap, \
                                   add_header:bitmap_hdr4_, \
                                   set_field:0x55667788->bitmap_hdr4__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr4__bitmap, \
                                   add_header:bitmap_hdr5_, \
                                   set_field:0x66778899->bitmap_hdr5__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr5__bitmap, \
                                   add_header:bitmap_hdr6_, \
                                   set_field:0x77889900->bitmap_hdr6__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr6__bitmap, \
                                   add_header:bitmap_hdr7_, \
                                   set_field:0x88990011->bitmap_hdr7__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr7__bitmap, \
                                   add_header:bitmap_hdr8_, \
                                   set_field:0x99001122->bitmap_hdr8__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr8__bitmap, \
                                   add_header:bitmap_hdr9_, \
                                   set_field:0x00112233->bitmap_hdr9__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr9__bitmap, \
                                   add_header:bitmap_hdr10_, \
                                   set_field:0x11223344->bitmap_hdr10__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr10__bitmap, \
                                   add_header:bitmap_hdr11_, \
                                   set_field:0x22334455->bitmap_hdr11__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr11__bitmap, \
                                   add_header:bitmap_hdr12_, \
                                   set_field:0x33445566->bitmap_hdr12__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr12__bitmap, \
                                   add_header:bitmap_hdr13_, \
                                   set_field:0x44556677->bitmap_hdr13__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr13__bitmap, \
                                   add_header:bitmap_hdr14_, \
                                   set_field:0x55667788->bitmap_hdr14__ids, \
                                   set_field:0x1F2F3F4F5F6F->bitmap_hdr14__bitmap, \
                                   add_header:default_bitmap_, \
                                   set_field:0x1F2F3F4F5F6F->default_bitmap__bitmap, \
                                   deparse, \
                                   output:4"
