# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.7

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/wodzu/Projects/CLionProjects/Filozofowie

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/wodzu/Projects/CLionProjects/Filozofowie/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Filozofowie.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Filozofowie.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Filozofowie.dir/flags.make

CMakeFiles/Filozofowie.dir/main.cpp.o: CMakeFiles/Filozofowie.dir/flags.make
CMakeFiles/Filozofowie.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/wodzu/Projects/CLionProjects/Filozofowie/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Filozofowie.dir/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Filozofowie.dir/main.cpp.o -c /Users/wodzu/Projects/CLionProjects/Filozofowie/main.cpp

CMakeFiles/Filozofowie.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Filozofowie.dir/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/wodzu/Projects/CLionProjects/Filozofowie/main.cpp > CMakeFiles/Filozofowie.dir/main.cpp.i

CMakeFiles/Filozofowie.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Filozofowie.dir/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/wodzu/Projects/CLionProjects/Filozofowie/main.cpp -o CMakeFiles/Filozofowie.dir/main.cpp.s

CMakeFiles/Filozofowie.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/Filozofowie.dir/main.cpp.o.requires

CMakeFiles/Filozofowie.dir/main.cpp.o.provides: CMakeFiles/Filozofowie.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/Filozofowie.dir/build.make CMakeFiles/Filozofowie.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/Filozofowie.dir/main.cpp.o.provides

CMakeFiles/Filozofowie.dir/main.cpp.o.provides.build: CMakeFiles/Filozofowie.dir/main.cpp.o


# Object files for target Filozofowie
Filozofowie_OBJECTS = \
"CMakeFiles/Filozofowie.dir/main.cpp.o"

# External object files for target Filozofowie
Filozofowie_EXTERNAL_OBJECTS =

Filozofowie: CMakeFiles/Filozofowie.dir/main.cpp.o
Filozofowie: CMakeFiles/Filozofowie.dir/build.make
Filozofowie: CMakeFiles/Filozofowie.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/wodzu/Projects/CLionProjects/Filozofowie/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable Filozofowie"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Filozofowie.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Filozofowie.dir/build: Filozofowie

.PHONY : CMakeFiles/Filozofowie.dir/build

CMakeFiles/Filozofowie.dir/requires: CMakeFiles/Filozofowie.dir/main.cpp.o.requires

.PHONY : CMakeFiles/Filozofowie.dir/requires

CMakeFiles/Filozofowie.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Filozofowie.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Filozofowie.dir/clean

CMakeFiles/Filozofowie.dir/depend:
	cd /Users/wodzu/Projects/CLionProjects/Filozofowie/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/wodzu/Projects/CLionProjects/Filozofowie /Users/wodzu/Projects/CLionProjects/Filozofowie /Users/wodzu/Projects/CLionProjects/Filozofowie/cmake-build-debug /Users/wodzu/Projects/CLionProjects/Filozofowie/cmake-build-debug /Users/wodzu/Projects/CLionProjects/Filozofowie/cmake-build-debug/CMakeFiles/Filozofowie.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Filozofowie.dir/depend

