cbuffer Counter : register(b0)
{
	uint counter;
}

struct PositionNormal
{
	float3 pos;
	float3 normal;
};

RWStructuredBuffer<PositionNormal> vertices : register(u0);

[numthreads(16,1,1)]
void main( uint3 dtid : SV_DispatchThreadID)
{
	if (dtid.x < 1178) // _countof(TeapotModel::TeapotVerticesPN)
	{
		if (counter > 0)
		{
			vertices[dtid.x].pos.y -= sin((counter - 1) * 0.1f);
		}

		vertices[dtid.x].pos.y += sin(counter * 0.1f);
	}
}

