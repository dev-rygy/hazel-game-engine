#include <Hazel.h>

class Sandbox : public Hazel::Application		// Skeleton Class
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