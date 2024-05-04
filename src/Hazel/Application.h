#pragma once

#include "Core.h"

namespace Hazel
{
	class HAZEL_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();		// Runs for the duration of the program
	};
	
	// To be defined in the CLIENT
	Application* CreateApplication();

}

