#pragma once

#ifdef HZ_PLATFORM_WINDOWS

extern Hazel::Application* Hazel::CreateApplication();

// Entry point inside the main engine
int main(int argc, char** argv)
{
	auto app = Hazel::CreateApplication();	// New instance of Sandbox
	app->Run();		// Run application infinately for the entire duration of the program
	delete app;
}

#endif