#Makefile for UVM Testbench - Lab 06

SIMULATOR = Questa

RTL= ../rtl/*
work= work
SVTB1= ../tb/top.sv
INC = +incdir+../tb +incdir+../test +incdir+../in_agent_top +incdir+../out_agent_top
SVTB2 = ../test/barrel_pkg.sv
VSIMOPT= -vopt -voptargs=+acc
VSIMCOV= -coverage -sva
VSIMBATCH1= -c -do "log -r /* ;coverage save -onexit mem_cov1;run -all; exit"
VSIMBATCH2= -c -do "log -r /* ;coverage save -onexit mem_cov2;run -all; exit"
VSIMBATCH3= -c -do "log -r /* ;coverage save -onexit mem_cov3;run -all; exit"
VSIMBATCH4= -c -do "log -r /* ;coverage save -onexit mem_cov4;run -all; exit"

help:
	@echo ===========================================
	@echo   USAGE -- make target
	@echo   clean     =^> clean earlier files
	@echo   sv_cmp    =^> compile the code
	@echo   run_test  =^> run ram_single_addr_test
	@echo   run_test1 =^> run ram_ten_addr_test
	@echo   run_test2 =^> run ram_odd_addr_test
	@echo   run_test3 =^> run ram_even_addr_test
	@echo ===========================================

clean      : clean_$(SIMULATOR)
sv_cmp     : sv_cmp_$(SIMULATOR)
run_test   : run_test_$(SIMULATOR)
run_test1  : run_test1_$(SIMULATOR)
run_test2  : run_test2_$(SIMULATOR)
run_test3  : run_test3_$(SIMULATOR)
view_wave1 : view_wave1_$(SIMULATOR)
view_wave2 : view_wave2_$(SIMULATOR)
view_wave3 : view_wave3_$(SIMULATOR)
view_wave4 : view_wave4_$(SIMULATOR)

# ---------- Questa Targets ----------

sv_cmp_Questa:
	vlib $(work)
	vmap work $(work)
	vlog -work $(work) $(RTL) $(INC) $(SVTB2) $(SVTB1)

run_test_Questa: clean sv_cmp
	vsim $(VSIMOPT) $(VSIMCOV) $(VSIMBATCH1) -wlf wave.wlf -l test1.log -sv_seed random work.top +UVM_TESTNAME=test

run_test1_Questa: clean sv_cmp
	vsim $(VSIMOPT) $(VSIMCOV) $(VSIMBATCH2) -wlf wave1.wlf -l test2.log -sv_seed random work.top +UVM_TESTNAME=ram_ten_addr_test

run_test2_Questa: clean sv_cmp
	vsim $(VSIMOPT) $(VSIMCOV) $(VSIMBATCH3) -wlf wave2.wlf -l test3.log -sv_seed random work.top +UVM_TESTNAME=ram_odd_addr_test

run_test3_Questa: clean sv_cmp
	vsim $(VSIMOPT) $(VSIMCOV) $(VSIMBATCH4) -wlf wave3.wlf -l test4.log -sv_seed random work.top +UVM_TESTNAME=ram_even_addr_test

clean_Questa:
	del /f /q transcript* *.log fcover* covhtml* mem_cov* *.wlf 2>nul
	if exist work rmdir /s /q work
	if exist modelsim.ini del /f /q modelsim.ini
	cls

view_wave1_Questa:
	vsim -view wave.wlf

view_wave2_Questa:
	vsim -view wave1.wlf

view_wave3_Questa:
	vsim -view wave2.wlf

view_wave4_Questa:
	vsim -view wave3.wlf