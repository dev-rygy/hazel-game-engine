#pragma once

#include "Core.h"

namespace Hazel
{
	// HAZEL_API is used as a macro for __declspec(dllexport)
	class HAZEL_API Application
	{
	public:
		Application();				// Constructor
		virtual ~Application();		// Destructor; will be inherited by the sandbox app

		void Run();		// Runs for the duration of the program
	};
	
	// To be defined in the CLIENT
	Application* CreateApplication();

}

