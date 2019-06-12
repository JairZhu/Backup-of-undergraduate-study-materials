cmake_minimum_required(VERSION 3.10)
project(alg2018)

set(CMAKE_CXX_STANDARD 14)
FIND_PACKAGE(gtest)

add_executable(1.1mergesort 1.1mergesort.cpp)
target_link_libraries(1.1mergesort gtest)

add_executable(1.2qsort 1.2qsort.cpp)
target_link_libraries(1.2qsort gtest)

add_executable(1.3countingsort 1.3countingsort.cpp)
target_link_libraries(1.3countingsort gtest)

add_executable(1.4findklarge.cpp 1.4findklarge.cpp)
target_link_libraries(1.4findklarge.cpp gtest)

add_executable(6.1maxsubarray.cpp 6.1maxsubarray.cpp)
target_link_libraries(6.1maxsubarray.cpp gtest)

add_executable(6.2BestTimeBuySell.cpp 6.2BestTimeBuySell.cpp)
target_link_libraries(6.2BestTimeBuySell.cpp gtest)

add_executable(6.3MaxProductSubarrary.cpp 6.3MaxProductSubarrary.cpp)
target_link_libraries(6.3MaxProductSubarrary.cpp gtest)

add_executable(1.5CloestPair.cpp 1.5CloestPair.cpp)

add_executable(2.1dfs.cpp 2.1dfs.cpp)
target_link_libraries(2.1dfs.cpp gtest fmt)

add_executable(2.2korasaju.cpp 2.2korasaju.cpp)
target_link_libraries(2.2korasaju.cpp gtest fmt)

add_executable(3.1bfs.cpp 3.1bfs.cpp)
target_link_libraries(3.1bfs.cpp gtest fmt)

add_executable(3.2dijkstra.cpp 3.2dijkstra.cpp)
target_link_libraries(3.2dijkstra.cpp gtest fmt)

add_executable(4.2prim.cpp 4.2prim.cpp)
target_link_libraries(4.2prim.cpp gtest fmt)

add_executable(4.1kruskal.cpp 4.1kruskal.cpp)
target_link_libraries(4.1kruskal.cpp gtest fmt)

add_executable(4.3huffman.cpp 4.3huffman.cpp)
target_link_libraries(4.3huffman.cpp gtest fmt)

add_executable(6.4LongestIncreasingSubsequence.cpp 6.4LongestIncreasingSubsequence.cpp)
target_link_libraries(6.4LongestIncreasingSubsequence.cpp gtest fmt)

add_executable(6.5EditDistance.cpp 6.5EditDistance.cpp)
target_link_libraries(6.5EditDistance.cpp gtest fmt)

add_executable(6.6packing.cpp 6.6packing.cpp)
target_link_libraries(6.6packing.cpp gtest fmt)

add_executable(CF_1.cpp CF_1.cpp)
add_executable(CF_2.cpp CF_2.cpp)
add_executable(CF_3.cpp CF_3.cpp)

add_executable(7.1nQueen.cpp 7.1nQueen.cpp)
target_link_libraries(7.1nQueen.cpp gtest fmt)

add_executable(7.2SumOfSub.cpp 7.2SumOfSub.cpp)
target_link_libraries(7.2SumOfSub.cpp gtest fmt)

add_executable(CF_4.cpp CF_4.cpp)
add_executable(myCF_4.cpp myCF_4.cpp)
