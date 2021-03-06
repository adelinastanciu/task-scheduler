CXX = g++
CXXFLAGS = -g -O2 -Wall
TEST_INCLUDES = -I./gtest-1.7.0/include
TEST_LINK_FLAGS = -L./gtest-1.7.0/mybuild
TEST_LINK_LIBS = -lgtest -lgtest_main -lpthread

all:
	$(CXX) $(CXXFLAGS) -c node.cpp -std=c++11
	$(CXX) $(CXXFLAGS) -c edge.h -std=c++11
	$(CXX) $(CXXFLAGS) -c scheduler.cpp -std=c++11
	$(CXX) $(CXXFLAGS) -c main.cpp -std=c++11
	$(CXX) $(CXXFLAGS) -o main scheduler.o node.o main.o -std=c++11

test:
	$(CXX) $(TEST_INCLUDES) $(TEST_LINK_FLAGS) test_scheduler.cpp -o test $(TEST_LINK_LIBS) scheduler.o node.o -std=c++11

clean:
	if [ -f "*.o" ]; then rm -f *.o;fi
	if [ -e main ]; then rm -f main; fi;
	if [ -e test ]; then rm -f test; fi;
