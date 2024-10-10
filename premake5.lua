workspace "Hazel"
	architecture "x64"
	startproject "Sandbox"

	configurations
	{
		"Debug",	-- Debug Code used to develope
		"Release",	-- Debug but with optomizations and logging; faster version of debug
		"Dist",		-- Distrobution complete and performant build version with absolutely no debugging etc.
	}

-- output directory variable for our application
-- Tokens that premake supplies us with; Macros that premake provides that can help us define things
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
-- Debug > Windows > x64

project "Hazel"
	location "Hazel"	-- File path for generated files
	kind "SharedLib"	-- Specify that our library is a dynamic
	language "C++"

	-- .. <var> .. means append
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	-- bin/Debug/Windows/x64/Hazel

	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")	-- For intermediates

	-- List of files we want included; continuously add file types later
	files
	{				-- **.h means recursively search down the child folders
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	-- List of all include directories
	includedirs
	{
		"%{prj.name}/vendor/spdlog/include"		-- spdlog
	}
	
	-- filter means we have certain configurations that we want only applied to a particular platform
	filter "system:windows"		-- Windows
		cppdialect "C++17"
		staticruntime "On"	-- Linking the runtime libraries statically
		systemversion "latest"	-- Use the latest Windows SDK version

		defines			-- Our macros
		{
			"HZ_PLATFORM_WINDOWS",
			"HZ_BUILD_DLL"
		}

		postbuildcommands
		{
			-- Copy the hazel.dll into the Sandbox dir
			("{COPYFILE} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

	-- Define what happens depending on what config mode is enabled
	filter "configurations:Debug"	-- Debug
		defines "HZ_DEBUG"
		symbols "On"

	filter "configurations:Release"	-- Release
		defines "HZ_RELEASE"
		optimize "On"		-- Turn on optimazation

	filter "configurations:Dist"	-- Dist
		defines "HZ_DIST"
		optimize "On"

	--[[
		-- Filters for targeting multiple options
	filters { "system:windows", "configurations:Release" }
		buildoptions "/MT"
	]]--

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	-- .. <var> .. means append
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	-- bin/Debug/Windows/x64/Hazel

	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")	-- For intermediates

	-- List of files we want included; continuously add file types later
	files
	{				-- **.h means recursively search down the child folders
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	-- List of all include directories
	includedirs 
	{
		"Hazel/vendor/spdlog/include",		-- spdlog
		"Hazel/src"								-- Include Hazel dependancies
	}
	
	-- For Sandbox to link into Hazel
	links
	{
		"Hazel"
	}

	-- filter means we have certain configurations that we want only applied to a particular platform
	filter "system:windows"		-- Windows
		cppdialect "C++17"
		staticruntime "On"	-- Linking the runtime libraries statically
		systemversion "latest"	-- Use the latest Windows SDK version

		defines			-- Our macros
		{
			"HZ_PLATFORM_WINDOWS"
		}

	-- Define what happens depending on what config mode is enabled
	filter "configurations:Debug"	-- Debug
		defines "HZ_DEBUG"
		symbols "On"

	filter "configurations:Release"	-- Release
		defines "HZ_RELEASE"
		optimize "On"		-- Turn on optimazation

	filter "configurations:Dist"	-- Dist
		defines "HZ_DIST"
		optimize "On"