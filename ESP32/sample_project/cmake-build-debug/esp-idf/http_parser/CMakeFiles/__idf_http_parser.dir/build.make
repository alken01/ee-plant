# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.21

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /snap/clion/184/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/184/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/tuur/a21iot02/ESP32/sample_project

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug

# Include any dependencies generated for this target.
include esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/compiler_depend.make

# Include the progress variables for this target.
include esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/flags.make

esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/http_parser.c.obj: esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/flags.make
esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/http_parser.c.obj: /home/tuur/esp-idf-master/components/http_parser/http_parser.c
esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/http_parser.c.obj: esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/http_parser.c.obj"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/http_parser && /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/http_parser.c.obj -MF CMakeFiles/__idf_http_parser.dir/http_parser.c.obj.d -o CMakeFiles/__idf_http_parser.dir/http_parser.c.obj -c /home/tuur/esp-idf-master/components/http_parser/http_parser.c

esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/http_parser.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_http_parser.dir/http_parser.c.i"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/http_parser && /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/tuur/esp-idf-master/components/http_parser/http_parser.c > CMakeFiles/__idf_http_parser.dir/http_parser.c.i

esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/http_parser.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_http_parser.dir/http_parser.c.s"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/http_parser && /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/tuur/esp-idf-master/components/http_parser/http_parser.c -o CMakeFiles/__idf_http_parser.dir/http_parser.c.s

# Object files for target __idf_http_parser
__idf_http_parser_OBJECTS = \
"CMakeFiles/__idf_http_parser.dir/http_parser.c.obj"

# External object files for target __idf_http_parser
__idf_http_parser_EXTERNAL_OBJECTS =

esp-idf/http_parser/libhttp_parser.a: esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/http_parser.c.obj
esp-idf/http_parser/libhttp_parser.a: esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/build.make
esp-idf/http_parser/libhttp_parser.a: esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library libhttp_parser.a"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/http_parser && $(CMAKE_COMMAND) -P CMakeFiles/__idf_http_parser.dir/cmake_clean_target.cmake
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/http_parser && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/__idf_http_parser.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/build: esp-idf/http_parser/libhttp_parser.a
.PHONY : esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/build

esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/clean:
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/http_parser && $(CMAKE_COMMAND) -P CMakeFiles/__idf_http_parser.dir/cmake_clean.cmake
.PHONY : esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/clean

esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/depend:
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tuur/a21iot02/ESP32/sample_project /home/tuur/esp-idf-master/components/http_parser /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/http_parser /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/http_parser/CMakeFiles/__idf_http_parser.dir/depend

