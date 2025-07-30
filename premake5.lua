project "GLFW"
	location "."
	kind "StaticLib"
	language "C"
	cdialect "C11" -- Changed from cppdialect to cdialect
	staticruntime "Off"

	targetdir ("bin/" .. outdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outdir .. "/%{prj.name}")

	files
	{
		"include/GLFW/**.h",
		"src/**.c",
		"src/**.h",
	}

	includedirs
	{
		"SulfameEngine/vendor/GLFW/include",
	}

	filter "system:windows"
		systemversion "latest"
		defines
		{
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

	filter "configurations:Debug"
		defines { "SE_DEBUG" }
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines { "SE_RELEASE" }
		runtime "Release"
		optimize "On"

	filter "configurations:Dist"
		defines { "SE_DIST" }
		runtime "Release"
		optimize "On"
