#pragma once

// Macros for dll symbols for easier definition typing
#ifdef HZ_PLATFORM_WINDOWS
	#ifdef HZ_BUILD_DLL
		#define HAZEL_API __declspec(dllexport)	// Set up Hazel dll for export; For Hazel build
	#else
		#define HAZEL_API __declspec(dllimport)	// Set up Hazel dll for import; For Sandbox build
	#endif
#else		
	#error Hazel only supports Windows!
#endif
