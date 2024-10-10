#pragma once

#ifdef HZ_PLATFORM_WINDOWS

// Function that returns an application; defined in Application.h
extern Hazel::Application* Hazel::CreateApplication();

// Entry point inside the main engine
int main(int argc, char** argv)
{
	Hazel::Log::Init();

	int a = 5;
	HZ_CORE_WARN("Initialized Log!");
	HZ_INFO("Hello! Var={0}", a);

	auto app = Hazel::CreateApplication();	// New instance of Sandbox
	app->Run();		// Run application infinately for the entire duration of the program
	delete app;
}

#endif