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

# Utility rule file for memory_ld.

# Include any custom commands dependencies for this target.
include esp-idf/esp_system/CMakeFiles/memory_ld.dir/compiler_depend.make

# Include the progress variables for this target.
include esp-idf/esp_system/CMakeFiles/memory_ld.dir/progress.make

esp-idf/esp_system/CMakeFiles/memory_ld: esp-idf/esp_system/ld/memory.ld

esp-idf/esp_system/ld/memory.ld: config/sdkconfig.h
esp-idf/esp_system/ld/memory.ld: C:/Espressif/frameworks/esp-idf-v4.4-2/components/esp_system/ld/esp32/memory.ld.in
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating memory.ld linker script..."
	cd /d C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\esp-idf\esp_system && C:\Espressif\tools\xtensa-esp32-elf\esp-2021r2-patch2-8.4.0\xtensa-esp32-elf\bin\xtensa-esp32-elf-gcc.exe -C -P -x c -E -o C:/Users/siebe/Documents/3de_bac/2de_semester/EE5/a21iot02/ESP32/sample_project/cmake-build-debug/esp-idf/esp_system/ld/memory.ld -I C:/Users/siebe/Documents/3de_bac/2de_semester/EE5/a21iot02/ESP32/sample_project/cmake-build-debug/config -I C:/Espressif/frameworks/esp-idf-v4.4-2/components/esp_system/ld C:/Espressif/frameworks/esp-idf-v4.4-2/components/esp_system/ld/esp32/memory.ld.in

memory_ld: esp-idf/esp_system/CMakeFiles/memory_ld
memory_ld: esp-idf/esp_system/ld/memory.ld
memory_ld: esp-idf/esp_system/CMakeFiles/memory_ld.dir/build.make
.PHONY : memory_ld

# Rule to build all files generated by this target.
esp-idf/esp_system/CMakeFiles/memory_ld.dir/build: memory_ld
.PHONY : esp-idf/esp_system/CMakeFiles/memory_ld.dir/build

esp-idf/esp_system/CMakeFiles/memory_ld.dir/clean:
	cd /d C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\esp-idf\esp_system && $(CMAKE_COMMAND) -P CMakeFiles\memory_ld.dir\cmake_clean.cmake
.PHONY : esp-idf/esp_system/CMakeFiles/memory_ld.dir/clean

esp-idf/esp_system/CMakeFiles/memory_ld.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project C:\Espressif\frameworks\esp-idf-v4.4-2\components\esp_system C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\esp-idf\esp_system C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\esp-idf\esp_system\CMakeFiles\memory_ld.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/esp_system/CMakeFiles/memory_ld.dir/depend

