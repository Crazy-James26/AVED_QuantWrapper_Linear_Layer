set_property KEEP_HIERARCHY true [
  get_cells -hierarchical -regexp -filter {
    ORIG_REF_NAME =~ "SLOT_X[0-9]+Y[0-9]+_TO_SLOT_X[0-9]+Y[0-9]+.*"
  }
]
create_pblock SLOT_X1Y2_TO_SLOT_X1Y2
set_property EXCLUDE_PLACEMENT 0 [get_pblocks SLOT_X1Y2_TO_SLOT_X1Y2]
set_property CONTAIN_ROUTING 0 [get_pblocks SLOT_X1Y2_TO_SLOT_X1Y2]
set_property IS_SOFT 1 [get_pblocks SLOT_X1Y2_TO_SLOT_X1Y2]
create_pblock SLOT_X0Y1_TO_SLOT_X0Y1
set_property EXCLUDE_PLACEMENT 0 [get_pblocks SLOT_X0Y1_TO_SLOT_X0Y1]
set_property CONTAIN_ROUTING 0 [get_pblocks SLOT_X0Y1_TO_SLOT_X0Y1]
set_property IS_SOFT 1 [get_pblocks SLOT_X0Y1_TO_SLOT_X0Y1]
create_pblock SLOT_X1Y0_TO_SLOT_X1Y0
set_property EXCLUDE_PLACEMENT 0 [get_pblocks SLOT_X1Y0_TO_SLOT_X1Y0]
set_property CONTAIN_ROUTING 0 [get_pblocks SLOT_X1Y0_TO_SLOT_X1Y0]
set_property IS_SOFT 1 [get_pblocks SLOT_X1Y0_TO_SLOT_X1Y0]
create_pblock SLOT_X0Y0_TO_SLOT_X0Y0
set_property EXCLUDE_PLACEMENT 0 [get_pblocks SLOT_X0Y0_TO_SLOT_X0Y0]
set_property CONTAIN_ROUTING 0 [get_pblocks SLOT_X0Y0_TO_SLOT_X0Y0]
set_property IS_SOFT 1 [get_pblocks SLOT_X0Y0_TO_SLOT_X0Y0]
create_pblock SLOT_X1Y1_TO_SLOT_X1Y1
set_property EXCLUDE_PLACEMENT 0 [get_pblocks SLOT_X1Y1_TO_SLOT_X1Y1]
set_property CONTAIN_ROUTING 0 [get_pblocks SLOT_X1Y1_TO_SLOT_X1Y1]
set_property IS_SOFT 1 [get_pblocks SLOT_X1Y1_TO_SLOT_X1Y1]
create_pblock SLOT_X0Y2_TO_SLOT_X0Y2
set_property EXCLUDE_PLACEMENT 0 [get_pblocks SLOT_X0Y2_TO_SLOT_X0Y2]
set_property CONTAIN_ROUTING 0 [get_pblocks SLOT_X0Y2_TO_SLOT_X0Y2]
set_property IS_SOFT 1 [get_pblocks SLOT_X0Y2_TO_SLOT_X0Y2]
resize_pblock SLOT_X1Y2_TO_SLOT_X1Y2 -add {  CLOCKREGION_X5Y1:CLOCKREGION_X9Y4  }
set buffer_cells [get_cells -quiet -hierarchical -filter { PRIMITIVE_TYPE =~ CLOCK.*.* && NAME =~  "*SLOT_X1Y2_TO_SLOT_X1Y2*" } ]
remove_cells_from_pblock -quiet SLOT_X1Y2_TO_SLOT_X1Y2 $buffer_cells
resize_pblock SLOT_X0Y1_TO_SLOT_X0Y1 -add {  CLOCKREGION_X0Y5:CLOCKREGION_X4Y7  }
set target_cells [  get_cells -hierarchical SLOT_X0Y1_TO_SLOT_X0Y1_0 -filter { KEEP_HIERARCHY == 1 }]
add_cells_to_pblock SLOT_X0Y1_TO_SLOT_X0Y1 $target_cells
unset target_cells
set buffer_cells [get_cells -quiet -hierarchical -filter { PRIMITIVE_TYPE =~ CLOCK.*.* && NAME =~  "*SLOT_X0Y1_TO_SLOT_X0Y1*" } ]
remove_cells_from_pblock -quiet SLOT_X0Y1_TO_SLOT_X0Y1 $buffer_cells
resize_pblock SLOT_X1Y0_TO_SLOT_X1Y0 -add {  CLOCKREGION_X5Y8:CLOCKREGION_X9Y10  }
set target_cells [  get_cells -hierarchical SLOT_X1Y0_TO_SLOT_X1Y0_0 -filter { KEEP_HIERARCHY == 1 }]
add_cells_to_pblock SLOT_X1Y0_TO_SLOT_X1Y0 $target_cells
unset target_cells
set buffer_cells [get_cells -quiet -hierarchical -filter { PRIMITIVE_TYPE =~ CLOCK.*.* && NAME =~  "*SLOT_X1Y0_TO_SLOT_X1Y0*" } ]
remove_cells_from_pblock -quiet SLOT_X1Y0_TO_SLOT_X1Y0 $buffer_cells
resize_pblock SLOT_X0Y0_TO_SLOT_X0Y0 -add {  CLOCKREGION_X0Y8:CLOCKREGION_X4Y10  }
set target_cells [  get_cells -hierarchical SLOT_X0Y0_TO_SLOT_X0Y0_0 -filter { KEEP_HIERARCHY == 1 }]
add_cells_to_pblock SLOT_X0Y0_TO_SLOT_X0Y0 $target_cells
unset target_cells
set buffer_cells [get_cells -quiet -hierarchical -filter { PRIMITIVE_TYPE =~ CLOCK.*.* && NAME =~  "*SLOT_X0Y0_TO_SLOT_X0Y0*" } ]
remove_cells_from_pblock -quiet SLOT_X0Y0_TO_SLOT_X0Y0 $buffer_cells
resize_pblock SLOT_X1Y1_TO_SLOT_X1Y1 -add {  CLOCKREGION_X5Y5:CLOCKREGION_X9Y7  }
set target_cells [  get_cells -hierarchical SLOT_X1Y1_TO_SLOT_X1Y1_0 -filter { KEEP_HIERARCHY == 1 }]
add_cells_to_pblock SLOT_X1Y1_TO_SLOT_X1Y1 $target_cells
unset target_cells
set buffer_cells [get_cells -quiet -hierarchical -filter { PRIMITIVE_TYPE =~ CLOCK.*.* && NAME =~  "*SLOT_X1Y1_TO_SLOT_X1Y1*" } ]
remove_cells_from_pblock -quiet SLOT_X1Y1_TO_SLOT_X1Y1 $buffer_cells
resize_pblock SLOT_X0Y2_TO_SLOT_X0Y2 -add {  CLOCKREGION_X0Y1:CLOCKREGION_X4Y4  }
set buffer_cells [get_cells -quiet -hierarchical -filter { PRIMITIVE_TYPE =~ CLOCK.*.* && NAME =~  "*SLOT_X0Y2_TO_SLOT_X0Y2*" } ]
remove_cells_from_pblock -quiet SLOT_X0Y2_TO_SLOT_X0Y2 $buffer_cells

set empty_pblocks [get_pblocks SLOT_X* -filter {CELL_COUNT == 0}]
if { [llength $empty_pblocks] > 0 } {
    delete_pblock $empty_pblocks
}
