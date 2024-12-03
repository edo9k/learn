
import pytest
from main import * 

@pytest.mark.parametrize("input_list, expected", [
    ([0, 1],            [(0,1)]), 
    ([0, 1, 2],         [(0,1),(1,2)]),   
])
def test_tuple_pairs(input_list, expected):
    assert tuple_pairs(input_list) == expected

@pytest.mark.parametrize("input_list, expected", [
    ([7, 6, 4, 2, 1], "DESC" ), 
    ([1, 2, 7, 8, 9], "ASC" ), 
    ([9, 7, 6, 2, 1], "DESC" ), 
    ([1, 3, 2, 4, 5], "ASC" ), 
    ([8, 6, 4, 4, 1], "DESC" ), 
    ([1, 3, 6, 7, 9], "ASC" )  
])
def test_asc_or_desc(input_list, expected):
    assert asc_or_desc(input_list) == expected


@pytest.mark.parametrize("input_list, expected", [
    ( (0,1), False),
    ( (1,0), False),
    ( (1,3), False),
    ( (0,4), True),
    ( (4,0), True), 

])
def test_bad_diff( input_list, expected):
    a, b = input_list
    assert bad_diff(a, b) == expected


@pytest.mark.parametrize("input_list, expected", [
    ( (0,1), True),
    ( (1,0), False), 
    ( (0, 0), False), 
])
def test_increasing( input_list, expected):
    a, b = input_list
    assert increasing(a, b) == expected




@pytest.mark.parametrize("input_list, expected", [
    ( (0,1), False),
    ( (1,0), True), 
    ( (0, 0), False), 
])
def test_decreasing( input_list, expected):
    a, b = input_list
    assert decreasing(a, b) == expected



@pytest.mark.parametrize("input_list, expected", [
    ([7, 6, 4, 2, 1], True ), 
    ([1, 2, 7, 8, 9], False), 
    ([9, 7, 6, 2, 1], False ), 
    ([1, 3, 2, 4, 5], True), 
    ([8, 6, 4, 4, 1], True ), 
    ([1, 3, 6, 7, 9], True)  
])
def test_is_safe(input_list, expected):
    assert is_safe(input_list) == expected

