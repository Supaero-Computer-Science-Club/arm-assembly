RED         := $(shell tput -Txterm setaf 1)
GREEN       := $(shell tput -Txterm setaf 2)
LIGHTPURPLE := $(shell tput -Txterm setaf 4)
WHITE       := $(shell tput -Txterm setaf 7)
RESET       := $(shell tput -Txterm sgr0)


##########################
## Assembly parameters. ##
ASM=arm-linux-gnueabihf-as
AFLAGS=
LINK=arm-linux-gnueabihf-gcc-8
LFLAGS=-nostdlib
##########################


##########################
## Files & directories. ##
SRC=...
OBJ_DIR=bin
OBJ=$(subst /,%,/$(SRC)).o
OUT_DIR=out
OUT=$(subst /,%,/$(SRC)).elf
##########################



##########################
## Targets.             ##
all: asm link

asm: dir_o
	@echo "assembling: $(RED)$(SRC)$(RESET) -> $(GREEN)$(OBJ_DIR)/$(OBJ)$(RESET)"
	@echo "	$(LIGHTPURPLE)$(ASM) $(AFLAGS) $(SRC) -o $(OBJ_DIR)/$(OBJ)$(RESET)"
	@$(ASM) $(AFLAGS) $(SRC) -o $(OBJ_DIR)/$(OBJ)

link: dir_out
	@echo "linking: $(RED)$(OBJ_DIR)/$(OBJ)$(RESET) -> $(GREEN)$(OUT_DIR)/$(OUT)$(RESET)"
	@echo "	$(LIGHTPURPLE)$(LINK) $(LFLAGS) $(OBJ_DIR)/$(OBJ) -o $(OUT_DIR)/$(OUT)$(RESET)"
	@$(LINK) $(LFLAGS) $(OBJ_DIR)/$(OBJ) -o $(OUT_DIR)/$(OUT)
	@echo "copying: $(RED)$(OUT_DIR)/$(OUT)$(RESET) -> $(GREEN)last.elf$(RESET)"
	@cp $(OUT_DIR)/$(OUT) ./last.elf

dir_o:
	@if [ ! -d "./bin" ]; then echo "autocreation of bin"; mkdir bin; fi

dir_out:
	@if [ ! -d "./out" ]; then echo "autocreation of out"; mkdir out; fi

run:
	./$(OUT)

clean:
	@echo -n "cleaning intermediate files... \n$(RED)"
	@find . -type f -name "*.o" -exec rm -rfv {} \;
	@echo -n "$(WHITE)cleaning executable files... \n$(RED)"
	@find . -type f -name "*.elf" -exec rm -rfv {} \;
	@echo -n $(WHITE)
##########################
