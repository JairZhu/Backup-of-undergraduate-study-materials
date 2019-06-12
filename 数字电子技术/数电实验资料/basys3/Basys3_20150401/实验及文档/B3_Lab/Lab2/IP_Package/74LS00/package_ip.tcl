create_project $ip_name ./$ip_name -part xc7vx485tffg1157-1
add_files -norecurse ./src/$source_files
import_files -force -norecurse
ipx::package_project -root_dir ./$ip_name/$ip_name.srcs/sources_1/imports
set_property library XUP [ipx::current_core]
set_property taxonomy 74LSxx_LIB [ipx::current_core]
set_property description {$description} [ipx::current_core]
set_property display_name $ip_name [ipx::current_core]
set_property vendor_display_name XUP [ipx::current_core]
set_property company_url http://www.xilinx.com/university [ipx::current_core]
set_property supported_families {virtex7 Production artix7 Production kintex7 Production zynq Production} [ipx::current_core]
file mkdir ./$ip_name/$ip_name.srcs/sources_1/imports/misc
file mkdir ./$ip_name/$ip_name.srcs/sources_1/imports/doc
file copy ./misc/$logo_file ./$ip_name/$ip_name.srcs/sources_1/imports/misc/.
file copy ./doc/$readme_file ./$ip_name/$ip_name.srcs/sources_1/imports/doc/.

ipx::add_file_group -type readme xilinx_readme  [ipx::current_core]
ipx::add_file doc/$readme_file [ipx::get_file_groups xilinx_readme -of_objects [ipx::current_core]]
set_property type text [ipx::get_files doc/$readme_file -of_objects [ipx::get_file_groups xilinx_readme -of_objects [ipx::current_core]]]

ipx::add_file_group -type utility xilinx_utilityxitfiles [ipx::current_core]
ipx::add_file misc/$logo_file [ipx::get_file_groups xilinx_utilityxitfiles -of_objects [ipx::current_core]]
set_property type {image LOGO} [ipx::get_files misc/$logo_file -of_objects [ipx::get_file_groups xilinx_utilityxitfiles -of_objects [ipx::current_core]]]

set_property value_validation_type range_long [ipx::get_user_parameters DELAY -of_objects [ipx::current_core]]
set_property value_validation_range_minimum 0 [ipx::get_user_parameters DELAY -of_objects [ipx::current_core]]
set_property value_validation_range_maximum 15 [ipx::get_user_parameters DELAY -of_objects [ipx::current_core]]

set_property core_revision 2 [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
set_property ip_repo_paths  ./$ip_name/$ip_name.srcs/sources_1/imports [current_project]
update_ip_catalog
close_project

