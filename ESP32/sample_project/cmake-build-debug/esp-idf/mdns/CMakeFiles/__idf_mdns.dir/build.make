# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.21

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

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug

# Include any dependencies generated for this target.
include esp-idf/mdns/CMakeFiles/__idf_mdns.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include esp-idf/mdns/CMakeFiles/__idf_mdns.dir/compiler_depend.make

# Include the progress variables for this target.
include esp-idf/mdns/CMakeFiles/__idf_mdns.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/mdns/CMakeFiles/__idf_mdns.dir/flags.make

esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns.c.obj: esp-idf/mdns/CMakeFiles/__idf_mdns.dir/flags.make
esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns.c.obj: C:/Espressif/frameworks/esp-idf-v4.4-2/components/mdns/mdns.c
esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns.c.obj: esp-idf/mdns/CMakeFiles/__idf_mdns.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns.c.obj"
	cd /d C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\esp-idf\mdns && C:\Espressif\tools\xtensa-esp32-elf\esp-2021r2-patch2-8.4.0\xtensa-esp32-elf\bin\xtensa-esp32-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns.c.obj -MF CMakeFiles\__idf_mdns.dir\mdns.c.obj.d -o CMakeFiles\__idf_mdns.dir\mdns.c.obj -c C:\Espressif\frameworks\esp-idf-v4.4-2\components\mdns\mdns.c

esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_mdns.dir/mdns.c.i"
	cd /d C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\esp-idf\mdns && C:\Espressif\tools\xtensa-esp32-elf\esp-2021r2-patch2-8.4.0\xtensa-esp32-elf\bin\xtensa-esp32-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Espressif\frameworks\esp-idf-v4.4-2\components\mdns\mdns.c > CMakeFiles\__idf_mdns.dir\mdns.c.i

esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_mdns.dir/mdns.c.s"
	cd /d C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\esp-idf\mdns && C:\Espressif\tools\xtensa-esp32-elf\esp-2021r2-patch2-8.4.0\xtensa-esp32-elf\bin\xtensa-esp32-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:\Espressif\frameworks\esp-idf-v4.4-2\components\mdns\mdns.c -o CMakeFiles\__idf_mdns.dir\mdns.c.s

esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns_networking_lwip.c.obj: esp-idf/mdns/CMakeFiles/__idf_mdns.dir/flags.make
esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns_networking_lwip.c.obj: C:/Espressif/frameworks/esp-idf-v4.4-2/components/mdns/mdns_networking_lwip.c
esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns_networking_lwip.c.obj: esp-idf/mdns/CMakeFiles/__idf_mdns.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns_networking_lwip.c.obj"
	cd /d C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\esp-idf\mdns && C:\Espressif\tools\xtensa-esp32-elf\esp-2021r2-patch2-8.4.0\xtensa-esp32-elf\bin\xtensa-esp32-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns_networking_lwip.c.obj -MF CMakeFiles\__idf_mdns.dir\mdns_networking_lwip.c.obj.d -o CMakeFiles\__idf_mdns.dir\mdns_networking_lwip.c.obj -c C:\Espressif\frameworks\esp-idf-v4.4-2\components\mdns\mdns_networking_lwip.c

esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns_networking_lwip.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_mdns.dir/mdns_networking_lwip.c.i"
	cd /d C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\esp-idf\mdns && C:\Espressif\tools\xtensa-esp32-elf\esp-2021r2-patch2-8.4.0\xtensa-esp32-elf\bin\xtensa-esp32-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Espressif\frameworks\esp-idf-v4.4-2\components\mdns\mdns_networking_lwip.c > CMakeFiles\__idf_mdns.dir\mdns_networking_lwip.c.i

esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns_networking_lwip.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_mdns.dir/mdns_networking_lwip.c.s"
	cd /d C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\esp-idf\mdns && C:\Espressif\tools\xtensa-esp32-elf\esp-2021r2-patch2-8.4.0\xtensa-esp32-elf\bin\xtensa-esp32-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:\Espressif\frameworks\esp-idf-v4.4-2\components\mdns\mdns_networking_lwip.c -o CMakeFiles\__idf_mdns.dir\mdns_networking_lwip.c.s

esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns_console.c.obj: esp-idf/mdns/CMakeFiles/__idf_mdns.dir/flags.make
esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns_console.c.obj: C:/Espressif/frameworks/esp-idf-v4.4-2/components/mdns/mdns_console.c
esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns_console.c.obj: esp-idf/mdns/CMakeFiles/__idf_mdns.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns_console.c.obj"
	cd /d C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\esp-idf\mdns && C:\Espressif\tools\xtensa-esp32-elf\esp-2021r2-patch2-8.4.0\xtensa-esp32-elf\bin\xtensa-esp32-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns_console.c.obj -MF CMakeFiles\__idf_mdns.dir\mdns_console.c.obj.d -o CMakeFiles\__idf_mdns.dir\mdns_console.c.obj -c C:\Espressif\frameworks\esp-idf-v4.4-2\components\mdns\mdns_console.c

esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns_console.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_mdns.dir/mdns_console.c.i"
	cd /d C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\esp-idf\mdns && C:\Espressif\tools\xtensa-esp32-elf\esp-2021r2-patch2-8.4.0\xtensa-esp32-elf\bin\xtensa-esp32-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Espressif\frameworks\esp-idf-v4.4-2\components\mdns\mdns_console.c > CMakeFiles\__idf_mdns.dir\mdns_console.c.i

esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns_console.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_mdns.dir/mdns_console.c.s"
	cd /d C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\esp-idf\mdns && C:\Espressif\tools\xtensa-esp32-elf\esp-2021r2-patch2-8.4.0\xtensa-esp32-elf\bin\xtensa-esp32-elf-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:\Espressif\frameworks\esp-idf-v4.4-2\components\mdns\mdns_console.c -o CMakeFiles\__idf_mdns.dir\mdns_console.c.s

# Object files for target __idf_mdns
__idf_mdns_OBJECTS = \
"CMakeFiles/__idf_mdns.dir/mdns.c.obj" \
"CMakeFiles/__idf_mdns.dir/mdns_networking_lwip.c.obj" \
"CMakeFiles/__idf_mdns.dir/mdns_console.c.obj"

# External object files for target __idf_mdns
__idf_mdns_EXTERNAL_OBJECTS =

esp-idf/mdns/libmdns.a: esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns.c.obj
esp-idf/mdns/libmdns.a: esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns_networking_lwip.c.obj
esp-idf/mdns/libmdns.a: esp-idf/mdns/CMakeFiles/__idf_mdns.dir/mdns_console.c.obj
esp-idf/mdns/libmdns.a: esp-idf/mdns/CMakeFiles/__idf_mdns.dir/build.make
esp-idf/mdns/libmdns.a: esp-idf/mdns/CMakeFiles/__idf_mdns.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C static library libmdns.a"
	cd /d C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\esp-idf\mdns && $(CMAKE_COMMAND) -P CMakeFiles\__idf_mdns.dir\cmake_clean_target.cmake
	cd /d C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\esp-idf\mdns && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\__idf_mdns.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/mdns/CMakeFiles/__idf_mdns.dir/build: esp-idf/mdns/libmdns.a
.PHONY : esp-idf/mdns/CMakeFiles/__idf_mdns.dir/build

esp-idf/mdns/CMakeFiles/__idf_mdns.dir/clean:
	cd /d C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\esp-idf\mdns && $(CMAKE_COMMAND) -P CMakeFiles\__idf_mdns.dir\cmake_clean.cmake
.PHONY : esp-idf/mdns/CMakeFiles/__idf_mdns.dir/clean

esp-idf/mdns/CMakeFiles/__idf_mdns.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project C:\Espressif\frameworks\esp-idf-v4.4-2\components\mdns C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\esp-idf\mdns C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\esp-idf\mdns\CMakeFiles\__idf_mdns.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/mdns/CMakeFiles/__idf_mdns.dir/depend

