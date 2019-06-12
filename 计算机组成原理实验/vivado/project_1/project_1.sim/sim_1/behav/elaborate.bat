@echo off
set xv_path=E:\\Xilinx\\Vivado\\2017.1\\bin
call %xv_path%/xelab  -wto feea3fe0276d41518438cae2d2b3596a -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot simu_behav xil_defaultlib.simu xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
