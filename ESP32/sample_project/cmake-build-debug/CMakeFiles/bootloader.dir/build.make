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

# Utility rule file for bootloader.

# Include any custom commands dependencies for this target.
include CMakeFiles/bootloader.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/bootloader.dir/progress.make

CMakeFiles/bootloader: CMakeFiles/bootloader-complete

CMakeFiles/bootloader-complete: bootloader-prefix/src/bootloader-stamp/bootloader-install
CMakeFiles/bootloader-complete: bootloader-prefix/src/bootloader-stamp/bootloader-mkdir
CMakeFiles/bootloader-complete: bootloader-prefix/src/bootloader-stamp/bootloader-download
CMakeFiles/bootloader-complete: bootloader-prefix/src/bootloader-stamp/bootloader-update
CMakeFiles/bootloader-complete: bootloader-prefix/src/bootloader-stamp/bootloader-patch
CMakeFiles/bootloader-complete: bootloader-prefix/src/bootloader-stamp/bootloader-configure
CMakeFiles/bootloader-complete: bootloader-prefix/src/bootloader-stamp/bootloader-build
CMakeFiles/bootloader-complete: bootloader-prefix/src/bootloader-stamp/bootloader-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'bootloader'"
	"C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E make_directory C:/Users/siebe/Documents/3de_bac/2de_semester/EE5/a21iot02/ESP32/sample_project/cmake-build-debug/CMakeFiles
	"C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E touch C:/Users/siebe/Documents/3de_bac/2de_semester/EE5/a21iot02/ESP32/sample_project/cmake-build-debug/CMakeFiles/bootloader-complete
	"C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E touch C:/Users/siebe/Documents/3de_bac/2de_semester/EE5/a21iot02/ESP32/sample_project/cmake-build-debug/bootloader-prefix/src/bootloader-stamp/bootloader-done

bootloader-prefix/src/bootloader-stamp/bootloader-build: bootloader-prefix/src/bootloader-stamp/bootloader-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Performing build step for 'bootloader'"
	cd /d C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\bootloader && $(MAKE)

bootloader-prefix/src/bootloader-stamp/bootloader-configure: bootloader-prefix/tmp/bootloader-cfgcmd.txt
bootloader-prefix/src/bootloader-stamp/bootloader-configure: bootloader-prefix/src/bootloader-stamp/bootloader-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Performing configure step for 'bootloader'"
	cd /d C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\bootloader && "C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -DSDKCONFIG=C:/Users/siebe/Documents/3de_bac/2de_semester/EE5/a21iot02/ESP32/sample_project/sdkconfig -DIDF_PATH=C:/Espressif/frameworks/esp-idf-v4.4-2 -DIDF_TARGET=esp32 -DPYTHON_DEPS_CHECKED=1 -DPYTHON=python -DEXTRA_COMPONENT_DIRS=C:/Espressif/frameworks/esp-idf-v4.4-2/components/bootloader -DPROJECT_SOURCE_DIR=C:/Users/siebe/Documents/3de_bac/2de_semester/EE5/a21iot02/ESP32/sample_project -DLEGACY_INCLUDE_COMMON_HEADERS= "-GCodeBlocks - MinGW Makefiles" C:/Espressif/frameworks/esp-idf-v4.4-2/components/bootloader/subproject
	cd /d C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\bootloader && "C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E touch C:/Users/siebe/Documents/3de_bac/2de_semester/EE5/a21iot02/ESP32/sample_project/cmake-build-debug/bootloader-prefix/src/bootloader-stamp/bootloader-configure

bootloader-prefix/src/bootloader-stamp/bootloader-download: bootloader-prefix/src/bootloader-stamp/bootloader-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "No download step for 'bootloader'"
	"C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E echo_append
	"C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E touch C:/Users/siebe/Documents/3de_bac/2de_semester/EE5/a21iot02/ESP32/sample_project/cmake-build-debug/bootloader-prefix/src/bootloader-stamp/bootloader-download

bootloader-prefix/src/bootloader-stamp/bootloader-install: bootloader-prefix/src/bootloader-stamp/bootloader-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No install step for 'bootloader'"
	cd /d C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\bootloader && "C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E echo_append
	cd /d C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\bootloader && "C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E touch C:/Users/siebe/Documents/3de_bac/2de_semester/EE5/a21iot02/ESP32/sample_project/cmake-build-debug/bootloader-prefix/src/bootloader-stamp/bootloader-install

bootloader-prefix/src/bootloader-stamp/bootloader-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Creating directories for 'bootloader'"
	"C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E make_directory C:/Espressif/frameworks/esp-idf-v4.4-2/components/bootloader/subproject
	"C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E make_directory C:/Users/siebe/Documents/3de_bac/2de_semester/EE5/a21iot02/ESP32/sample_project/cmake-build-debug/bootloader
	"C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E make_directory C:/Users/siebe/Documents/3de_bac/2de_semester/EE5/a21iot02/ESP32/sample_project/cmake-build-debug/bootloader-prefix
	"C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E make_directory C:/Users/siebe/Documents/3de_bac/2de_semester/EE5/a21iot02/ESP32/sample_project/cmake-build-debug/bootloader-prefix/tmp
	"C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E make_directory C:/Users/siebe/Documents/3de_bac/2de_semester/EE5/a21iot02/ESP32/sample_project/cmake-build-debug/bootloader-prefix/src/bootloader-stamp
	"C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E make_directory C:/Users/siebe/Documents/3de_bac/2de_semester/EE5/a21iot02/ESP32/sample_project/cmake-build-debug/bootloader-prefix/src
	"C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E make_directory C:/Users/siebe/Documents/3de_bac/2de_semester/EE5/a21iot02/ESP32/sample_project/cmake-build-debug/bootloader-prefix/src/bootloader-stamp
	"C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E touch C:/Users/siebe/Documents/3de_bac/2de_semester/EE5/a21iot02/ESP32/sample_project/cmake-build-debug/bootloader-prefix/src/bootloader-stamp/bootloader-mkdir

bootloader-prefix/src/bootloader-stamp/bootloader-patch: bootloader-prefix/src/bootloader-stamp/bootloader-update
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "No patch step for 'bootloader'"
	"C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E echo_append
	"C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E touch C:/Users/siebe/Documents/3de_bac/2de_semester/EE5/a21iot02/ESP32/sample_project/cmake-build-debug/bootloader-prefix/src/bootloader-stamp/bootloader-patch

bootloader-prefix/src/bootloader-stamp/bootloader-update: bootloader-prefix/src/bootloader-stamp/bootloader-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "No update step for 'bootloader'"
	"C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E echo_append
	"C:\Program Files\JetBrains\CLion 2021.3.4\bin\cmake\win\bin\cmake.exe" -E touch C:/Users/siebe/Documents/3de_bac/2de_semester/EE5/a21iot02/ESP32/sample_project/cmake-build-debug/bootloader-prefix/src/bootloader-stamp/bootloader-update

bootloader: CMakeFiles/bootloader
bootloader: CMakeFiles/bootloader-complete
bootloader: bootloader-prefix/src/bootloader-stamp/bootloader-build
bootloader: bootloader-prefix/src/bootloader-stamp/bootloader-configure
bootloader: bootloader-prefix/src/bootloader-stamp/bootloader-download
bootloader: bootloader-prefix/src/bootloader-stamp/bootloader-install
bootloader: bootloader-prefix/src/bootloader-stamp/bootloader-mkdir
bootloader: bootloader-prefix/src/bootloader-stamp/bootloader-patch
bootloader: bootloader-prefix/src/bootloader-stamp/bootloader-update
bootloader: CMakeFiles/bootloader.dir/build.make
.PHONY : bootloader

# Rule to build all files generated by this target.
CMakeFiles/bootloader.dir/build: bootloader
.PHONY : CMakeFiles/bootloader.dir/build

CMakeFiles/bootloader.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\bootloader.dir\cmake_clean.cmake
.PHONY : CMakeFiles/bootloader.dir/clean

CMakeFiles/bootloader.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug C:\Users\siebe\Documents\3de_bac\2de_semester\EE5\a21iot02\ESP32\sample_project\cmake-build-debug\CMakeFiles\bootloader.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/bootloader.dir/depend

