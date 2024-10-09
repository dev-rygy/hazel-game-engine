#include <Hazel.h>

// Skeleton Class
class Sandbox : public Hazel::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}
};


Hazel::Application* Hazel::CreateApplication()
{
	return new Sandbox();		// Return the actual application instance
}