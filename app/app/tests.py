# SAMPLE TESTS  

from django.test import SimpleTestCase #$ import simple test because has no database
from app import calc

class CalcTests(SimpleTestCase): # new class inheriting from SimpleTestCase
    """Teste the calc module"""

    def test_add_numbers(self): # test runner only lok for methods that starts with "test_"
        """Test adding the numbers"""
        res = calc.add(5, 6)
        self.assertEqual(res, 11) # compare the result if is correct

    def test_subtract_numbers(self):
        """Test subtracting the numbers"""
        res = calc.subtract(15, 10)
        self.assertEqual(res, 5) # compare the result if is correct