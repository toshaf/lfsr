#include <iostream>

typedef uint16_t counter_t;

static_assert(sizeof(counter_t) == 2, "counter is assumed to be 16 bits wide");

struct LFSR
{
	counter_t state = 1;

	counter_t next()
	{
		// taps at bit 16, 14, 13, 11
		counter_t bit =
			(state >> 15) ^ 
			(state >> 13) ^
			(state >> 12) ^
			(state >> 10);

		return state = (state << 1) | (bit & 1);
	}
};

int main(int argc, const char **argv)
{
	LFSR lfsr;
	const counter_t init = lfsr.state;

	size_t count = 0;

	do
	{
		std::cout << std::hex << lfsr.next() << std::endl;
		++count;
	}
	while (lfsr.state != init);

	std::cout
		<< "arrived back at 0x"
		<< std::hex << init
		<< " after "
		<< count
		<< " iterations"
		<< std::endl;

	std::cout
		<< "The register is"
		<< (count == 0xffff ? "" : "n't")
		<< " maximal"
		<< std::endl;
	
	return count == 0xffff ? 0 : 1;
}
