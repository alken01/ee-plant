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
include esp-idf/console/CMakeFiles/__idf_console.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include esp-idf/console/CMakeFiles/__idf_console.dir/compiler_depend.make

# Include the progress variables for this target.
include esp-idf/console/CMakeFiles/__idf_console.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/console/CMakeFiles/__idf_console.dir/flags.make

esp-idf/console/CMakeFiles/__idf_console.dir/commands.c.obj: esp-idf/console/CMakeFiles/__idf_console.dir/flags.make
esp-idf/console/CMakeFiles/__idf_console.dir/commands.c.obj: /home/tuur/esp-idf-master/components/console/commands.c
esp-idf/console/CMakeFiles/__idf_console.dir/commands.c.obj: esp-idf/console/CMakeFiles/__idf_console.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object esp-idf/console/CMakeFiles/__idf_console.dir/commands.c.obj"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console && /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/console/CMakeFiles/__idf_console.dir/commands.c.obj -MF CMakeFiles/__idf_console.dir/commands.c.obj.d -o CMakeFiles/__idf_console.dir/commands.c.obj -c /home/tuur/esp-idf-master/components/console/commands.c

esp-idf/console/CMakeFiles/__idf_console.dir/commands.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_console.dir/commands.c.i"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console && /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/tuur/esp-idf-master/components/console/commands.c > CMakeFiles/__idf_console.dir/commands.c.i

esp-idf/console/CMakeFiles/__idf_console.dir/commands.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_console.dir/commands.c.s"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console && /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/tuur/esp-idf-master/components/console/commands.c -o CMakeFiles/__idf_console.dir/commands.c.s

esp-idf/console/CMakeFiles/__idf_console.dir/esp_console_repl.c.obj: esp-idf/console/CMakeFiles/__idf_console.dir/flags.make
esp-idf/console/CMakeFiles/__idf_console.dir/esp_console_repl.c.obj: /home/tuur/esp-idf-master/components/console/esp_console_repl.c
esp-idf/console/CMakeFiles/__idf_console.dir/esp_console_repl.c.obj: esp-idf/console/CMakeFiles/__idf_console.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object esp-idf/console/CMakeFiles/__idf_console.dir/esp_console_repl.c.obj"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console && /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/console/CMakeFiles/__idf_console.dir/esp_console_repl.c.obj -MF CMakeFiles/__idf_console.dir/esp_console_repl.c.obj.d -o CMakeFiles/__idf_console.dir/esp_console_repl.c.obj -c /home/tuur/esp-idf-master/components/console/esp_console_repl.c

esp-idf/console/CMakeFiles/__idf_console.dir/esp_console_repl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_console.dir/esp_console_repl.c.i"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console && /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/tuur/esp-idf-master/components/console/esp_console_repl.c > CMakeFiles/__idf_console.dir/esp_console_repl.c.i

esp-idf/console/CMakeFiles/__idf_console.dir/esp_console_repl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_console.dir/esp_console_repl.c.s"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console && /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/tuur/esp-idf-master/components/console/esp_console_repl.c -o CMakeFiles/__idf_console.dir/esp_console_repl.c.s

esp-idf/console/CMakeFiles/__idf_console.dir/split_argv.c.obj: esp-idf/console/CMakeFiles/__idf_console.dir/flags.make
esp-idf/console/CMakeFiles/__idf_console.dir/split_argv.c.obj: /home/tuur/esp-idf-master/components/console/split_argv.c
esp-idf/console/CMakeFiles/__idf_console.dir/split_argv.c.obj: esp-idf/console/CMakeFiles/__idf_console.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object esp-idf/console/CMakeFiles/__idf_console.dir/split_argv.c.obj"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console && /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/console/CMakeFiles/__idf_console.dir/split_argv.c.obj -MF CMakeFiles/__idf_console.dir/split_argv.c.obj.d -o CMakeFiles/__idf_console.dir/split_argv.c.obj -c /home/tuur/esp-idf-master/components/console/split_argv.c

esp-idf/console/CMakeFiles/__idf_console.dir/split_argv.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_console.dir/split_argv.c.i"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console && /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/tuur/esp-idf-master/components/console/split_argv.c > CMakeFiles/__idf_console.dir/split_argv.c.i

esp-idf/console/CMakeFiles/__idf_console.dir/split_argv.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_console.dir/split_argv.c.s"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console && /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/tuur/esp-idf-master/components/console/split_argv.c -o CMakeFiles/__idf_console.dir/split_argv.c.s

esp-idf/console/CMakeFiles/__idf_console.dir/argtable3/argtable3.c.obj: esp-idf/console/CMakeFiles/__idf_console.dir/flags.make
esp-idf/console/CMakeFiles/__idf_console.dir/argtable3/argtable3.c.obj: /home/tuur/esp-idf-master/components/console/argtable3/argtable3.c
esp-idf/console/CMakeFiles/__idf_console.dir/argtable3/argtable3.c.obj: esp-idf/console/CMakeFiles/__idf_console.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object esp-idf/console/CMakeFiles/__idf_console.dir/argtable3/argtable3.c.obj"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console && /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wno-clobbered -MD -MT esp-idf/console/CMakeFiles/__idf_console.dir/argtable3/argtable3.c.obj -MF CMakeFiles/__idf_console.dir/argtable3/argtable3.c.obj.d -o CMakeFiles/__idf_console.dir/argtable3/argtable3.c.obj -c /home/tuur/esp-idf-master/components/console/argtable3/argtable3.c

esp-idf/console/CMakeFiles/__idf_console.dir/argtable3/argtable3.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_console.dir/argtable3/argtable3.c.i"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console && /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wno-clobbered -E /home/tuur/esp-idf-master/components/console/argtable3/argtable3.c > CMakeFiles/__idf_console.dir/argtable3/argtable3.c.i

esp-idf/console/CMakeFiles/__idf_console.dir/argtable3/argtable3.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_console.dir/argtable3/argtable3.c.s"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console && /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -Wno-clobbered -S /home/tuur/esp-idf-master/components/console/argtable3/argtable3.c -o CMakeFiles/__idf_console.dir/argtable3/argtable3.c.s

esp-idf/console/CMakeFiles/__idf_console.dir/linenoise/linenoise.c.obj: esp-idf/console/CMakeFiles/__idf_console.dir/flags.make
esp-idf/console/CMakeFiles/__idf_console.dir/linenoise/linenoise.c.obj: /home/tuur/esp-idf-master/components/console/linenoise/linenoise.c
esp-idf/console/CMakeFiles/__idf_console.dir/linenoise/linenoise.c.obj: esp-idf/console/CMakeFiles/__idf_console.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object esp-idf/console/CMakeFiles/__idf_console.dir/linenoise/linenoise.c.obj"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console && /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/console/CMakeFiles/__idf_console.dir/linenoise/linenoise.c.obj -MF CMakeFiles/__idf_console.dir/linenoise/linenoise.c.obj.d -o CMakeFiles/__idf_console.dir/linenoise/linenoise.c.obj -c /home/tuur/esp-idf-master/components/console/linenoise/linenoise.c

esp-idf/console/CMakeFiles/__idf_console.dir/linenoise/linenoise.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_console.dir/linenoise/linenoise.c.i"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console && /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/tuur/esp-idf-master/components/console/linenoise/linenoise.c > CMakeFiles/__idf_console.dir/linenoise/linenoise.c.i

esp-idf/console/CMakeFiles/__idf_console.dir/linenoise/linenoise.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_console.dir/linenoise/linenoise.c.s"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console && /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/tuur/esp-idf-master/components/console/linenoise/linenoise.c -o CMakeFiles/__idf_console.dir/linenoise/linenoise.c.s

# Object files for target __idf_console
__idf_console_OBJECTS = \
"CMakeFiles/__idf_console.dir/commands.c.obj" \
"CMakeFiles/__idf_console.dir/esp_console_repl.c.obj" \
"CMakeFiles/__idf_console.dir/split_argv.c.obj" \
"CMakeFiles/__idf_console.dir/argtable3/argtable3.c.obj" \
"CMakeFiles/__idf_console.dir/linenoise/linenoise.c.obj"

# External object files for target __idf_console
__idf_console_EXTERNAL_OBJECTS =

esp-idf/console/libconsole.a: esp-idf/console/CMakeFiles/__idf_console.dir/commands.c.obj
esp-idf/console/libconsole.a: esp-idf/console/CMakeFiles/__idf_console.dir/esp_console_repl.c.obj
esp-idf/console/libconsole.a: esp-idf/console/CMakeFiles/__idf_console.dir/split_argv.c.obj
esp-idf/console/libconsole.a: esp-idf/console/CMakeFiles/__idf_console.dir/argtable3/argtable3.c.obj
esp-idf/console/libconsole.a: esp-idf/console/CMakeFiles/__idf_console.dir/linenoise/linenoise.c.obj
esp-idf/console/libconsole.a: esp-idf/console/CMakeFiles/__idf_console.dir/build.make
esp-idf/console/libconsole.a: esp-idf/console/CMakeFiles/__idf_console.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking C static library libconsole.a"
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console && $(CMAKE_COMMAND) -P CMakeFiles/__idf_console.dir/cmake_clean_target.cmake
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/__idf_console.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/console/CMakeFiles/__idf_console.dir/build: esp-idf/console/libconsole.a
.PHONY : esp-idf/console/CMakeFiles/__idf_console.dir/build

esp-idf/console/CMakeFiles/__idf_console.dir/clean:
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console && $(CMAKE_COMMAND) -P CMakeFiles/__idf_console.dir/cmake_clean.cmake
.PHONY : esp-idf/console/CMakeFiles/__idf_console.dir/clean

esp-idf/console/CMakeFiles/__idf_console.dir/depend:
	cd /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tuur/a21iot02/ESP32/sample_project /home/tuur/esp-idf-master/components/console /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console /home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/console/CMakeFiles/__idf_console.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/console/CMakeFiles/__idf_console.dir/depend
