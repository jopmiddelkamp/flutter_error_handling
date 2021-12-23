
cd flutter_error_handling_core
echo "### Building flutter_error_handling_core"
./flutter_pub_build_runner.sh build
cd .. 

cd flutter_error_handling_data
echo "### Building flutter_error_handling_data"
./flutter_pub_build_runner.sh build
cd .. 

cd flutter_error_handling_ui
echo "### Building flutter_error_handling_ui"
./flutter_pub_build_runner.sh build
cd .. 
