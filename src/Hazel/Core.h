#pragma once

// Macros for dll symbols for easier definition typing
// Definition for macros that only apply to Windows
#ifdef HZ_PLATFORM_WINDOWS
	#ifdef HZ_BUILD_DLL
		// HAZEL_API is used as a macro for __declspec(dllexport)
		// Active when building the Hazel library
		#define HAZEL_API __declspec(dllexport)	// Set up Hazel dll for export; For Hazel build
	#else
		#define HAZEL_API __declspec(dllimport)	// Set up Hazel dll for import; For Sandbox build
	#endif
#else		// Trigger error on other platforms
	#error Hazel only supports Windows!


#endif
