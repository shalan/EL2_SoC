# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0
# cannot commit files larger than 100 MB to GitHub
FILE_SIZE_LIMIT_MB = 100

# Commands to be used to compress/uncompress files
# they must operate **in place** (otherwise, modify the target to delete the
# intermediate file/archive)
COMPRESS ?= gzip -n --best
UNCOMPRESS ?= gzip -d
ARCHIVE_EXT ?= gz

# The following variables are to build static pattern rules

# Needed to rebuild archives that were previously split
SPLIT_FILES := $(shell find . -type f -name "*.$(ARCHIVE_EXT).00.split")
SPLIT_FILES_SOURCES := $(basename $(basename $(basename $(SPLIT_FILES))))

# Needed to uncompress the existing archives
ARCHIVES := $(shell find . -type f -name "*.$(ARCHIVE_EXT)")
ARCHIVE_SOURCES := $(basename $(ARCHIVES))

# Needed to compress and split files/archives that are too large
LARGE_FILES := $(shell find ./gds -type f -name "*.gds")
LARGE_FILES += $(shell find . -type f -size +$(FILE_SIZE_LIMIT_MB)M -not -path "./.git/*" -not -path "./gds/*" -not -path "./openlane/*")
LARGE_FILES_GZ := $(addsuffix .$(ARCHIVE_EXT), $(LARGE_FILES))
LARGE_FILES_GZ_SPLIT := $(addsuffix .$(ARCHIVE_EXT).00.split, $(LARGE_FILES))
# consider splitting existing archives
LARGE_FILES_GZ_SPLIT += $(addsuffix .00.split, $(ARCHIVES))

CARAVEL_ROOT?=/home/cse-admin1/work/Caravel_EL2_SoC

#####
$(LARGE_FILES_GZ): %.$(ARCHIVE_EXT): %
	@if ! [ $(suffix $<) == ".$(ARCHIVE_EXT)" ]; then\
		$(COMPRESS) $< > /dev/null &&\
		echo "$< -> $@";\
	fi

$(LARGE_FILES_GZ_SPLIT): %.$(ARCHIVE_EXT).00.split: %.$(ARCHIVE_EXT)
	@if [ -n "$$(find "$<" -prune -size +$(FILE_SIZE_LIMIT_MB)M)" ]; then\
		split $< -b $(FILE_SIZE_LIMIT_MB)M $<. -d --additional-suffix=.split &&\
		rm $< &&\
		echo -n "$< -> $$(ls $<.*.split)" | tr '\n' ' ' && echo "";\
	fi

# This target compresses all files larger than $(FILE_SIZE_LIMIT_MB) MB
.PHONY: compress
compress: $(LARGE_FILES_GZ) $(LARGE_FILES_GZ_SPLIT)
	@echo "Files larger than $(FILE_SIZE_LIMIT_MB) MBytes are compressed!"

#####
$(ARCHIVE_SOURCES): %: %.$(ARCHIVE_EXT)
	@$(UNCOMPRESS) $<
	@echo "$< -> $@"

.SECONDEXPANSION:
$(SPLIT_FILES_SOURCES): %: $$(sort $$(wildcard %.$(ARCHIVE_EXT).*.split))
	@cat $? > $@.$(ARCHIVE_EXT)
	@rm $?
	@echo "$? -> $@.$(ARCHIVE_EXT)"
	@$(UNCOMPRESS) $@.$(ARCHIVE_EXT)
	@echo "$@.$(ARCHIVE_EXT) -> $@"


.PHONY: uncompress
uncompress: $(SPLIT_FILES_SOURCES) $(ARCHIVE_SOURCES)
	@echo "All files are uncompressed!"

.PHONY: migrate
migrate:
	# Verilog Views
	mkdir -p $(CARAVEL_ROOT)/verilog/rtl/user_project
	mkdir -p $(CARAVEL_ROOT)/verilog/gl/user_project

	yes | cp -a -rf verilog/gl $(CARAVEL_ROOT)/verilog/gl/user_project
	yes | cp -a verilog/gl/user_project_wrapper.v  $(CARAVEL_ROOT)/verilog/gl/user_project_wrapper.v
	yes | cp -a verilog/rtl/user_project_wrapper.v  $(CARAVEL_ROOT)/verilog/rtl/user_project_wrapper.v
	yes | cp -r verilog/rtl/*.v $(CARAVEL_ROOT)/verilog/rtl/user_project
	yes | cp -r verilog/rtl/IPs $(CARAVEL_ROOT)/verilog/rtl/user_project
	yes | cp -r verilog/rtl/acc $(CARAVEL_ROOT)/verilog/rtl/user_project
	yes | cp -r verilog/rtl/AHB_sys_0 $(CARAVEL_ROOT)/verilog/rtl/user_project

	# Physical views
	yes | cp -a def/user_project_wrapper.def $(CARAVEL_ROOT)/def/
	yes | cp -a lef/user_project_wrapper.lef $(CARAVEL_ROOT)/lef/
	yes | cp -a mag/user_project_wrapper.mag $(CARAVEL_ROOT)/mag/
	yes | cp -a -rf gds/user_project_wrapper.gds $(CARAVEL_ROOT)/gds/