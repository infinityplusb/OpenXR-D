import std.stdio;
import openxr_d;

void main()
{
	writeln("Testing");
	print_openxr_api_layers();
}

void print_openxr_api_layers()
    {
        uint count = 0;
        XrApiLayerProperties[] properties;
        XrResult result = xrEnumerateApiLayerProperties(0, count, properties);
        if(!result)
        {
            writeln("Failed to enumerate api layer count");
            return;
        }
        if(result == 0)
        {
            writeln("No api layers found");
            return;
        }
        //XrApiLayerProperties properties = new XrApiLayerProperties[count];
        // for(uint i = 0; i < count; i++)
        // {
        //     properties[i].type = XR_TYPE_API_LAYER_PROPERTIES;
        //     properties[i].next = null;
        // }

        // result = xrEnumerateApiLayerProperties(count, count, properties);
        if(!result)
        {
            writeln("Failed to enumerate api layers");
            return;
        }
        writeln("API Layers:");
        foreach(i ; 1 .. count)
        {
            writefln("\t%s v%d: %s\n", properties[i].layerName, properties[i].layerVersion, properties[i].description);
        }
    }